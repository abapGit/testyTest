CLASS zcl_abapgit_web_sicf DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_http_extension .

  PROTECTED SECTION.

    CONSTANTS gc_base TYPE string VALUE '/sap/zabapgit/' ##NO_TEXT.
    CLASS-DATA mo_viewer TYPE REF TO zcl_abapgit_html_viewer_web .
    CLASS-DATA mo_gui TYPE REF TO zcl_abapgit_gui .

    CLASS-METHODS initialize
      IMPORTING
        !ii_server TYPE REF TO if_http_server .
    CLASS-METHODS sapevent
      IMPORTING
        !ii_server TYPE REF TO if_http_server .
    CLASS-METHODS redirect
      IMPORTING
        !ii_server TYPE REF TO if_http_server .
    CLASS-METHODS search_asset
      IMPORTING
        !ii_server      TYPE REF TO if_http_server
      RETURNING
        VALUE(rv_found) TYPE abap_bool .
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_abapgit_web_sicf IMPLEMENTATION.


  METHOD if_http_extension~handle_request.

    DATA lv_found TYPE abap_bool.
    DATA lv_path TYPE string.

* todo, express vs static vs stateful?
    server->set_session_stateful( ).

    IF mo_viewer IS INITIAL.
      initialize( server ).
    ENDIF.

    lv_found = search_asset( server ).
    IF lv_found = abap_true.
      RETURN.
    ENDIF.

    lv_path = cl_http_utility=>if_http_utility~unescape_url( server->request->get_header_field( '~path' ) ).
    IF lv_path = '/sap/zabapgit'.
      redirect( server ).
    ELSEIF lv_path = gc_base.
      mo_gui->go_home( ).
    ELSEIF lv_path = |{ gc_base }css/bundle.css|.
      mo_viewer->zif_abapgit_html_viewer~show_url( |css/bundle.css| ).
    ELSEIF lv_path CP |{ gc_base }sapevent:+*|.
      sapevent( server ).
    ELSE.
      server->response->set_content_type( 'text/html' ).
      server->response->set_cdata( 'handle_request, unknown path ' && lv_path ).
    ENDIF.

  ENDMETHOD.


  METHOD initialize.

    CREATE OBJECT mo_viewer
      EXPORTING
        ii_server = ii_server.

    zcl_abapgit_ui_injector=>set_html_viewer( mo_viewer ).

    mo_gui = zcl_abapgit_ui_factory=>get_gui( ).

  ENDMETHOD.


  METHOD redirect.

    DATA lv_html TYPE string.

    lv_html =
      |<!DOCTYPE html>\n| &&
      |<html>\n| &&
      |   <head>\n| &&
      |      <title>HTML Meta Tag</title>\n| &&
      |      <meta http-equiv = "refresh" content = "0; url = { gc_base }" />\n| &&
      |   </head>\n| &&
      |   <body>\n| &&
      |      <p>Redirecting</p>\n| &&
      |   </body>\n| &&
      |</html>|.

    ii_server->response->set_cdata( lv_html ).

  ENDMETHOD.


  METHOD sapevent.

* todo, parse and pass data
* todo, respect GET and POST

    DATA: lv_action   TYPE c LENGTH 100,
          lv_getdata  TYPE c LENGTH 100,
          lv_method   TYPE string,
          lv_body     TYPE string,
          lv_value    TYPE string,
          lt_postdata TYPE zif_abapgit_html_viewer=>ty_post_data.

    lv_value = ii_server->request->get_header_field( '~request_uri' ).

    REPLACE FIRST OCCURRENCE OF gc_base IN lv_value WITH ''.

    FIND REGEX '^sapevent:([\w-]+)' IN lv_value SUBMATCHES lv_action.

    FIND REGEX '\?([\w=&]+)' IN lv_value SUBMATCHES lv_getdata.

    lv_method = ii_server->request->get_method( ).
    IF lv_method = 'POST'.
      lv_body = ii_server->request->get_cdata( ).
* sdf      WRITE '@KERNEL console.dir(lv_body);'.

      zcl_abapgit_convert=>string_to_tab(
        EXPORTING
          iv_str = lv_body
        IMPORTING
          et_tab = lt_postdata ).
    ENDIF.

    mo_gui->on_event(
      action   = lv_action
      getdata  = ''
      postdata = lt_postdata ).

* sdf     getdata     = iv_getdata
* sdf     postdata    = VALUE #( )
* sdf     query_table = VALUE #( ).

  ENDMETHOD.


  METHOD search_asset.

    DATA ls_asset TYPE zif_abapgit_gui_asset_manager=>ty_web_asset.
    DATA lv_search TYPE string.
    DATA lv_path TYPE string.
    DATA li_assets TYPE REF TO zif_abapgit_gui_asset_manager.


    lv_path = cl_http_utility=>if_http_utility~unescape_url( ii_server->request->get_header_field( '~path' ) ).

    li_assets = zcl_abapgit_ui_factory=>get_asset_manager( ).

    IF lv_path CP |{ gc_base }+*|.
      lv_search = lv_path.
      REPLACE FIRST OCCURRENCE OF gc_base IN lv_search WITH ''.
      TRY.
          ls_asset = li_assets->get_asset( lv_search ).
          ii_server->response->set_content_type( |{ ls_asset-type }/{ ls_asset-subtype }| ).
          ii_server->response->set_data( ls_asset-content ).
          rv_found = abap_true.
        CATCH zcx_abapgit_exception.
          rv_found = abap_false.
      ENDTRY.
    ENDIF.

  ENDMETHOD.
ENDCLASS.