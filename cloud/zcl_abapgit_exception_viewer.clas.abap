CLASS zcl_abapgit_exception_viewer DEFINITION
  PUBLIC
  CREATE PUBLIC.


  PUBLIC SECTION.
    TYPES: BEGIN OF ty_astack,
         mainprogram  TYPE c LENGTH 40,
         include      TYPE c LENGTH 40,
         line         TYPE i,
         blocktype    TYPE c LENGTH 12,
         blockname    TYPE string,
         flag_system	TYPE c LENGTH 1,
       END OF ty_astack.
    TYPES abap_callstack TYPE STANDARD TABLE OF ty_astack WITH DEFAULT KEY.
    TYPES abap_callstack_line TYPE LINE OF abap_callstack.

    METHODS:
      constructor
        IMPORTING
          ix_error TYPE REF TO zcx_abapgit_exception,

      goto_source
        RAISING
          zcx_abapgit_exception,

      goto_message
        RAISING
          zcx_abapgit_exception,

      show_callstack
        RAISING
          zcx_abapgit_exception.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA:
      mx_error     TYPE REF TO zcx_abapgit_exception,
      mt_callstack TYPE abap_callstack.

    METHODS:
      build_top_of_list
        IMPORTING
          is_top_of_stack TYPE abap_callstack_line
        RETURNING
          VALUE(ro_form)  TYPE REF TO object,

      add_row
        IMPORTING
          io_grid  TYPE REF TO object
          iv_col_1 TYPE csequence
          iv_col_2 TYPE csequence,

      set_text
        IMPORTING
          io_columns TYPE REF TO object
          iv_column  TYPE any
          iv_text    TYPE string
        RAISING
          cx_static_check,

      goto_source_code
        IMPORTING
          is_callstack TYPE abap_callstack_line
        RAISING
          zcx_abapgit_exception,

      extract_classname
        IMPORTING
          iv_mainprogram      TYPE abap_callstack_line-mainprogram
        RETURNING
          VALUE(rv_classname) TYPE I_CustABAPObjDirectoryEntry-ABAPObject,

      get_top_of_callstack
        RETURNING
          VALUE(rs_top_of_callstack) TYPE abap_callstack_line
        RAISING
          zcx_abapgit_exception.

ENDCLASS.



CLASS zcl_abapgit_exception_viewer IMPLEMENTATION.


  METHOD add_row.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD build_top_of_list.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD constructor.

    mx_error = ix_error.
    mt_callstack = mx_error->mt_callstack.

  ENDMETHOD.


  METHOD extract_classname.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD get_top_of_callstack.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD goto_message.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD goto_source.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD goto_source_code.

    ASSERT 1 = 'decoupled'.
  ENDMETHOD.


  METHOD set_text.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD show_callstack.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.
ENDCLASS.