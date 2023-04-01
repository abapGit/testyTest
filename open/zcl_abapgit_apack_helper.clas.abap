CLASS zcl_abapgit_apack_helper DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS are_dependencies_met
      IMPORTING
        !it_dependencies TYPE zif_abapgit_apack_definitions=>ty_dependencies
      RETURNING
        VALUE(rv_status) TYPE zif_abapgit_definitions=>ty_yes_no
      RAISING
        zcx_abapgit_exception .
    CLASS-METHODS dependencies_popup
      IMPORTING
        !it_dependencies TYPE zif_abapgit_apack_definitions=>ty_dependencies
      RAISING
        zcx_abapgit_exception .
    CLASS-METHODS to_file
      IMPORTING
        !iv_package    TYPE devclass
      RETURNING
        VALUE(rs_file) TYPE zif_abapgit_git_definitions=>ty_file
      RAISING
        zcx_abapgit_exception .
  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS zcl_abapgit_apack_helper IMPLEMENTATION.

  METHOD are_dependencies_met.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

  METHOD to_file.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

  METHOD dependencies_popup.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

ENDCLASS.