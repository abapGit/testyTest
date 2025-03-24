INTERFACE zif_abapgit_oo_object_fnc PUBLIC.

  METHODS syntax_check
    IMPORTING
      iv_object_name TYPE tadir-obj_name
    RAISING
      zcx_abapgit_exception.

  METHODS exists
    IMPORTING
      is_object_name   TYPE tadir-obj_name
    RETURNING
      VALUE(rv_exists) TYPE abap_bool.

ENDINTERFACE.