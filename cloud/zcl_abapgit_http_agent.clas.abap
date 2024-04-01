CLASS zcl_abapgit_http_agent DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_abapgit_http_agent .

    CLASS-METHODS create
      RETURNING
        VALUE(ri_instance) TYPE REF TO zif_abapgit_http_agent .

    METHODS constructor.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_abapgit_http_agent IMPLEMENTATION.



  METHOD constructor.

    ASSERT 1 = 'todo'.

  ENDMETHOD.


  METHOD create.

    ASSERT 1 = 'todo'.

  ENDMETHOD.


  METHOD zif_abapgit_http_agent~global_headers.

    ASSERT 1 = 'todo'.

  ENDMETHOD.


  METHOD zif_abapgit_http_agent~request.
    ASSERT 1 = 'todo'.

  ENDMETHOD.
ENDCLASS.