CLASS zcl_abapgit_frontend_services DEFINITION
  PUBLIC
  CREATE PRIVATE
  GLOBAL FRIENDS zcl_abapgit_ui_factory.

  PUBLIC SECTION.

    INTERFACES zif_abapgit_frontend_services.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_abapgit_frontend_services IMPLEMENTATION.

  METHOD zif_abapgit_frontend_services~clipboard_export.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

  METHOD zif_abapgit_frontend_services~directory_browse.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

  METHOD zif_abapgit_frontend_services~directory_create.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

  METHOD zif_abapgit_frontend_services~directory_exist.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

  METHOD zif_abapgit_frontend_services~execute.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

  METHOD zif_abapgit_frontend_services~file_download.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

  METHOD zif_abapgit_frontend_services~file_upload.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

  METHOD zif_abapgit_frontend_services~get_file_separator.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

  METHOD zif_abapgit_frontend_services~get_gui_version.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

  METHOD zif_abapgit_frontend_services~get_system_directory.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

  METHOD zif_abapgit_frontend_services~gui_is_available.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

  METHOD zif_abapgit_frontend_services~is_sapgui_for_java.
    rv_result = abap_false.
  ENDMETHOD.

  METHOD zif_abapgit_frontend_services~is_sapgui_for_windows.
    rv_result = abap_false.
  ENDMETHOD.

  METHOD zif_abapgit_frontend_services~is_webgui.
    rv_is_webgui = abap_false.
  ENDMETHOD.

  METHOD zif_abapgit_frontend_services~show_file_open_dialog.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

  METHOD zif_abapgit_frontend_services~show_file_save_dialog.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.

  METHOD zif_abapgit_frontend_services~open_ie_devtools.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.
ENDCLASS.