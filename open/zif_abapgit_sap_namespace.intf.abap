INTERFACE zif_abapgit_sap_namespace
  PUBLIC .

  METHODS exists
    IMPORTING
      iv_namespace TYPE char10
    RETURNING
      VALUE(rv_yes) TYPE abap_bool.

  METHODS is_editable
    IMPORTING
      iv_namespace TYPE char10
    RETURNING
      VALUE(rv_yes) TYPE abap_bool.

ENDINTERFACE.
