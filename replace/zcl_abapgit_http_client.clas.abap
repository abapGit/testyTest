CLASS zcl_abapgit_http_client DEFINITION PUBLIC CREATE PUBLIC.

  PUBLIC SECTION.

    METHODS:
      constructor
        IMPORTING ii_client TYPE REF TO object,
      close,
      set_digest
        IMPORTING io_digest TYPE REF TO zcl_abapgit_http_digest,
      send_receive_close
        IMPORTING iv_data        TYPE xstring
        RETURNING VALUE(rv_data) TYPE xstring
        RAISING   zcx_abapgit_exception,
      get_cdata
        RETURNING VALUE(rv_value) TYPE string,
      check_http_200
        RAISING zcx_abapgit_exception,
      check_smart_response
        IMPORTING iv_expected_content_type TYPE string
                  iv_content_regex         TYPE string
        RAISING   zcx_abapgit_exception,
      send_receive
        RAISING zcx_abapgit_exception,
      set_headers
        IMPORTING iv_url     TYPE string
                  iv_service TYPE string
        RAISING   zcx_abapgit_exception.

ENDCLASS.



CLASS zcl_abapgit_http_client IMPLEMENTATION.


  METHOD check_http_200.
    ASSERT 1 = 'todo'.
  ENDMETHOD.


  METHOD check_smart_response.

    ASSERT 1 = 'todo'.

  ENDMETHOD.


  METHOD close.
    ASSERT 1 = 'todo'.
  ENDMETHOD.


  METHOD constructor.
    ASSERT 1 = 'todo'.
  ENDMETHOD.


  METHOD get_cdata.
    ASSERT 1 = 'todo'.
  ENDMETHOD.


  METHOD send_receive.
    ASSERT 1 = 'todo'.
  ENDMETHOD.


  METHOD send_receive_close.
    ASSERT 1 = 'todo'.
  ENDMETHOD.


  METHOD set_digest.
    ASSERT 1 = 'todo'.
  ENDMETHOD.


  METHOD set_headers.
    ASSERT 1 = 'todo'.
  ENDMETHOD.
ENDCLASS.