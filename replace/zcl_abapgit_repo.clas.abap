CLASS zcl_abapgit_repo DEFINITION
  PUBLIC
  ABSTRACT
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_abapgit_repo.

    ALIASES ms_data FOR zif_abapgit_repo~ms_data.
    ALIASES:
      get_key FOR zif_abapgit_repo~get_key,
      get_name FOR zif_abapgit_repo~get_name,
      is_offline FOR zif_abapgit_repo~is_offline,
      get_package FOR zif_abapgit_repo~get_package,
      get_files_local FOR zif_abapgit_repo~get_files_local,
      get_files_remote FOR zif_abapgit_repo~get_files_remote,
      get_local_settings FOR zif_abapgit_repo~get_local_settings,
      refresh FOR zif_abapgit_repo~refresh,
      get_dot_abapgit FOR zif_abapgit_repo~get_dot_abapgit,
      set_dot_abapgit FOR zif_abapgit_repo~set_dot_abapgit,
      deserialize FOR zif_abapgit_repo~deserialize,
      deserialize_checks FOR zif_abapgit_repo~deserialize_checks.

    METHODS constructor
      IMPORTING
        !is_data TYPE zif_abapgit_persistence=>ty_repo .

    METHODS bind_listener
      IMPORTING
        !ii_listener TYPE REF TO zif_abapgit_repo_listener .
    METHODS delete_checks
      RETURNING
        VALUE(rs_checks) TYPE zif_abapgit_definitions=>ty_delete_checks
      RAISING
        zcx_abapgit_exception .
    METHODS get_dot_apack
      RETURNING
        VALUE(ro_dot_apack) TYPE REF TO zcl_abapgit_apack_reader .
    METHODS get_data_config
      RETURNING
        VALUE(ri_config) TYPE REF TO zif_abapgit_data_config
      RAISING
        zcx_abapgit_exception .
    METHODS find_remote_dot_abapgit
      RETURNING
        VALUE(ro_dot) TYPE REF TO zcl_abapgit_dot_abapgit
      RAISING
        zcx_abapgit_exception .
    METHODS set_files_remote
      IMPORTING
        !it_files TYPE zif_abapgit_git_definitions=>ty_files_tt .
    METHODS set_local_settings
      IMPORTING
        !is_settings TYPE zif_abapgit_persistence=>ty_repo-local_settings
      RAISING
        zcx_abapgit_exception .
    METHODS has_remote_source
          ABSTRACT
      RETURNING
        VALUE(rv_yes) TYPE abap_bool .
    METHODS status
      IMPORTING
        !ii_log           TYPE REF TO zif_abapgit_log OPTIONAL
      RETURNING
        VALUE(rt_results) TYPE zif_abapgit_definitions=>ty_results_tt
      RAISING
        zcx_abapgit_exception .
    METHODS switch_repo_type
      IMPORTING
        !iv_offline TYPE abap_bool
      RAISING
        zcx_abapgit_exception .
    METHODS create_new_log
      IMPORTING
        !iv_title     TYPE string OPTIONAL
      RETURNING
        VALUE(ri_log) TYPE REF TO zif_abapgit_log .
    METHODS get_log
      RETURNING
        VALUE(ri_log) TYPE REF TO zif_abapgit_log .
    METHODS refresh_local_object
      IMPORTING
        !iv_obj_type TYPE tadir-object
        !iv_obj_name TYPE tadir-obj_name
      RAISING
        zcx_abapgit_exception .
    METHODS refresh_local_objects
      RAISING
        zcx_abapgit_exception .
    METHODS reset_status .
    METHODS get_unsupported_objects_local
      RETURNING
        VALUE(rt_objects) TYPE zif_abapgit_definitions=>ty_items_tt
      RAISING
        zcx_abapgit_exception .
    METHODS remove_ignored_files
      CHANGING
        ct_files TYPE zif_abapgit_git_definitions=>ty_files_tt
      RAISING
        zcx_abapgit_exception .
    METHODS check_and_create_package
      IMPORTING
         iv_package TYPE devclass
      RAISING
        zcx_abapgit_exception .
  PROTECTED SECTION.

    DATA mt_local TYPE zif_abapgit_definitions=>ty_files_item_tt .
    DATA mt_remote TYPE zif_abapgit_git_definitions=>ty_files_tt .
    DATA mv_request_local_refresh TYPE abap_bool .
    DATA mv_request_remote_refresh TYPE abap_bool .
    DATA mt_status TYPE zif_abapgit_definitions=>ty_results_tt .
    DATA mi_log TYPE REF TO zif_abapgit_log .
    DATA mi_listener TYPE REF TO zif_abapgit_repo_listener .
    DATA mo_apack_reader TYPE REF TO zcl_abapgit_apack_reader .
    DATA mi_data_config TYPE REF TO zif_abapgit_data_config .

    METHODS find_remote_dot_apack
      RETURNING
        VALUE(ro_dot) TYPE REF TO zcl_abapgit_apack_reader
      RAISING
        zcx_abapgit_exception .
    METHODS set_dot_apack
      IMPORTING
        !io_dot_apack TYPE REF TO zcl_abapgit_apack_reader
      RAISING
        zcx_abapgit_exception .
    METHODS set
      IMPORTING
        !iv_url             TYPE zif_abapgit_persistence=>ty_repo-url OPTIONAL
        !iv_branch_name     TYPE zif_abapgit_persistence=>ty_repo-branch_name OPTIONAL
        !iv_selected_commit TYPE zif_abapgit_persistence=>ty_repo-selected_commit OPTIONAL
        !iv_head_branch     TYPE zif_abapgit_persistence=>ty_repo-head_branch OPTIONAL
        !iv_offline         TYPE zif_abapgit_persistence=>ty_repo-offline OPTIONAL
        !is_dot_abapgit     TYPE zif_abapgit_persistence=>ty_repo-dot_abapgit OPTIONAL
        !is_local_settings  TYPE zif_abapgit_persistence=>ty_repo-local_settings OPTIONAL
        !iv_deserialized_at TYPE zif_abapgit_persistence=>ty_repo-deserialized_at OPTIONAL
        !iv_deserialized_by TYPE zif_abapgit_persistence=>ty_repo-deserialized_by OPTIONAL
        !iv_switched_origin TYPE zif_abapgit_persistence=>ty_repo-switched_origin OPTIONAL
      RAISING
        zcx_abapgit_exception .
    METHODS reset_remote .
  PRIVATE SECTION.

    METHODS notify_listener
      IMPORTING
        !is_change_mask TYPE zif_abapgit_persistence=>ty_repo_meta_mask
      RAISING
        zcx_abapgit_exception .
    METHODS update_last_deserialize
      RAISING
        zcx_abapgit_exception .
    METHODS check_for_restart .
    METHODS check_write_protect
      RAISING
        zcx_abapgit_exception .
    METHODS check_language
      RAISING
        zcx_abapgit_exception .
    METHODS normalize_local_settings
      CHANGING
        cs_local_settings TYPE zif_abapgit_persistence=>ty_local_settings.
