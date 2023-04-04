CLASS zcl_abapgit_sap_namespace DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_abapgit_sap_namespace.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_abapgit_sap_namespace IMPLEMENTATION.


  METHOD zif_abapgit_sap_namespace~exists.
    rv_yes = abap_true.
  ENDMETHOD.


  METHOD zif_abapgit_sap_namespace~is_editable.
    rv_yes = abap_true.
  ENDMETHOD.
ENDCLASS.