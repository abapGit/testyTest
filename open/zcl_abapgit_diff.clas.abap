CLASS zcl_abapgit_diff DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.
    CONSTANTS co_starting_beacon TYPE i VALUE 1.

* assumes data is UTF8 based with newlines
    METHODS constructor
      IMPORTING
        !iv_new                TYPE xstring
        !iv_old                TYPE xstring
        !iv_ignore_indentation TYPE abap_bool DEFAULT abap_false
        !iv_ignore_comments    TYPE abap_bool DEFAULT abap_false
        !iv_ignore_case        TYPE abap_bool DEFAULT abap_false
      RAISING
        zcx_abapgit_exception.
    METHODS get
      RETURNING
        VALUE(rt_diff) TYPE zif_abapgit_definitions=>ty_diffs_tt.
    METHODS stats
      RETURNING
        VALUE(rs_count) TYPE zif_abapgit_definitions=>ty_count.
    METHODS set_patch_new
      IMPORTING
        !iv_line_new   TYPE i
        !iv_patch_flag TYPE abap_bool
      RAISING
        zcx_abapgit_exception.
    METHODS set_patch_old
      IMPORTING
        !iv_line_old   TYPE i
        !iv_patch_flag TYPE abap_bool
      RAISING
        zcx_abapgit_exception.
    METHODS get_beacons
      RETURNING
        VALUE(rt_beacons) TYPE zif_abapgit_definitions=>ty_string_tt.
    METHODS is_line_patched
      IMPORTING
        iv_index          TYPE i
      RETURNING
        VALUE(rv_patched) TYPE abap_bool
      RAISING
        zcx_abapgit_exception.
    METHODS set_patch_by_old_diff
      IMPORTING
        is_diff_old   TYPE zif_abapgit_definitions=>ty_diff
        iv_patch_flag TYPE abap_bool.

  PROTECTED SECTION.

  PRIVATE SECTION.

    METHODS map_beacons.
    METHODS shortlist.
    METHODS calculate_stats.
    METHODS adjust_diff.
ENDCLASS.



CLASS zcl_abapgit_diff IMPLEMENTATION.


  METHOD adjust_diff.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD calculate_stats.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.

  METHOD constructor.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.

  METHOD get.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

  METHOD get_beacons.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

  METHOD is_line_patched.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.

  METHOD map_beacons.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD set_patch_by_old_diff.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD set_patch_new.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD set_patch_old.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.

  METHOD shortlist.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.

  METHOD stats.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

ENDCLASS.