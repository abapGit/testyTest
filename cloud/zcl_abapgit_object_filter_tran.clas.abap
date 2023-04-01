CLASS zcl_abapgit_object_filter_tran DEFINITION
  PUBLIC
  CREATE PUBLIC.


  PUBLIC SECTION.
    INTERFACES zif_abapgit_object_filter.

    METHODS set_filter_values
      IMPORTING
        iv_package  TYPE I_CustABAPObjDirectoryEntry-ABAPPackage
        it_r_trkorr TYPE zif_abapgit_definitions=>ty_trrngtrkor_tt
      RAISING
        zcx_abapgit_exception .

    METHODS get_filter_values
      EXPORTING
        ev_package  TYPE I_CustABAPObjDirectoryEntry-ABAPPackage
        et_r_trkorr TYPE zif_abapgit_definitions=>ty_trrngtrkor_tt.

ENDCLASS.

CLASS zcl_abapgit_object_filter_tran IMPLEMENTATION.

  METHOD zif_abapgit_object_filter~get_filter.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

  METHOD get_filter_values.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

  METHOD set_filter_values.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

ENDCLASS.