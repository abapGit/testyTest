CLASS zcl_abapgit_http_utility DEFINITION PUBLIC CREATE PUBLIC.
  PUBLIC SECTION.
    TYPES: BEGIN OF ty,
             name  TYPE string,
             value TYPE string,
           END OF ty.
* TIHTTPNVP is actually released, but the structure it refers is not
    TYPES tihttpnvp TYPE STANDARD TABLE OF ty WITH DEFAULT KEY.

    CLASS-METHODS
      fields_to_string
        IMPORTING
          it_fields TYPE tihttpnvp
        RETURNING
          VALUE(str) TYPE string.
ENDCLASS.


CLASS zcl_abapgit_http_utility IMPLEMENTATION.

  METHOD fields_to_string.
    ASSERT 1 = 'todo'.
  ENDMETHOD.

ENDCLASS.
