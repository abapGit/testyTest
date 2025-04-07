CLASS zcl_abapgit_code_inspector DEFINITION
  PUBLIC
  CREATE PROTECTED.

  PUBLIC SECTION.

    INTERFACES zif_abapgit_code_inspector .

    METHODS constructor
      IMPORTING
        !iv_package TYPE I_CustABAPObjDirectoryEntry-ABAPPackage
      RAISING
        zcx_abapgit_exception .

    CLASS-METHODS get_code_inspector
      IMPORTING
        !iv_package              TYPE I_CustABAPObjDirectoryEntry-ABAPPackage
      RETURNING
        VALUE(ri_code_inspector) TYPE REF TO zif_abapgit_code_inspector
      RAISING
        zcx_abapgit_exception.

    CLASS-METHODS set_code_inspector
      IMPORTING
        !iv_package        TYPE I_CustABAPObjDirectoryEntry-ABAPPackage
        !ii_code_inspector TYPE REF TO zif_abapgit_code_inspector.

ENDCLASS.



CLASS zcl_abapgit_code_inspector IMPLEMENTATION.
  METHOD constructor.
    RETURN. " todo, implement method
  ENDMETHOD.
  METHOD get_code_inspector.
    RETURN. " todo, implement method
  ENDMETHOD.
  METHOD set_code_inspector.
    RETURN. " todo, implement method
  ENDMETHOD.
  METHOD zif_abapgit_code_inspector~run.
    RETURN. " todo, implement method
  ENDMETHOD.
  METHOD zif_abapgit_code_inspector~is_successful.
    RETURN. " todo, implement method
  ENDMETHOD.
  METHOD zif_abapgit_code_inspector~get_summary.
    RETURN. " todo, implement method
  ENDMETHOD.
  METHOD zif_abapgit_code_inspector~validate_check_variant.
    RETURN. " todo, implement method
  ENDMETHOD.
  METHOD zif_abapgit_code_inspector~list_global_variants.
    RETURN. " todo, implement method
  ENDMETHOD.
ENDCLASS.
