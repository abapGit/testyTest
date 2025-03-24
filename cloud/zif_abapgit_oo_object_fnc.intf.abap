INTERFACE zif_abapgit_oo_object_fnc PUBLIC.

  METHODS syntax_check
    IMPORTING
      iv_object_name TYPE char30
    RAISING
      zcx_abapgit_exception.

  METHODS exists
    IMPORTING
      iv_object_name   TYPE char30
    RETURNING
      VALUE(rv_exists) TYPE abap_bool.

ENDINTERFACE.