ENDCLASS.



CLASS zcl_abapgit_repo IMPLEMENTATION.


  METHOD bind_listener.
    mi_listener = ii_listener.
  ENDMETHOD.


  METHOD check_and_create_package.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD check_for_restart.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD check_language.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD check_write_protect.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD constructor.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD create_new_log.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD delete_checks.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD find_remote_dot_abapgit.

    ASSERT 1 = 'decoupled'.
  ENDMETHOD.


  METHOD find_remote_dot_apack.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD get_data_config.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD get_dot_apack.
    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD get_log.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.


  METHOD get_unsupported_objects_local.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD normalize_local_settings.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD notify_listener.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD refresh_local_object.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD refresh_local_objects.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD remove_ignored_files.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD reset_remote.
    CLEAR mt_remote.
    mv_request_remote_refresh = abap_true.
    reset_status( ).
  ENDMETHOD.


  METHOD reset_status.
    CLEAR mt_status.
  ENDMETHOD.


  METHOD set.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD set_dot_apack.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.


  METHOD set_files_remote.

    mt_remote = it_files.
    mv_request_remote_refresh = abap_false.

  ENDMETHOD.


  METHOD set_local_settings.

    ASSERT 1 = 'decoupled'.
  ENDMETHOD.


  METHOD status.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD switch_repo_type.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD update_last_deserialize.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD zif_abapgit_repo~checksums.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD zif_abapgit_repo~deserialize.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD zif_abapgit_repo~deserialize_checks.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD zif_abapgit_repo~get_dot_abapgit.
    CREATE OBJECT ro_dot_abapgit
      EXPORTING
        is_data = ms_data-dot_abapgit.
  ENDMETHOD.


  METHOD zif_abapgit_repo~get_files_local.
* todo
    CLEAR rt_files.
  ENDMETHOD.


  METHOD zif_abapgit_repo~get_files_remote.
    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD zif_abapgit_repo~get_key.
    rv_key = ms_data-key.
  ENDMETHOD.


  METHOD zif_abapgit_repo~get_local_settings.

    rs_settings = ms_data-local_settings.

  ENDMETHOD.


  METHOD zif_abapgit_repo~get_name.

    rv_name = ms_data-local_settings-display_name.

  ENDMETHOD.


  METHOD zif_abapgit_repo~get_package.
    rv_package = ms_data-package.
  ENDMETHOD.


  METHOD zif_abapgit_repo~is_offline.
    rv_offline = ms_data-offline.
  ENDMETHOD.


  METHOD zif_abapgit_repo~refresh.

    mv_request_local_refresh = abap_true.
    reset_remote( ).

    IF iv_drop_log = abap_true.
      CLEAR mi_log.
    ENDIF.

    IF iv_drop_cache = abap_true.
      CLEAR mt_local.
    ENDIF.

  ENDMETHOD.


  METHOD zif_abapgit_repo~set_dot_abapgit.
    set( is_dot_abapgit = io_dot_abapgit->get_data( ) ).
  ENDMETHOD.
ENDCLASS.