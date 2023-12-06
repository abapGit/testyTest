"! Change transport system API
CLASS zcl_abapgit_cts_api DEFINITION
  PUBLIC
  FINAL
  CREATE PRIVATE
  GLOBAL FRIENDS zcl_abapgit_factory.

  PUBLIC SECTION.
    INTERFACES zif_abapgit_cts_api.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_abapgit_cts_api IMPLEMENTATION.

  METHOD zif_abapgit_cts_api~confirm_transport_messages.
    RETURN.
  ENDMETHOD.

  METHOD zif_abapgit_cts_api~create_transport_entries.
    RETURN.
  ENDMETHOD.

  METHOD zif_abapgit_cts_api~get_r3tr_obj_for_limu_obj.
    RETURN.
  ENDMETHOD.

  METHOD zif_abapgit_cts_api~get_transports_for_list.
    RETURN.
  ENDMETHOD.

  METHOD zif_abapgit_cts_api~get_transport_for_object.
    RETURN.
  ENDMETHOD.

  METHOD zif_abapgit_cts_api~insert_transport_object.
    RETURN.
  ENDMETHOD.

  METHOD zif_abapgit_cts_api~is_chrec_possible_for_package.
    RETURN.
  ENDMETHOD.

  METHOD zif_abapgit_cts_api~list_open_requests_by_user.
    RETURN.
  ENDMETHOD.

  METHOD zif_abapgit_cts_api~list_r3tr_by_request.
    RETURN.
  ENDMETHOD.

  METHOD zif_abapgit_cts_api~read.
    RETURN.
  ENDMETHOD.

  METHOD zif_abapgit_cts_api~read_description.
    RETURN.
  ENDMETHOD.

  METHOD zif_abapgit_cts_api~read_user.
    RETURN.
  ENDMETHOD.

  METHOD zif_abapgit_cts_api~validate_transport_request.
    RETURN.
  ENDMETHOD.
ENDCLASS.
