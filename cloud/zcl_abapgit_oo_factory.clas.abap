CLASS zcl_abapgit_oo_factory DEFINITION PUBLIC.
  PUBLIC SECTION.
    CLASS-METHODS get_by_type
      IMPORTING
        iv_object_type                   TYPE I_CustABAPObjDirectoryEntry-ABAPObjectType
      RETURNING
        VALUE(ri_object_oriented_object) TYPE REF TO zif_abapgit_oo_object_fnc.

    CLASS-METHODS get_by_name
      IMPORTING
        iv_object_name                   TYPE char30
      RETURNING
        VALUE(ri_object_oriented_object) TYPE REF TO zif_abapgit_oo_object_fnc
      RAISING
        zcx_abapgit_exception.
ENDCLASS.

CLASS zcl_abapgit_oo_factory IMPLEMENTATION.

  METHOD get_by_type.
    ASSERT 1 = 'todo'.
  ENDMETHOD.

  METHOD get_by_name.
    ASSERT 1 = 'todo'.
  ENDMETHOD.

ENDCLASS.