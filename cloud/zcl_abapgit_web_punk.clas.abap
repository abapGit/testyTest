CLASS zcl_abapgit_web_punk DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_http_service_extension.
    INTERFACES zif_abapgit_web_request.
    INTERFACES zif_abapgit_web_response.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_abapgit_web_punk IMPLEMENTATION.
  METHOD zif_abapgit_web_response~set_xdata.
    RETURN. " todo, implement method
  ENDMETHOD.

  METHOD zif_abapgit_web_request~get_header_field.
* todo
  ENDMETHOD.

  METHOD zif_abapgit_web_request~get_method.
* todo
  ENDMETHOD.

  METHOD zif_abapgit_web_request~get_cdata.
* todo
  ENDMETHOD.

  METHOD zif_abapgit_web_response~set_content_type.
* todo
  ENDMETHOD.

  METHOD zif_abapgit_web_response~set_cdata.
* todo
  ENDMETHOD.

  METHOD if_http_service_extension~handle_request.

* https://developers.sap.com/tutorials/abap-environment-create-http-service.html

" todo, cl_web_http_server_utility=>set_session_stateful(
"   stateful = cl_web_http_server_utility=>co_enabled
"   path     = '/sap/bc/http/sap/zhttp_state'
"   request  = request ).

* todo

  ENDMETHOD.

ENDCLASS.