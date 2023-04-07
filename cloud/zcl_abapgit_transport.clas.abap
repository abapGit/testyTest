CLASS zcl_abapgit_transport DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
* todo, add interfaces for this class, consider merging zcl_abapgit_transport_mass into this class?
    CLASS-METHODS zip
      IMPORTING
        !iv_show_log_popup TYPE abap_bool DEFAULT abap_true
        !iv_logic          TYPE string OPTIONAL
        !is_trkorr         TYPE any OPTIONAL
      RETURNING
        VALUE(rv_xstr)     TYPE xstring
      RAISING
        zcx_abapgit_exception .

    CLASS-METHODS to_tadir
      IMPORTING
        it_transport_headers TYPE any
      RETURNING
        VALUE(rt_tadir)      TYPE zif_abapgit_definitions=>ty_tadir_tt
      RAISING
        zcx_abapgit_exception .

    CLASS-METHODS add_all_objects_to_trans_req
      IMPORTING
        iv_key TYPE zif_abapgit_persistence=>ty_value
      RAISING
        zcx_abapgit_exception .

    CLASS-METHODS read
      IMPORTING
        !is_trkorr        TYPE any OPTIONAL
      RETURNING
        VALUE(rs_request) TYPE string
      RAISING
        zcx_abapgit_exception .

    CLASS-METHODS validate_transport_request
      IMPORTING
        iv_transport_request TYPE sxco_transport
      RAISING
        zcx_abapgit_exception.

ENDCLASS.



CLASS zcl_abapgit_transport IMPLEMENTATION.
  METHOD add_all_objects_to_trans_req.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

  METHOD read.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

  METHOD to_tadir.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

  METHOD validate_transport_request.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

  METHOD zip.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.
ENDCLASS.