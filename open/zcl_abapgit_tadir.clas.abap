CLASS zcl_abapgit_tadir DEFINITION
  PUBLIC
  FINAL
  CREATE PRIVATE
  GLOBAL FRIENDS zcl_abapgit_factory .

  PUBLIC SECTION.
    INTERFACES zif_abapgit_tadir .

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_abapgit_tadir IMPLEMENTATION.

  METHOD zif_abapgit_tadir~get_object_package.
* todo
    RETURN.
  ENDMETHOD.

  METHOD zif_abapgit_tadir~read.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

  METHOD zif_abapgit_tadir~read_single.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

ENDCLASS.