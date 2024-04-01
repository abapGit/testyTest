CLASS zcl_abapgit_objects_super DEFINITION
  PUBLIC
  ABSTRACT
  CREATE PUBLIC .

  PUBLIC SECTION.

    CONSTANTS c_user_unknown TYPE syuname VALUE 'UNKNOWN'.

    METHODS constructor
      IMPORTING
        !is_item     TYPE zif_abapgit_definitions=>ty_item
        !iv_language TYPE spras .
  PROTECTED SECTION.

    DATA ms_item TYPE zif_abapgit_definitions=>ty_item .
    DATA mv_language TYPE spras .

    METHODS get_metadata
      RETURNING
        VALUE(rs_metadata) TYPE zif_abapgit_definitions=>ty_metadata .
    METHODS corr_insert
      IMPORTING
        !iv_package      TYPE devclass
        !ig_object_class TYPE any OPTIONAL
      RAISING
        zcx_abapgit_exception .
    METHODS tadir_insert
      IMPORTING
        !iv_package TYPE devclass
      RAISING
        zcx_abapgit_exception .
    METHODS tadir_delete
      RAISING
        zcx_abapgit_exception .
    METHODS exists_a_lock_entry_for
      IMPORTING
        !iv_lock_object               TYPE string
        !iv_argument                  TYPE string OPTIONAL
      RETURNING
        VALUE(rv_exists_a_lock_entry) TYPE abap_bool
      RAISING
        zcx_abapgit_exception .
    METHODS set_default_package
      IMPORTING
        !iv_package TYPE devclass .
    METHODS set_default_transport
      IMPORTING
        !iv_transport TYPE trkorr.
    METHODS serialize_longtexts
      IMPORTING
        !ii_xml           TYPE REF TO zif_abapgit_xml_output
        !iv_longtext_id   TYPE string OPTIONAL
        !it_dokil         TYPE zif_abapgit_definitions=>ty_dokil_tt OPTIONAL
        !iv_longtext_name TYPE string DEFAULT 'LONGTEXTS'
      RAISING
        zcx_abapgit_exception .
    METHODS deserialize_longtexts
      IMPORTING
        !ii_xml           TYPE REF TO zif_abapgit_xml_input
        !iv_longtext_id   TYPE string OPTIONAL
        !iv_longtext_name TYPE string DEFAULT 'LONGTEXTS'
      RAISING
        zcx_abapgit_exception .
    METHODS delete_longtexts
      IMPORTING
        !iv_longtext_id TYPE string
      RAISING
        zcx_abapgit_exception .
    METHODS is_active
      RETURNING
        VALUE(rv_active) TYPE abap_bool
      RAISING
        zcx_abapgit_exception .
    METHODS delete_ddic
      IMPORTING
        VALUE(iv_objtype)              TYPE string
        VALUE(iv_no_ask)               TYPE abap_bool DEFAULT abap_true
        VALUE(iv_no_ask_delete_append) TYPE abap_bool DEFAULT abap_false
      RAISING
        zcx_abapgit_exception .
    METHODS serialize_lxe_texts
      IMPORTING
        !ii_xml TYPE REF TO zif_abapgit_xml_output
      RAISING
        zcx_abapgit_exception .
    METHODS deserialize_lxe_texts
      IMPORTING
        !ii_xml TYPE REF TO zif_abapgit_xml_input
      RAISING
        zcx_abapgit_exception .
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_abapgit_objects_super IMPLEMENTATION.


  METHOD constructor.
    ms_item = is_item.
    ASSERT NOT ms_item IS INITIAL.
    mv_language = iv_language.
    ASSERT NOT mv_language IS INITIAL.
  ENDMETHOD.


  METHOD corr_insert.

    ASSERT 1 = 'decoupled'.
  ENDMETHOD.


  METHOD delete_ddic.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD delete_longtexts.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD deserialize_longtexts.

    ASSERT 1 = 'decoupled'.
  ENDMETHOD.


  METHOD deserialize_lxe_texts.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD exists_a_lock_entry_for.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD get_metadata.

    DATA: lv_class TYPE string.

    lv_class = cl_abap_classdescr=>describe_by_object_ref( me )->get_relative_name( ).

    REPLACE FIRST OCCURRENCE OF 'ZCL_ABAPGIT' IN lv_class WITH 'LCL'.

    rs_metadata-class = lv_class.
    rs_metadata-version = 'v1.0.0'.

  ENDMETHOD.


  METHOD is_active.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD serialize_longtexts.

    ASSERT 1 = 'decoupled'.
  ENDMETHOD.


  METHOD serialize_lxe_texts.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD set_default_package.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD set_default_transport.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD tadir_delete.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD tadir_insert.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.
ENDCLASS.