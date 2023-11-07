CLASS zcl_abapgit_http_digest DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS constructor
      IMPORTING
        !ii_client   TYPE REF TO object
        !iv_username TYPE string
        !iv_password TYPE string
      RAISING
        zcx_abapgit_exception.
    METHODS run
      IMPORTING
        !ii_client TYPE REF TO object
      RAISING
        zcx_abapgit_exception.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_abapgit_http_digest IMPLEMENTATION.


  METHOD constructor.
    ASSERT 1 = 'todo'.
  ENDMETHOD.

  METHOD run.
    ASSERT 1 = 'todo'.
  ENDMETHOD.
ENDCLASS.