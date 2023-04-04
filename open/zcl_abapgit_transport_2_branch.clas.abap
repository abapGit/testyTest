CLASS zcl_abapgit_transport_2_branch DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS create
      IMPORTING
        !io_repository          TYPE REF TO zcl_abapgit_repo_online
        !is_transport_to_branch TYPE zif_abapgit_definitions=>ty_transport_to_branch
        !it_transport_objects   TYPE zif_abapgit_definitions=>ty_tadir_tt
      RAISING
        zcx_abapgit_exception .

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_abapgit_transport_2_branch IMPLEMENTATION.


  METHOD create.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

ENDCLASS.