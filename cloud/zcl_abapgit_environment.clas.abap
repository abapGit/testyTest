CLASS zcl_abapgit_environment DEFINITION PUBLIC FINAL CREATE PRIVATE GLOBAL FRIENDS zcl_abapgit_factory.
  PUBLIC SECTION.
    INTERFACES zif_abapgit_environment .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_abapgit_environment IMPLEMENTATION.

  METHOD zif_abapgit_environment~compare_with_inactive.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

  METHOD zif_abapgit_environment~get_basis_release.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

  METHOD zif_abapgit_environment~is_merged.
    rv_result = abap_false.
  ENDMETHOD.

  METHOD zif_abapgit_environment~is_repo_object_changes_allowed.
    rv_result = abap_true.
  ENDMETHOD.

  METHOD zif_abapgit_environment~is_restart_required.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

  METHOD zif_abapgit_environment~is_sap_cloud_platform.
    rv_result = abap_false.
  ENDMETHOD.

  METHOD zif_abapgit_environment~is_sap_object_allowed.
    rv_allowed = abap_false.
  ENDMETHOD.

  METHOD zif_abapgit_environment~get_system_language_filter.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

  METHOD zif_abapgit_environment~is_variant_maintenance.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

ENDCLASS.