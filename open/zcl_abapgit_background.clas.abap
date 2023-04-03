CLASS zcl_abapgit_background DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES: BEGIN OF ty_method,
             class       TYPE seoclsname,
             description TYPE string,
           END OF ty_method.

    TYPES: ty_methods TYPE SORTED TABLE OF ty_method WITH UNIQUE KEY class.

    CLASS-METHODS run
      RAISING
        zcx_abapgit_exception .
    CLASS-METHODS list_methods
      RETURNING VALUE(rt_methods) TYPE ty_methods.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_abapgit_background IMPLEMENTATION.


  METHOD list_methods.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD run.

    ASSERT 1 = 'decoupled'.
  ENDMETHOD.
ENDCLASS.