CLASS zcl_abapgit_objects_activation DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS add
      IMPORTING
        !iv_type   TYPE I_CustABAPObjDirectoryEntry-ABAPObjectType
        !iv_name   TYPE clike
        !iv_delete TYPE abap_bool DEFAULT abap_false
      RAISING
        zcx_abapgit_exception .
    CLASS-METHODS add_item
      IMPORTING
        !is_item TYPE zif_abapgit_definitions=>ty_item
      RAISING
        zcx_abapgit_exception .
    CLASS-METHODS activate
      IMPORTING
        !iv_ddic TYPE abap_bool DEFAULT abap_false
        !ii_log  TYPE REF TO zif_abapgit_log
      RAISING
        zcx_abapgit_exception .
    CLASS-METHODS clear .
    CLASS-METHODS is_ddic_type
      IMPORTING
        !iv_obj_type     TYPE I_CustABAPObjDirectoryEntry-ABAPObjectType
      RETURNING
        VALUE(rv_result) TYPE abap_bool .
    CLASS-METHODS is_active
      IMPORTING
        !is_item         TYPE zif_abapgit_definitions=>ty_item
      RETURNING
        VALUE(rv_active) TYPE abap_bool
      RAISING
        zcx_abapgit_exception.
  PROTECTED SECTION.
  PRIVATE SECTION.



    CONSTANTS:
      c_domain     TYPE c LENGTH 9  VALUE 'DOMA DOMD',
      c_types      TYPE c LENGTH 50 VALUE 'DTEL DTED TABL TABD SQLT SQLD TTYP TTYD VIEW VIED',
      c_technset   TYPE c LENGTH 24 VALUE 'TABT VIET SQTT INDX XINX',
      c_f4_objects TYPE c LENGTH 35 VALUE 'SHLP SHLD MCOB MCOD MACO MACD MCID',
      c_enqueue    TYPE c LENGTH 9  VALUE 'ENQU ENQD',
      c_sqsc       TYPE c LENGTH 4  VALUE 'SQSC',
      c_stob       TYPE c LENGTH 4  VALUE 'STOB',
      c_ntab       TYPE c LENGTH 14 VALUE 'NTTT NTTB NTDT',
      c_ddls       TYPE c LENGTH 24 VALUE 'DDLS DRUL DTDC DTEB',
      c_switches   TYPE c LENGTH 24 VALUE 'SF01 SF02 SFSW SFBS SFBF',
      c_para       TYPE c LENGTH 4  VALUE 'PARA', " can be referenced by DTEL
      c_enhd       TYPE c LENGTH 4  VALUE 'ENHD'.

    CLASS-METHODS update_where_used
      IMPORTING
        !ii_log TYPE REF TO zif_abapgit_log.
    CLASS-METHODS use_new_activation_logic
      RETURNING
        VALUE(rv_use_new_activation_logic) TYPE abap_bool .
    CLASS-METHODS activate_new
      IMPORTING
        !iv_ddic TYPE abap_bool DEFAULT abap_false
        !ii_log  TYPE REF TO zif_abapgit_log
      RAISING
        zcx_abapgit_exception .
    CLASS-METHODS activate_old
      IMPORTING
        !iv_ddic TYPE abap_bool DEFAULT abap_false
        !ii_log  TYPE REF TO zif_abapgit_log
      RAISING
        zcx_abapgit_exception .
    CLASS-METHODS activate_ddic
      IMPORTING
        !ii_log TYPE REF TO zif_abapgit_log
      RAISING
        zcx_abapgit_exception .
    CLASS-METHODS is_non_ddic_active
      IMPORTING
        !is_item         TYPE zif_abapgit_definitions=>ty_item
      RETURNING
        VALUE(rv_active) TYPE abap_bool
      RAISING
        zcx_abapgit_exception .
    CLASS-METHODS is_ddic_active
      IMPORTING
        !is_item         TYPE zif_abapgit_definitions=>ty_item
      RETURNING
        VALUE(rv_active) TYPE abap_bool
      RAISING
        zcx_abapgit_exception .
ENDCLASS.



CLASS zcl_abapgit_objects_activation IMPLEMENTATION.


  METHOD activate.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD activate_ddic.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD activate_new.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD activate_old.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD add.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.

  METHOD add_item.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.


  METHOD clear.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

  METHOD is_active.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD is_ddic_active.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD is_ddic_type.

    ASSERT 1 = 'decoupled'.
  ENDMETHOD.


  METHOD is_non_ddic_active.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD update_where_used.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD use_new_activation_logic.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.
ENDCLASS.