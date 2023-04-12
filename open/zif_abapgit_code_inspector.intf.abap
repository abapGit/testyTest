INTERFACE zif_abapgit_code_inspector
  PUBLIC .


  METHODS run
    IMPORTING
      !iv_variant    TYPE char30
      !iv_save       TYPE abap_bool DEFAULT abap_false
    RETURNING
      VALUE(rt_list) TYPE string_table
    RAISING
      zcx_abapgit_exception .

  METHODS is_successful
    RETURNING
      VALUE(rv_success) TYPE abap_bool .

  METHODS get_summary
    RETURNING
      VALUE(rv_summary) TYPE string.
ENDINTERFACE.
