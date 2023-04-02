CLASS zcl_abapgit_data_supporter DEFINITION
  PUBLIC
  CREATE PRIVATE
  GLOBAL FRIENDS zcl_abapgit_data_factory .

  PUBLIC SECTION.

    INTERFACES zif_abapgit_data_supporter.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_abapgit_data_supporter IMPLEMENTATION.
  METHOD zif_abapgit_data_supporter~is_object_supported.
    ASSERT 1 = 2.
  ENDMETHOD.
ENDCLASS.