CLASS zcl_abapgit_function_module DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES:
      zif_abapgit_function_module.

ENDCLASS.


CLASS zcl_abapgit_function_module IMPLEMENTATION.

  METHOD zif_abapgit_function_module~function_exists.

    DATA: lv_function_module_name TYPE c LENGTH 30.

    lv_function_module_name = iv_function_module_name.

    ASSERT 1 = 'replacedByRefactorMJS'.
    rv_exists = boolc( sy-subrc = 0 ).

  ENDMETHOD.

ENDCLASS.
