CLASS zcl_abapgit_objects_files DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS constructor
      IMPORTING
        !is_item TYPE zif_abapgit_definitions=>ty_item
        !iv_path TYPE string OPTIONAL .
    METHODS add_string
      IMPORTING
        !iv_extra  TYPE clike OPTIONAL
        !iv_ext    TYPE string
        !iv_string TYPE string
      RAISING
        zcx_abapgit_exception .
    METHODS read_string
      IMPORTING
        !iv_extra        TYPE clike OPTIONAL
        !iv_ext          TYPE string
      RETURNING
        VALUE(rv_string) TYPE string
      RAISING
        zcx_abapgit_exception .
    METHODS add_xml
      IMPORTING
        !iv_extra     TYPE clike OPTIONAL
        !ii_xml       TYPE REF TO zif_abapgit_xml_output
        !iv_normalize TYPE abap_bool DEFAULT abap_true
        !is_metadata  TYPE zif_abapgit_definitions=>ty_metadata OPTIONAL
      RAISING
        zcx_abapgit_exception .
    METHODS read_xml
      IMPORTING
        !iv_extra     TYPE clike OPTIONAL
      RETURNING
        VALUE(ri_xml) TYPE REF TO zif_abapgit_xml_input
      RAISING
        zcx_abapgit_exception .
    METHODS read_abap
      IMPORTING
        !iv_extra      TYPE clike OPTIONAL
        !iv_error      TYPE abap_bool DEFAULT abap_true
      RETURNING
        VALUE(rt_abap) TYPE string_table
      RAISING
        zcx_abapgit_exception .
    METHODS add_abap
      IMPORTING
        !iv_extra TYPE clike OPTIONAL
        !it_abap  TYPE STANDARD TABLE
      RAISING
        zcx_abapgit_exception .
    METHODS add
      IMPORTING
        !is_file TYPE zif_abapgit_git_definitions=>ty_file .
    METHODS add_raw
      IMPORTING
        !iv_extra TYPE clike OPTIONAL
        !iv_ext   TYPE string
        !iv_data  TYPE xstring.
    METHODS read_raw
      IMPORTING
        !iv_extra      TYPE clike OPTIONAL
        !iv_ext        TYPE string
      RETURNING
        VALUE(rv_data) TYPE xstring
      RAISING
        zcx_abapgit_exception .
    METHODS get_files
      RETURNING
        VALUE(rt_files) TYPE zif_abapgit_git_definitions=>ty_files_tt .
    METHODS set_files
      IMPORTING
        !it_files TYPE zif_abapgit_git_definitions=>ty_files_tt .
    METHODS get_accessed_files
      RETURNING
        VALUE(rt_files) TYPE zif_abapgit_git_definitions=>ty_file_signatures_tt .
    METHODS contains_file
      IMPORTING
        !iv_extra         TYPE clike OPTIONAL
        !iv_ext           TYPE string
      RETURNING
        VALUE(rv_present) TYPE abap_bool .
    METHODS get_file_pattern
      RETURNING
        VALUE(rv_pattern) TYPE string .
    METHODS is_json_metadata
      RETURNING
        VALUE(rv_result) TYPE abap_bool.
  PROTECTED SECTION.

    METHODS read_file
      IMPORTING
        !iv_filename   TYPE string
        !iv_error      TYPE abap_bool DEFAULT abap_true
      RETURNING
        VALUE(rv_data) TYPE xstring
      RAISING
        zcx_abapgit_exception .
  PRIVATE SECTION.

    DATA ms_item TYPE zif_abapgit_definitions=>ty_item .
    DATA mt_accessed_files TYPE zif_abapgit_git_definitions=>ty_file_signatures_tt .
    DATA mt_files TYPE zif_abapgit_git_definitions=>ty_files_tt .
    DATA mv_path TYPE string .
ENDCLASS.



CLASS zcl_abapgit_objects_files IMPLEMENTATION.


  METHOD add.
    APPEND is_file TO mt_files.
  ENDMETHOD.


  METHOD add_abap.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD add_raw.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD add_string.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD add_xml.

    ASSERT 1 = 'decoupled'.
  ENDMETHOD.


  METHOD constructor.
    ms_item = is_item.
    mv_path = iv_path.
  ENDMETHOD.


  METHOD contains_file.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.


  METHOD get_accessed_files.
    rt_files = mt_accessed_files.
  ENDMETHOD.


  METHOD get_files.
    rt_files = mt_files.
  ENDMETHOD.


  METHOD get_file_pattern.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.


  METHOD is_json_metadata.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD read_abap.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD read_file.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD read_raw.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD read_string.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD read_xml.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD set_files.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.
ENDCLASS.