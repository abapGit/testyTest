CLASS zcl_abapgit_sap_package DEFINITION
  PUBLIC
  CREATE PRIVATE
  GLOBAL FRIENDS zcl_abapgit_factory .

  PUBLIC SECTION.

    INTERFACES zif_abapgit_sap_package .

    METHODS constructor
      IMPORTING
        !iv_package TYPE I_CustABAPObjDirectoryEntry-ABAPPackage .
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA mv_package TYPE I_CustABAPObjDirectoryEntry-ABAPPackage.

ENDCLASS.



CLASS zcl_abapgit_sap_package IMPLEMENTATION.

  METHOD constructor.
    mv_package = iv_package.
  ENDMETHOD.

  METHOD zif_abapgit_sap_package~are_changes_recorded_in_tr_req.
    rv_are_changes_rec_in_tr_req = abap_false.
  ENDMETHOD.

  METHOD zif_abapgit_sap_package~get.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

  METHOD zif_abapgit_sap_package~create.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

  METHOD zif_abapgit_sap_package~create_child.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

  METHOD zif_abapgit_sap_package~create_local.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

  METHOD zif_abapgit_sap_package~exists.
    rv_bool = abap_false.
  ENDMETHOD.

  METHOD zif_abapgit_sap_package~get_transport_type.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

  METHOD zif_abapgit_sap_package~list_subpackages.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

  METHOD zif_abapgit_sap_package~list_superpackages.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

  METHOD zif_abapgit_sap_package~read_description.
    rv_description = 'PackDescTodo'.
  ENDMETHOD.

  METHOD zif_abapgit_sap_package~read_parent.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

  METHOD zif_abapgit_sap_package~read_responsible.
    rv_responsible = 'TODO'.
  ENDMETHOD.

  METHOD zif_abapgit_sap_package~validate_name.

    IF mv_package IS INITIAL.
      zcx_abapgit_exception=>raise( 'Package name must not be empty' ).
    ENDIF.

    IF mv_package = '$TMP'.
      zcx_abapgit_exception=>raise( 'It is not possible to use $TMP, use a different (local) package' ).
    ENDIF.

* todo

  ENDMETHOD.
ENDCLASS.