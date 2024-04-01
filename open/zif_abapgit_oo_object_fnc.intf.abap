INTERFACE zif_abapgit_oo_object_fnc PUBLIC.

  METHODS syntax_check
    IMPORTING
      iv_object_name TYPE any
    RAISING
      zcx_abapgit_exception.

ENDINTERFACE.