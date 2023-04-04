CLASS zcl_abapgit_repo_online DEFINITION
  PUBLIC
  INHERITING FROM zcl_abapgit_repo
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_abapgit_repo_online .

    ALIASES create_branch
      FOR zif_abapgit_repo_online~create_branch .
    ALIASES get_current_remote
      FOR zif_abapgit_repo_online~get_current_remote .
    ALIASES get_selected_branch
      FOR zif_abapgit_repo_online~get_selected_branch .
    ALIASES get_selected_commit
      FOR zif_abapgit_repo_online~get_selected_commit .
    ALIASES get_url
      FOR zif_abapgit_repo_online~get_url .
    ALIASES push
      FOR zif_abapgit_repo_online~push .
    ALIASES select_branch
      FOR zif_abapgit_repo_online~select_branch .
    ALIASES select_commit
      FOR zif_abapgit_repo_online~select_commit .
    ALIASES set_url
      FOR zif_abapgit_repo_online~set_url .
    ALIASES switch_origin
      FOR zif_abapgit_repo_online~switch_origin .
    ALIASES get_switched_origin
      FOR zif_abapgit_repo_online~get_switched_origin.



    METHODS zif_abapgit_repo~get_files_remote
        REDEFINITION .
    METHODS zif_abapgit_repo~get_name
        REDEFINITION .
    METHODS has_remote_source
        REDEFINITION .

  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA mt_objects TYPE zif_abapgit_definitions=>ty_objects_tt .
    DATA mv_current_commit TYPE zif_abapgit_git_definitions=>ty_sha1 .

    METHODS handle_stage_ignore
      IMPORTING
        !io_stage TYPE REF TO zcl_abapgit_stage
      RAISING
        zcx_abapgit_exception .
    METHODS set_objects
      IMPORTING
        !it_objects TYPE zif_abapgit_definitions=>ty_objects_tt
      RAISING
        zcx_abapgit_exception .
    METHODS fetch_remote
      RAISING
        zcx_abapgit_exception .
    METHODS get_objects
      RETURNING
        VALUE(rt_objects) TYPE zif_abapgit_definitions=>ty_objects_tt
      RAISING
        zcx_abapgit_exception .
    METHODS raise_error_if_branch_exists
      IMPORTING
        iv_name TYPE string
      RAISING
        zcx_abapgit_exception.
ENDCLASS.



CLASS zcl_abapgit_repo_online IMPLEMENTATION.


  METHOD fetch_remote.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD get_objects.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.


  METHOD handle_stage_ignore.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD has_remote_source.
    rv_yes = abap_true.
  ENDMETHOD.


  METHOD raise_error_if_branch_exists.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD set_objects.
    mt_objects = it_objects.
  ENDMETHOD.


  METHOD zif_abapgit_repo_online~check_for_valid_branch.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD zif_abapgit_repo_online~create_branch.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD zif_abapgit_repo_online~get_current_remote.
    fetch_remote( ).
    rv_sha1 = mv_current_commit.
  ENDMETHOD.


  METHOD zif_abapgit_repo_online~get_selected_branch.
    rv_name = ms_data-branch_name.
  ENDMETHOD.


  METHOD zif_abapgit_repo_online~get_selected_commit.
    rv_selected_commit = ms_data-selected_commit.
  ENDMETHOD.


  METHOD zif_abapgit_repo_online~get_switched_origin.
    rv_switched_origin = ms_data-switched_origin.
  ENDMETHOD.


  METHOD zif_abapgit_repo_online~get_url.
    rv_url = ms_data-url.
  ENDMETHOD.


  METHOD zif_abapgit_repo_online~push.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD zif_abapgit_repo_online~select_branch.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD zif_abapgit_repo_online~select_commit.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD zif_abapgit_repo_online~set_url.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD zif_abapgit_repo_online~switch_origin.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD zif_abapgit_repo~get_files_remote.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.


  METHOD zif_abapgit_repo~get_name.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.
ENDCLASS.