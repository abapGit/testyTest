CLASS zcl_abapgit_user_record DEFINITION
  PUBLIC
  FINAL
  CREATE PRIVATE.

  PUBLIC SECTION.

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
    CLASS-METHODS get_title
      IMPORTING
        iv_username     TYPE sy-uname
      RETURNING
        VALUE(rv_title) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_abapgit_user_record IMPLEMENTATION.

  METHOD get_title.
    rv_title = 'title'.
  ENDMETHOD.

  METHOD constructor.
    RETURN.
  ENDMETHOD.

  METHOD get_email.
    rv_email = 'foo@bar.com'.
  ENDMETHOD.

  METHOD get_instance.
    CREATE OBJECT ro_user EXPORTING iv_user = iv_user.
  ENDMETHOD.

  METHOD get_name.
    rv_name = 'John'.
  ENDMETHOD.

  METHOD reset.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.
ENDCLASS.