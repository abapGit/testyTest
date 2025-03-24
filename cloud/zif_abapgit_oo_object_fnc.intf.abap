INTERFACE zif_abapgit_oo_object_fnc PUBLIC.

  METHODS syntax_check
    IMPORTING
      iv_object_name TYPE I_CustABAPObjDirectoryEntry-ABAPObject
    RAISING
      zcx_abapgit_exception.

  METHODS exists
    IMPORTING
      is_object_name   TYPE I_CustABAPObjDirectoryEntry-ABAPObject
    RETURNING
      VALUE(rv_exists) TYPE abap_bool.

ENDINTERFACE.