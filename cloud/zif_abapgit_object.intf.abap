INTERFACE zif_abapgit_object
  PUBLIC .

  DATA mo_files TYPE REF TO zcl_abapgit_objects_files .

  CONSTANTS:
    BEGIN OF gc_step_id,
      early TYPE zif_abapgit_definitions=>ty_deserialization_step VALUE `EARLY`,
      abap  TYPE zif_abapgit_definitions=>ty_deserialization_step VALUE `ABAP`,
      ddic  TYPE zif_abapgit_definitions=>ty_deserialization_step VALUE `DDIC`,
      late  TYPE zif_abapgit_definitions=>ty_deserialization_step VALUE `LATE`,
    END OF gc_step_id.

  METHODS serialize
    IMPORTING
      !io_xml TYPE REF TO zif_abapgit_xml_output
    RAISING
      zcx_abapgit_exception .
  METHODS deserialize
    IMPORTING
      !iv_package   TYPE I_CustABAPObjDirectoryEntry-ABAPPackage
      !io_xml       TYPE REF TO zif_abapgit_xml_input
      !iv_step      TYPE zif_abapgit_definitions=>ty_deserialization_step
      !ii_log       TYPE REF TO zif_abapgit_log
      !iv_transport TYPE sxco_transport
    RAISING
      zcx_abapgit_exception .
  METHODS delete
    IMPORTING
      !iv_package   TYPE I_CustABAPObjDirectoryEntry-ABAPPackage
      !iv_transport TYPE sxco_transport
    RAISING
      zcx_abapgit_exception .
  METHODS exists
    RETURNING
      VALUE(rv_bool) TYPE abap_bool
    RAISING
      zcx_abapgit_exception .
  METHODS is_locked
    RETURNING
      VALUE(rv_is_locked) TYPE abap_bool
    RAISING
      zcx_abapgit_exception .
  METHODS is_active
    RETURNING
      VALUE(rv_active) TYPE abap_bool
    RAISING
      zcx_abapgit_exception .
  METHODS changed_by
    RETURNING
      VALUE(rv_user) TYPE syuname
    RAISING
      zcx_abapgit_exception .
  METHODS jump
    RETURNING
      VALUE(rv_exit) TYPE abap_bool
    RAISING
      zcx_abapgit_exception .
  METHODS get_metadata
    RETURNING
      VALUE(rs_metadata) TYPE zif_abapgit_definitions=>ty_metadata .
  METHODS get_comparator
    RETURNING
      VALUE(ri_comparator) TYPE REF TO zif_abapgit_comparator
    RAISING
      zcx_abapgit_exception .
  METHODS get_deserialize_steps
    RETURNING
      VALUE(rt_steps) TYPE zif_abapgit_definitions=>ty_deserialization_step_tt .
ENDINTERFACE.
