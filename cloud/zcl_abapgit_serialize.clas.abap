CLASS zcl_abapgit_serialize DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS constructor
      IMPORTING
        !io_dot_abapgit    TYPE REF TO zcl_abapgit_dot_abapgit OPTIONAL
        !is_local_settings TYPE zif_abapgit_persistence=>ty_repo-local_settings OPTIONAL
      RAISING
        zcx_abapgit_exception .
    METHODS on_end_of_task
      IMPORTING
        !p_task TYPE clike ##NEEDED.
    METHODS serialize
      IMPORTING
        !iv_package          TYPE I_CustABAPObjDirectoryEntry-ABAPPackage OPTIONAL
        !it_tadir            TYPE zif_abapgit_definitions=>ty_tadir_tt
        !ii_log              TYPE REF TO zif_abapgit_log OPTIONAL
        !iv_force_sequential TYPE abap_bool DEFAULT abap_false
      RETURNING
        VALUE(rt_files)      TYPE zif_abapgit_definitions=>ty_files_item_tt
      RAISING
        zcx_abapgit_exception .
    METHODS files_local
      IMPORTING
        !iv_package     TYPE I_CustABAPObjDirectoryEntry-ABAPPackage
        !ii_log         TYPE REF TO zif_abapgit_log
        !it_filter      TYPE zif_abapgit_definitions=>ty_tadir_tt OPTIONAL
        !ii_data_config TYPE REF TO zif_abapgit_data_config OPTIONAL
      RETURNING
        VALUE(rt_files) TYPE zif_abapgit_definitions=>ty_files_item_tt
      RAISING
        zcx_abapgit_exception .
  PROTECTED SECTION.

    TYPES:
      BEGIN OF ty_unsupported_count,
        obj_type TYPE I_CustABAPObjDirectoryEntry-ABAPObjectType,
        obj_name TYPE I_CustABAPObjDirectoryEntry-ABAPObject,
        count    TYPE i,
      END OF ty_unsupported_count .
    TYPES:
      ty_unsupported_count_tt TYPE HASHED TABLE OF ty_unsupported_count WITH UNIQUE KEY obj_type .
    TYPES:
      ty_char32 TYPE c LENGTH 32 .

    METHODS add_apack
      IMPORTING
        !iv_package TYPE I_CustABAPObjDirectoryEntry-ABAPPackage
      CHANGING
        !ct_files   TYPE zif_abapgit_definitions=>ty_files_item_tt
      RAISING
        zcx_abapgit_exception .
    METHODS add_data
      IMPORTING
        !ii_data_config TYPE REF TO zif_abapgit_data_config
      CHANGING
        !ct_files       TYPE zif_abapgit_definitions=>ty_files_item_tt
      RAISING
        zcx_abapgit_exception .
    METHODS add_dot_abapgit
      CHANGING
        !ct_files TYPE zif_abapgit_definitions=>ty_files_item_tt
      RAISING
        zcx_abapgit_exception .
    METHODS add_to_return
      IMPORTING
        !iv_path      TYPE string
        !is_file_item TYPE zif_abapgit_objects=>ty_serialization .
    METHODS run_parallel
      IMPORTING
        !is_tadir TYPE zif_abapgit_definitions=>ty_tadir
        !iv_task  TYPE ty_char32
      RAISING
        zcx_abapgit_exception .
    METHODS run_sequential
      IMPORTING
        !is_tadir TYPE zif_abapgit_definitions=>ty_tadir
      RAISING
        zcx_abapgit_exception .
    METHODS add_objects
      IMPORTING
        !iv_package     TYPE I_CustABAPObjDirectoryEntry-ABAPPackage
        !ii_log         TYPE REF TO zif_abapgit_log
        !it_filter      TYPE zif_abapgit_definitions=>ty_tadir_tt OPTIONAL
      CHANGING
        VALUE(ct_files) TYPE zif_abapgit_definitions=>ty_files_item_tt
      RAISING
        zcx_abapgit_exception .
    METHODS determine_max_threads
      IMPORTING
        !iv_force_sequential TYPE abap_bool DEFAULT abap_false
      RETURNING
        VALUE(rv_threads)    TYPE i
      RAISING
        zcx_abapgit_exception .
    METHODS filter_unsupported_objects
      CHANGING
        !ct_tadir TYPE zif_abapgit_definitions=>ty_tadir_tt .
    METHODS filter_ignored_objects
      IMPORTING
        !iv_package TYPE I_CustABAPObjDirectoryEntry-ABAPPackage
      CHANGING
        !ct_tadir   TYPE zif_abapgit_definitions=>ty_tadir_tt
      RAISING
        zcx_abapgit_exception .
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_abapgit_serialize IMPLEMENTATION.


  METHOD add_apack.

    ASSERT 1 = 'decuopled'.

  ENDMETHOD.


  METHOD add_data.

    ASSERT 1 = 'decuopled'.

  ENDMETHOD.


  METHOD add_dot_abapgit.

    ASSERT 1 = 'decuopled'.
  ENDMETHOD.


  METHOD add_objects.

    ASSERT 1 = 'decuopled'.

  ENDMETHOD.


  METHOD add_to_return.
    ASSERT 1 = 'decuopled'.

  ENDMETHOD.


  METHOD constructor.
    RETURN.
  ENDMETHOD.


  METHOD determine_max_threads.
    ASSERT 1 = 'decuopled'.

  ENDMETHOD.


  METHOD files_local.
    RETURN.
  ENDMETHOD.


  METHOD filter_ignored_objects.

    ASSERT 1 = 'decuopled'.

  ENDMETHOD.


  METHOD filter_unsupported_objects.


    ASSERT 1 = 'decuopled'.

  ENDMETHOD.


  METHOD on_end_of_task.

    ASSERT 1 = 'decuopled'.

  ENDMETHOD.


  METHOD run_parallel.

    ASSERT 1 = 'decuopled'.

  ENDMETHOD.


  METHOD run_sequential.

    ASSERT 1 = 'decuopled'.
  ENDMETHOD.


  METHOD serialize.

    ASSERT 1 = 'decuopled'.

  ENDMETHOD.
ENDCLASS.