CLASS zcl_abapgit_user_record DEFINITION
  PUBLIC
  FINAL
  CREATE PRIVATE.

  PUBLIC SECTION.

    CONSTANTS c_cc_category TYPE string VALUE 'C'.

    CLASS-METHODS reset.
    CLASS-METHODS get_instance
      IMPORTING
        !iv_user       TYPE sy-uname
      RETURNING
        VALUE(ro_user) TYPE REF TO zcl_abapgit_user_record.
    METHODS constructor
      IMPORTING
        !iv_user TYPE sy-uname.
    METHODS get_name
      RETURNING
        VALUE(rv_name) TYPE zif_abapgit_git_definitions=>ty_git_user-name.
    METHODS get_email
      RETURNING
        VALUE(rv_email) TYPE zif_abapgit_git_definitions=>ty_git_user-email.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_abapgit_user_record IMPLEMENTATION.

  METHOD constructor.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD get_email.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD get_instance.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD get_name.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD reset.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.
ENDCLASS.