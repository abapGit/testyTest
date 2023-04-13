CLASS zcl_abapgit_gui_page_codi_base DEFINITION PUBLIC ABSTRACT INHERITING FROM zcl_abapgit_gui_page.
  PUBLIC SECTION.
    METHODS:
      zif_abapgit_gui_event_handler~on_event
        REDEFINITION.

  PROTECTED SECTION.

    CONSTANTS:
      BEGIN OF c_actions,
        rerun  TYPE string VALUE 'rerun' ##NO_TEXT,
        sort_1 TYPE string VALUE 'sort_1'  ##NO_TEXT,
        sort_2 TYPE string VALUE 'sort_2'  ##NO_TEXT,
        sort_3 TYPE string VALUE 'sort_3'  ##NO_TEXT,
        stage  TYPE string VALUE 'stage' ##NO_TEXT,
        commit TYPE string VALUE 'commit' ##NO_TEXT,
      END OF c_actions .
    DATA mo_repo TYPE REF TO zcl_abapgit_repo .
    DATA mt_result TYPE zif_abapgit_code_inspector=>ty_results .

    METHODS render_variant
      IMPORTING
        !iv_variant    TYPE any
        iv_summary    TYPE string
      RETURNING
        VALUE(ri_html) TYPE REF TO zif_abapgit_html .
    METHODS render_result
      IMPORTING
        !ii_html   TYPE REF TO zif_abapgit_html
        !it_result TYPE any .
    METHODS render_result_line
      IMPORTING
        !ii_html   TYPE REF TO zif_abapgit_html
        !is_result TYPE any .
    METHODS build_nav_link
      IMPORTING
        !is_result     TYPE any
      RETURNING
        VALUE(rv_link) TYPE string .
    METHODS jump
      IMPORTING
        !is_item        TYPE zif_abapgit_definitions=>ty_item
        !is_sub_item    TYPE zif_abapgit_definitions=>ty_item
        !iv_line_number TYPE i
      RAISING
        zcx_abapgit_exception .
    METHODS build_base_menu
      RETURNING
        VALUE(ro_menu) TYPE REF TO zcl_abapgit_html_toolbar .
    DATA mv_summary TYPE string.
  PRIVATE SECTION.
    CONSTANTS c_object_separator TYPE c LENGTH 1 VALUE '|'.
    CONSTANTS c_ci_sig TYPE string VALUE 'cinav:'.
ENDCLASS.



CLASS zcl_abapgit_gui_page_codi_base IMPLEMENTATION.


  METHOD build_base_menu.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD build_nav_link.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD jump.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD render_result.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD render_result_line.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD render_variant.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD zif_abapgit_gui_event_handler~on_event.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.
ENDCLASS.