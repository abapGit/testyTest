CLASS zcl_abapgit_gui_asset_manager DEFINITION PUBLIC FINAL CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_abapgit_gui_asset_manager.

    CLASS-METHODS create
      RETURNING
        VALUE(ri_asset_manager) TYPE REF TO zif_abapgit_gui_asset_manager.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_abapgit_gui_asset_manager IMPLEMENTATION.

  METHOD create.
    ASSERT 1 = 'replace todo'.
  ENDMETHOD.

  METHOD zif_abapgit_gui_asset_manager~get_all_assets.
    ASSERT 1 = 'replace todo'.
  ENDMETHOD.

  METHOD zif_abapgit_gui_asset_manager~get_asset.
    ASSERT 1 = 'replace todo'.
  ENDMETHOD.

  METHOD zif_abapgit_gui_asset_manager~get_text_asset.
    ASSERT 1 = 'replace todo'.
  ENDMETHOD.

  METHOD zif_abapgit_gui_asset_manager~register_asset.
    ASSERT 1 = 'replace todo'.
  ENDMETHOD.

ENDCLASS.
