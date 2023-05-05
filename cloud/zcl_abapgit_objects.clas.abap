CLASS zcl_abapgit_objects DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES:
      ty_types_tt TYPE SORTED TABLE OF I_CustABAPObjDirectoryEntry-ABAPObjectType WITH UNIQUE KEY table_line .
    TYPES:
      BEGIN OF ty_serialization,
        files TYPE zif_abapgit_git_definitions=>ty_files_tt,
        item  TYPE zif_abapgit_definitions=>ty_item,
      END OF ty_serialization .

    CLASS-METHODS serialize
      IMPORTING
        !is_item                 TYPE zif_abapgit_definitions=>ty_item
        !iv_language             TYPE spras
        !iv_main_language_only   TYPE abap_bool DEFAULT abap_false
        !it_translation_langs    TYPE zif_abapgit_definitions=>ty_languages OPTIONAL
      RETURNING
        VALUE(rs_files_and_item) TYPE ty_serialization
      RAISING
        zcx_abapgit_exception .
    CLASS-METHODS deserialize
      IMPORTING
        !io_repo                 TYPE REF TO zcl_abapgit_repo
        !is_checks               TYPE zif_abapgit_definitions=>ty_deserialize_checks
        !ii_log                  TYPE REF TO zif_abapgit_log
      RETURNING
        VALUE(rt_accessed_files) TYPE zif_abapgit_git_definitions=>ty_file_signatures_tt
      RAISING
        zcx_abapgit_exception .
    CLASS-METHODS deserialize_checks
      IMPORTING
        !io_repo         TYPE REF TO zcl_abapgit_repo
      RETURNING
        VALUE(rs_checks) TYPE zif_abapgit_definitions=>ty_deserialize_checks
      RAISING
        zcx_abapgit_exception .
    CLASS-METHODS delete
      IMPORTING
        !it_tadir  TYPE zif_abapgit_definitions=>ty_tadir_tt
        !is_checks TYPE zif_abapgit_definitions=>ty_delete_checks OPTIONAL
        !ii_log    TYPE REF TO zif_abapgit_log OPTIONAL
      RAISING
        zcx_abapgit_exception .
    CLASS-METHODS jump
      IMPORTING
        !is_item        TYPE zif_abapgit_definitions=>ty_item
        !is_sub_item    TYPE zif_abapgit_definitions=>ty_item OPTIONAL
        !iv_extra       TYPE string OPTIONAL
        !iv_line_number TYPE i OPTIONAL
      RAISING
        zcx_abapgit_exception .
    CLASS-METHODS changed_by
      IMPORTING
        !is_item       TYPE zif_abapgit_definitions=>ty_item
      RETURNING
        VALUE(rv_user) TYPE syuname .
    CLASS-METHODS is_supported
      IMPORTING
        !is_item        TYPE zif_abapgit_definitions=>ty_item
        !iv_native_only TYPE abap_bool DEFAULT abap_false
      RETURNING
        VALUE(rv_bool)  TYPE abap_bool .
    CLASS-METHODS is_type_supported
      IMPORTING
        !iv_obj_type   TYPE zif_abapgit_definitions=>ty_item-obj_type
      RETURNING
        VALUE(rv_bool) TYPE abap_bool .
    CLASS-METHODS exists
      IMPORTING
        !is_item       TYPE zif_abapgit_definitions=>ty_item
      RETURNING
        VALUE(rv_bool) TYPE abap_bool .
    CLASS-METHODS supported_list
      RETURNING
        VALUE(rt_types) TYPE ty_types_tt .
    CLASS-METHODS is_active
      IMPORTING
        !is_item         TYPE zif_abapgit_definitions=>ty_item
      RETURNING
        VALUE(rv_active) TYPE abap_bool
      RAISING
        zcx_abapgit_exception .
  PROTECTED SECTION.

  PRIVATE SECTION.

    TYPES:
      BEGIN OF ty_supported_types,
        obj_type  TYPE I_CustABAPObjDirectoryEntry-ABAPObjectType,
        supported TYPE abap_bool,
      END OF ty_supported_types.

    TYPES: ty_supported_types_tt TYPE SORTED TABLE OF ty_supported_types WITH UNIQUE KEY obj_type.

    TYPES:
      BEGIN OF ty_obj_serializer_item,
        item     TYPE zif_abapgit_definitions=>ty_item,
        metadata TYPE zif_abapgit_definitions=>ty_metadata,
      END OF ty_obj_serializer_item .
    TYPES:
      ty_obj_serializer_map TYPE SORTED TABLE OF ty_obj_serializer_item WITH UNIQUE KEY item .

    CLASS-DATA gt_obj_serializer_map TYPE ty_obj_serializer_map .
    CLASS-DATA gt_supported_obj_types TYPE ty_supported_types_tt .
    CLASS-DATA gv_supported_obj_types_loaded TYPE abap_bool .

    CLASS-METHODS check_duplicates
      IMPORTING
        !it_files TYPE zif_abapgit_git_definitions=>ty_files_tt
      RAISING
        zcx_abapgit_exception .
    CLASS-METHODS class_name
      IMPORTING
        !is_item             TYPE zif_abapgit_definitions=>ty_item
      RETURNING
        VALUE(rv_class_name) TYPE string .
    CLASS-METHODS update_package_tree
      IMPORTING
        !iv_package TYPE I_CustABAPObjDirectoryEntry-ABAPPackage .
    CLASS-METHODS delete_object
      IMPORTING
        !iv_package   TYPE I_CustABAPObjDirectoryEntry-ABAPPackage
        !is_item      TYPE zif_abapgit_definitions=>ty_item
        !iv_transport TYPE sxco_transport
      RAISING
        zcx_abapgit_exception .
    CLASS-METHODS compare_remote_to_local
      IMPORTING
        !ii_object TYPE REF TO zif_abapgit_object
        !it_remote TYPE zif_abapgit_git_definitions=>ty_files_tt
        !is_result TYPE zif_abapgit_definitions=>ty_result
        !ii_log    TYPE REF TO zif_abapgit_log
      RAISING
        zcx_abapgit_exception .
    CLASS-METHODS deserialize_objects
      IMPORTING
        !is_step      TYPE zif_abapgit_objects=>ty_step_data
        !ii_log       TYPE REF TO zif_abapgit_log
        !iv_transport TYPE sxco_transport
      CHANGING
        !ct_files     TYPE zif_abapgit_git_definitions=>ty_file_signatures_tt
      RAISING
        zcx_abapgit_exception .
    CLASS-METHODS check_objects_locked
      IMPORTING
        !iv_language TYPE spras
        !it_items    TYPE zif_abapgit_definitions=>ty_items_tt
      RAISING
        zcx_abapgit_exception .
    CLASS-METHODS create_object
      IMPORTING
        !is_item        TYPE zif_abapgit_definitions=>ty_item
        !iv_language    TYPE spras
        !is_metadata    TYPE zif_abapgit_definitions=>ty_metadata OPTIONAL
        !iv_native_only TYPE abap_bool DEFAULT abap_false
      RETURNING
        VALUE(ri_obj)   TYPE REF TO zif_abapgit_object
      RAISING
        zcx_abapgit_exception .
    CLASS-METHODS map_tadir_to_items
      IMPORTING
        !it_tadir       TYPE zif_abapgit_definitions=>ty_tadir_tt
      RETURNING
        VALUE(rt_items) TYPE zif_abapgit_definitions=>ty_items_tt .
    CLASS-METHODS map_results_to_items
      IMPORTING
        !it_results     TYPE zif_abapgit_definitions=>ty_results_tt
      RETURNING
        VALUE(rt_items) TYPE zif_abapgit_definitions=>ty_items_tt .
    CLASS-METHODS get_deserialize_steps
      RETURNING
        VALUE(rt_steps) TYPE zif_abapgit_objects=>ty_step_data_tt .
    CLASS-METHODS check_main_package
      IMPORTING
        !iv_package  TYPE I_CustABAPObjDirectoryEntry-ABAPPackage
        !iv_obj_type TYPE I_CustABAPObjDirectoryEntry-ABAPObjectType
      RAISING
        zcx_abapgit_exception .
    CLASS-METHODS change_package_assignments
      IMPORTING
        !is_item TYPE zif_abapgit_definitions=>ty_item
        !ii_log  TYPE REF TO zif_abapgit_log .
ENDCLASS.



CLASS zcl_abapgit_objects IMPLEMENTATION.


  METHOD changed_by.

    ASSERT 1 = 'decoupled'.
  ENDMETHOD.


  METHOD change_package_assignments.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD check_duplicates.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD check_main_package.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD check_objects_locked.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD class_name.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD compare_remote_to_local.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD create_object.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD delete.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD delete_object.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD deserialize.

    ASSERT 1 = 'decoupled'.
  ENDMETHOD.


  METHOD deserialize_checks.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD deserialize_objects.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD exists.
* todo
    rv_bool = abap_false.
  ENDMETHOD.


  METHOD get_deserialize_steps.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.


  METHOD is_active.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD is_supported.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD is_type_supported.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD jump.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD map_results_to_items.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD map_tadir_to_items.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD serialize.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD supported_list.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD update_package_tree.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.
ENDCLASS.