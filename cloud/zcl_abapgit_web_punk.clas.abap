CLASS zcl_abapgit_web_punk DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_http_service_extension.
    INTERFACES zif_abapgit_web_request.
    INTERFACES zif_abapgit_web_response.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA mi_request TYPE REF TO if_web_http_request.
    DATA mi_response TYPE REF TO if_web_http_response.
ENDCLASS.

CLASS zcl_abapgit_web_punk IMPLEMENTATION.

  METHOD zif_abapgit_web_request~get_header_field.
    rv_value = mi_request->get_header_field( iv_name ).
  ENDMETHOD.

  METHOD zif_abapgit_web_request~get_method.
    rv_method = mi_request->get_method( ).
  ENDMETHOD.

  METHOD zif_abapgit_web_request~get_cdata.
    rv_data = mi_request->get_text( ).
  ENDMETHOD.

  METHOD zif_abapgit_web_response~set_content_type.
    mi_response->set_content_type( iv_type ).
  ENDMETHOD.

  METHOD zif_abapgit_web_response~set_cdata.
    mi_response->set_text( iv_data ).
  ENDMETHOD.

  METHOD zif_abapgit_web_response~set_xdata.
    mi_response->set_binary( iv_data ).
  ENDMETHOD.

  METHOD if_http_service_extension~handle_request.

* https://developers.sap.com/tutorials/abap-environment-create-http-service.html

    cl_web_http_server_utility=>set_session_stateful(
      stateful = cl_web_http_server_utility=>co_enabled
      path     = '/sap/bc/http/sap/zabapgit'
      request  = request ).

    zcl_abapgit_web=>handle(
      ii_request  = me
      ii_response = me ).

  ENDMETHOD.

ENDCLASS.