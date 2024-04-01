CLASS zcl_abapgit_repo_requirements DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS requirements_popup
      IMPORTING
        !it_requirements TYPE zif_abapgit_dot_abapgit=>ty_requirement_tt
      RAISING
        zcx_abapgit_exception .
    CLASS-METHODS is_requirements_met
      IMPORTING
        !it_requirements TYPE zif_abapgit_dot_abapgit=>ty_requirement_tt
      RETURNING
        VALUE(rv_status) TYPE zif_abapgit_definitions=>ty_yes_no
      RAISING
        zcx_abapgit_exception .
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_abapgit_repo_requirements IMPLEMENTATION.

  METHOD requirements_popup.
    ASSERT 1 = 'todo'.
  ENDMETHOD.

  METHOD is_requirements_met.
    ASSERT 1 = 'todo'.
  ENDMETHOD.

ENDCLASS.