CLASS zcl_abapgit_gui_router DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    INTERFACES zif_abapgit_gui_event_handler.

  PROTECTED SECTION.
  PRIVATE SECTION.

    METHODS general_page_routing
      IMPORTING
        !ii_event         TYPE REF TO zif_abapgit_gui_event
      RETURNING
        VALUE(rs_handled) TYPE zif_abapgit_gui_event_handler=>ty_handling_result
      RAISING
        zcx_abapgit_exception .
    METHODS abapgit_services_actions
      IMPORTING
        !ii_event         TYPE REF TO zif_abapgit_gui_event
      RETURNING
        VALUE(rs_handled) TYPE zif_abapgit_gui_event_handler=>ty_handling_result
      RAISING
        zcx_abapgit_exception .
    METHODS db_actions
      IMPORTING
        !ii_event         TYPE REF TO zif_abapgit_gui_event
      RETURNING
        VALUE(rs_handled) TYPE zif_abapgit_gui_event_handler=>ty_handling_result
      RAISING
        zcx_abapgit_exception .
    CLASS-METHODS file_download
      IMPORTING
        !iv_package TYPE I_CustABAPObjDirectoryEntry-ABAPPackage
        !iv_xstr    TYPE xstring
      RAISING
        zcx_abapgit_exception .
    METHODS git_services
      IMPORTING
        !ii_event         TYPE REF TO zif_abapgit_gui_event
      RETURNING
        VALUE(rs_handled) TYPE zif_abapgit_gui_event_handler=>ty_handling_result
      RAISING
        zcx_abapgit_exception .
    METHODS sap_gui_actions
      IMPORTING
        !ii_event         TYPE REF TO zif_abapgit_gui_event
      RETURNING
        VALUE(rs_handled) TYPE zif_abapgit_gui_event_handler=>ty_handling_result
      RAISING
        zcx_abapgit_exception .
    METHODS other_utilities
      IMPORTING
        !ii_event         TYPE REF TO zif_abapgit_gui_event
      RETURNING
        VALUE(rs_handled) TYPE zif_abapgit_gui_event_handler=>ty_handling_result
      RAISING
        zcx_abapgit_exception .
    METHODS zip_services
      IMPORTING
        !ii_event         TYPE REF TO zif_abapgit_gui_event
      RETURNING
        VALUE(rs_handled) TYPE zif_abapgit_gui_event_handler=>ty_handling_result
      RAISING
        zcx_abapgit_exception .
    METHODS zip_export_transport
      IMPORTING
        iv_key TYPE zif_abapgit_persistence=>ty_repo-key
      RAISING
        zcx_abapgit_exception.
    METHODS go_stage_transport
      IMPORTING
        iv_key           TYPE zif_abapgit_persistence=>ty_repo-key
      RETURNING
        VALUE(ro_filter) TYPE REF TO zcl_abapgit_object_filter_tran
      RAISING
        zcx_abapgit_exception.
    METHODS repository_services
      IMPORTING
        !ii_event         TYPE REF TO zif_abapgit_gui_event
      RETURNING
        VALUE(rs_handled) TYPE zif_abapgit_gui_event_handler=>ty_handling_result
      RAISING
        zcx_abapgit_exception .
    METHODS get_page_diff
      IMPORTING
        !ii_event      TYPE REF TO zif_abapgit_gui_event
      RETURNING
        VALUE(ri_page) TYPE REF TO zif_abapgit_gui_renderable
      RAISING
        zcx_abapgit_exception .
    METHODS get_page_patch
      IMPORTING
        !ii_event      TYPE REF TO zif_abapgit_gui_event
      RETURNING
        VALUE(ri_page) TYPE REF TO zif_abapgit_gui_renderable
      RAISING
        zcx_abapgit_exception .
    METHODS get_page_stage
      IMPORTING
        !ii_event      TYPE REF TO zif_abapgit_gui_event
        ii_obj_filter  TYPE REF TO zif_abapgit_object_filter OPTIONAL
      RETURNING
        VALUE(ri_page) TYPE REF TO zif_abapgit_gui_renderable
      RAISING
        zcx_abapgit_exception .
    CLASS-METHODS jump_object
      IMPORTING
        !iv_obj_type   TYPE string
        !iv_obj_name   TYPE string
        !iv_filename   TYPE string
        !iv_sub_type   TYPE string OPTIONAL
        !iv_sub_name   TYPE string OPTIONAL
        !iv_line       TYPE string OPTIONAL
        !iv_new_window TYPE string DEFAULT 'X'
      RAISING
        zcx_abapgit_exception .
    CLASS-METHODS jump_display_transport
      IMPORTING
        !iv_transport TYPE sxco_transport
        iv_obj_type   TYPE I_CustABAPObjDirectoryEntry-ABAPObjectType OPTIONAL
        iv_obj_name   TYPE I_CustABAPObjDirectoryEntry-ABAPObject OPTIONAL
      RAISING
        zcx_abapgit_exception .
    CLASS-METHODS jump_display_user
      IMPORTING
        !iv_username TYPE syuname
      RAISING
        zcx_abapgit_exception .
    METHODS call_browser
      IMPORTING
        !iv_url TYPE csequence
      RAISING
        zcx_abapgit_exception .
    METHODS call_transaction
      IMPORTING
        !iv_tcode TYPE csequence
      RAISING
        zcx_abapgit_exception .
    METHODS get_state_settings
      IMPORTING
        !ii_event       TYPE REF TO zif_abapgit_gui_event
      RETURNING
        VALUE(rv_state) TYPE i .
    METHODS get_state_diff
      IMPORTING
        !ii_event       TYPE REF TO zif_abapgit_gui_event
      RETURNING
        VALUE(rv_state) TYPE i .
    METHODS main_page
      RETURNING VALUE(ri_page) TYPE REF TO zif_abapgit_gui_renderable
      RAISING   zcx_abapgit_exception.
ENDCLASS.



CLASS zcl_abapgit_gui_router IMPLEMENTATION.
  METHOD zif_abapgit_gui_event_handler~on_event.
    RETURN. " todo, implement method
  ENDMETHOD.
  METHOD main_page.
    RETURN. " todo, implement method
  ENDMETHOD.
  METHOD jump_display_user.
    RETURN. " todo, implement method
  ENDMETHOD.
  METHOD jump_object.
    RETURN. " todo, implement method
  ENDMETHOD.
  METHOD repository_services.
    RETURN. " todo, implement method
  ENDMETHOD.
  METHOD zip_export_transport.
    RETURN. " todo, implement method
  ENDMETHOD.
  METHOD zip_services.
    RETURN. " todo, implement method
  ENDMETHOD.
  METHOD other_utilities.
    RETURN. " todo, implement method
  ENDMETHOD.
  METHOD sap_gui_actions.
    RETURN. " todo, implement method
  ENDMETHOD.


  METHOD abapgit_services_actions.

    IF ii_event->mv_action = zif_abapgit_definitions=>c_action-abapgit_home.
      rs_handled-page  = zcl_abapgit_gui_page_repo_over=>create( ).
      rs_handled-state = zcl_abapgit_gui=>c_event_state-new_page_replacing.
    ENDIF.

  ENDMETHOD.


  METHOD call_browser.

    zcl_abapgit_ui_factory=>get_frontend_services( )->execute( iv_document = |{ iv_url }| ).

  ENDMETHOD.


  METHOD call_transaction.

    DATA lv_msg TYPE c LENGTH 200.

    ASSERT 1 = 'replacedByRefactorMJS'.
    IF sy-subrc <> 0.
      lv_msg = |Error starting transaction { iv_tcode }: { lv_msg }|.
      ASSERT 1 = 'messageStatementRemoved'.
    ELSE.
      lv_msg = |Transaction { iv_tcode } opened in a new window|.
      ASSERT 1 = 'messageStatementRemoved'.
    ENDIF.

  ENDMETHOD.


  METHOD db_actions.

    DATA ls_db_key TYPE zif_abapgit_persistence=>ty_content.
    DATA lo_query TYPE REF TO zcl_abapgit_string_map.

    lo_query = ii_event->query( ).
    CASE ii_event->mv_action.
      WHEN zif_abapgit_definitions=>c_action-db_edit.
        lo_query->to_abap( CHANGING cs_container = ls_db_key ).
        rs_handled-page  = zcl_abapgit_gui_page_db_entry=>create(
          is_key       = ls_db_key
          iv_edit_mode = abap_true ).
        rs_handled-state = zcl_abapgit_gui=>c_event_state-new_page.
      WHEN zif_abapgit_definitions=>c_action-db_display.
        lo_query->to_abap( CHANGING cs_container = ls_db_key ).
        rs_handled-page  = zcl_abapgit_gui_page_db_entry=>create( ls_db_key ).
        rs_handled-state = zcl_abapgit_gui=>c_event_state-new_page.
    ENDCASE.

  ENDMETHOD.


  METHOD file_download.

    DATA:
      lv_path    TYPE string,
      lv_default TYPE string,
      li_fe_serv TYPE REF TO zif_abapgit_frontend_services,
      lv_package TYPE I_CustABAPObjDirectoryEntry-ABAPPackage.

    lv_package = iv_package.
    TRANSLATE lv_package USING '/#'.
    CONCATENATE lv_package '_' sy-datlo '_' sy-timlo '.zip' INTO lv_default.

    li_fe_serv = zcl_abapgit_ui_factory=>get_frontend_services( ).

    lv_path = li_fe_serv->show_file_save_dialog(
      iv_title            = 'Export ZIP'
      iv_extension        = 'zip'
      iv_default_filename = lv_default ).

    li_fe_serv->file_download(
      iv_path = lv_path
      iv_xstr = iv_xstr ).

  ENDMETHOD.


  METHOD general_page_routing.

    DATA: lv_key           TYPE zif_abapgit_persistence=>ty_repo-key,
          lv_last_repo_key TYPE zif_abapgit_persistence=>ty_repo-key.

    lv_key = ii_event->query( )->get( 'KEY' ).

    CASE ii_event->mv_action.
      WHEN zif_abapgit_definitions=>c_action-go_home.                        " Go Home
        lv_last_repo_key = zcl_abapgit_persistence_user=>get_instance( )->get_repo_show( ).

        IF lv_last_repo_key IS NOT INITIAL.
          rs_handled-page  = zcl_abapgit_gui_page_repo_view=>create( lv_last_repo_key ).
          rs_handled-state = zcl_abapgit_gui=>c_event_state-new_page.
        ELSE.
          rs_handled-page = main_page( ).
          rs_handled-state = zcl_abapgit_gui=>c_event_state-new_page.
        ENDIF.
      WHEN zif_abapgit_definitions=>c_action-go_back.                        " Go Back
        rs_handled-state = zcl_abapgit_gui=>c_event_state-go_back.
      WHEN zif_abapgit_definitions=>c_action-go_db.                          " Go DB util page
        rs_handled-page  = zcl_abapgit_gui_page_db=>create( ).
        rs_handled-state = zcl_abapgit_gui=>c_event_state-new_page.
      WHEN zif_abapgit_definitions=>c_action-go_debuginfo.                   " Go debug info
        ASSERT 1 = 'decoupled'.
        rs_handled-state = zcl_abapgit_gui=>c_event_state-new_page.
      WHEN zif_abapgit_definitions=>c_action-go_settings.                    " Go global settings
        rs_handled-page  = zcl_abapgit_gui_page_sett_glob=>create( ).
        rs_handled-state = get_state_settings( ii_event ).
      WHEN zif_abapgit_definitions=>c_action-go_settings_personal.           " Go personal settings
        rs_handled-page  = zcl_abapgit_gui_page_sett_pers=>create( ).
        rs_handled-state = get_state_settings( ii_event ).
      WHEN zif_abapgit_definitions=>c_action-go_background_run.              " Go background run page
        rs_handled-page  = zcl_abapgit_gui_page_run_bckg=>create( ).
        rs_handled-state = zcl_abapgit_gui=>c_event_state-new_page.
      WHEN zif_abapgit_definitions=>c_action-go_repo_diff                    " Go Diff page
        OR zif_abapgit_definitions=>c_action-go_file_diff.
        rs_handled-page  = get_page_diff( ii_event ).
        rs_handled-state = zcl_abapgit_gui=>c_event_state-new_page_w_bookmark.
      WHEN zif_abapgit_definitions=>c_action-go_patch.                       " Go Patch page
        rs_handled-page  = get_page_patch( ii_event ).
        rs_handled-state = zcl_abapgit_gui=>c_event_state-new_page_w_bookmark.
      WHEN zif_abapgit_definitions=>c_action-go_stage.                        " Go Staging page
        rs_handled-page  = get_page_stage( ii_event ).
        rs_handled-state = get_state_diff( ii_event ).
      WHEN zif_abapgit_definitions=>c_action-go_stage_transport.              " Go Staging page by Transport
        rs_handled-page = get_page_stage( ii_event      = ii_event
                                          ii_obj_filter = go_stage_transport( lv_key ) ).
        rs_handled-state = get_state_diff( ii_event ).
      WHEN zif_abapgit_definitions=>c_action-go_tutorial.                     " Go to tutorial
        rs_handled-page  = zcl_abapgit_gui_page_tutorial=>create( ).
        rs_handled-state = zcl_abapgit_gui=>c_event_state-new_page.
      WHEN zif_abapgit_definitions=>c_action-documentation.                   " abapGit docs
        zcl_abapgit_services_abapgit=>open_abapgit_wikipage( ).
        rs_handled-state = zcl_abapgit_gui=>c_event_state-no_more_act.
      WHEN zif_abapgit_definitions=>c_action-go_explore.                      " dotabap
        zcl_abapgit_services_abapgit=>open_dotabap_homepage( ).
        rs_handled-state = zcl_abapgit_gui=>c_event_state-no_more_act.
      WHEN zif_abapgit_definitions=>c_action-changelog.                       " abapGit full changelog
        zcl_abapgit_services_abapgit=>open_abapgit_changelog( ).
        rs_handled-state = zcl_abapgit_gui=>c_event_state-no_more_act.
      WHEN zif_abapgit_definitions=>c_action-homepage.                        " abapGit homepage
        zcl_abapgit_services_abapgit=>open_abapgit_homepage( ).
        rs_handled-state = zcl_abapgit_gui=>c_event_state-no_more_act.
      WHEN zif_abapgit_definitions=>c_action-sponsor.                         " abapGit sponsor us
        zcl_abapgit_services_abapgit=>open_abapgit_homepage( 'sponsor.html' ).
        rs_handled-state = zcl_abapgit_gui=>c_event_state-no_more_act.
      WHEN zif_abapgit_definitions=>c_action-show_hotkeys.                    " show hotkeys
        zcl_abapgit_ui_factory=>get_gui_services(
                             )->get_hotkeys_ctl(
                             )->set_visible( abap_true ).
        rs_handled-state = zcl_abapgit_gui=>c_event_state-re_render.
    ENDCASE.

  ENDMETHOD.


  METHOD get_page_diff.

    DATA: ls_file   TYPE zif_abapgit_git_definitions=>ty_file,
          ls_object TYPE zif_abapgit_definitions=>ty_item,
          lv_key    TYPE zif_abapgit_persistence=>ty_repo-key.

    lv_key             = ii_event->query( )->get( 'KEY' ).
    ls_file-path       = ii_event->query( )->get( 'PATH' ).
    ls_file-filename   = ii_event->query( )->get( 'FILENAME' ). " unescape ?
    ls_object-obj_type = ii_event->query( )->get( 'OBJ_TYPE' ).
    ls_object-obj_name = ii_event->query( )->get( 'OBJ_NAME' ). " unescape ?

    ri_page = zcl_abapgit_gui_page_diff=>create(
      iv_key    = lv_key
      is_file   = ls_file
      is_object = ls_object ).

  ENDMETHOD.


  METHOD get_page_patch.

    DATA: ls_file   TYPE zif_abapgit_git_definitions=>ty_file,
          ls_object TYPE zif_abapgit_definitions=>ty_item,
          lv_key    TYPE zif_abapgit_persistence=>ty_repo-key.

    lv_key             = ii_event->query( )->get( 'KEY' ).
    ls_file-path       = ii_event->query( )->get( 'PATH' ).
    ls_file-filename   = ii_event->query( )->get( 'FILENAME' ). " unescape ?
    ls_object-obj_type = ii_event->query( )->get( 'OBJ_TYPE' ).
    ls_object-obj_name = ii_event->query( )->get( 'OBJ_NAME' ). " unescape ?

    ri_page = zcl_abapgit_gui_page_patch=>create(
      iv_key    = lv_key
      is_file   = ls_file
      is_object = ls_object ).

  ENDMETHOD.


  METHOD get_page_stage.

    DATA: lo_repo       TYPE REF TO zcl_abapgit_repo_online,
          lv_key        TYPE zif_abapgit_persistence=>ty_repo-key,
          lv_seed       TYPE string,
          lv_sci_result TYPE zif_abapgit_definitions=>ty_sci_result,
          lx_error      TYPE REF TO cx_sy_move_cast_error.

    lv_key   = ii_event->query( )->get( 'KEY' ).
    lv_seed  = ii_event->query( )->get( 'SEED' ).

    lv_sci_result = zif_abapgit_definitions=>c_sci_result-no_run.

    TRY.
        lo_repo ?= zcl_abapgit_repo_srv=>get_instance( )->get( lv_key ).
      CATCH cx_sy_move_cast_error INTO lx_error.
        zcx_abapgit_exception=>raise( `Staging is only possible for online repositories.` ).
    ENDTRY.

    IF lo_repo->get_selected_branch( ) CP zif_abapgit_git_definitions=>c_git_branch-tags.
      zcx_abapgit_exception=>raise( |You are working on a tag, must be on branch| ).
    ELSEIF lo_repo->get_selected_commit( ) IS NOT INITIAL.
      zcx_abapgit_exception=>raise( |You are working on a commit, must be on branch| ).
    ENDIF.

    IF lo_repo->get_local_settings( )-code_inspector_check_variant IS NOT INITIAL.

      TRY.
          ri_page = zcl_abapgit_gui_page_code_insp=>create(
            io_repo                  = lo_repo
            iv_raise_when_no_results = abap_true ).

        CATCH zcx_abapgit_exception.
          lv_sci_result = zif_abapgit_definitions=>c_sci_result-passed.
      ENDTRY.

    ENDIF.

    IF ri_page IS INITIAL.
      ri_page = zcl_abapgit_gui_page_stage=>create(
        io_repo       = lo_repo
        iv_seed       = lv_seed
        iv_sci_result = lv_sci_result
        ii_obj_filter = ii_obj_filter ).
    ENDIF.

  ENDMETHOD.


  METHOD get_state_diff.

    " Bookmark current page before jumping to diff page
    IF ii_event->mv_current_page_name CP 'ZCL_ABAPGIT_GUI_PAGE_DIFF'.
      rv_state = zcl_abapgit_gui=>c_event_state-new_page.
    ELSE.
      rv_state = zcl_abapgit_gui=>c_event_state-new_page_w_bookmark.
    ENDIF.

  ENDMETHOD.


  METHOD get_state_settings.

    " Bookmark current page before jumping to any settings page
    IF ii_event->mv_current_page_name CP 'ZCL_ABAPGIT_GUI_PAGE_SETT_*'.
      rv_state = zcl_abapgit_gui=>c_event_state-new_page_replacing.
    ELSE.
      rv_state = zcl_abapgit_gui=>c_event_state-new_page_w_bookmark.
    ENDIF.

  ENDMETHOD.


  METHOD git_services.

    DATA lv_key TYPE zif_abapgit_persistence=>ty_repo-key.
    DATA li_repo TYPE REF TO zif_abapgit_repo.

    lv_key = ii_event->query( )->get( 'KEY' ).

    IF lv_key IS NOT INITIAL.
      li_repo = zcl_abapgit_repo_srv=>get_instance( )->get( lv_key ).
    ENDIF.

    CASE ii_event->mv_action.
      WHEN zif_abapgit_definitions=>c_action-git_pull.                      " GIT Pull
        zcl_abapgit_services_git=>pull( lv_key ).
        rs_handled-state = zcl_abapgit_gui=>c_event_state-re_render.
      WHEN zif_abapgit_definitions=>c_action-git_branch_create.             " GIT Create new branch
        zcl_abapgit_services_git=>create_branch( lv_key ).
        rs_handled-state = zcl_abapgit_gui=>c_event_state-re_render.
      WHEN zif_abapgit_definitions=>c_action-git_branch_delete.             " GIT Delete remote branch
        zcl_abapgit_services_git=>delete_branch( lv_key ).
        rs_handled-state = zcl_abapgit_gui=>c_event_state-re_render.
      WHEN zif_abapgit_definitions=>c_action-git_branch_switch.             " GIT Switch branch
        zcl_abapgit_services_git=>switch_branch( lv_key ).
        rs_handled-state = zcl_abapgit_gui=>c_event_state-re_render.
      WHEN zif_abapgit_definitions=>c_action-git_branch_merge.              " GIT Merge branch
        rs_handled-page  = zcl_abapgit_gui_page_merge_sel=>create( li_repo ).
        rs_handled-state = zcl_abapgit_gui=>c_event_state-new_page.
      WHEN zif_abapgit_definitions=>c_action-git_tag_create.                " GIT Tag create
        rs_handled-page  = zcl_abapgit_gui_page_tags=>create( li_repo ).
        rs_handled-state = zcl_abapgit_gui=>c_event_state-new_page.
      WHEN zif_abapgit_definitions=>c_action-git_tag_delete.                " GIT Tag delete
        zcl_abapgit_services_git=>delete_tag( lv_key ).
        zcl_abapgit_services_repo=>refresh( lv_key ).
        rs_handled-state = zcl_abapgit_gui=>c_event_state-re_render.
      WHEN zif_abapgit_definitions=>c_action-git_tag_switch.                " GIT Switch Tag
        zcl_abapgit_services_git=>switch_tag( lv_key ).
        rs_handled-state = zcl_abapgit_gui=>c_event_state-re_render.
    ENDCASE.

  ENDMETHOD.


  METHOD go_stage_transport.

    DATA lt_r_trkorr TYPE zif_abapgit_definitions=>ty_trrngtrkor_tt.
    DATA lo_repo TYPE REF TO zcl_abapgit_repo.

    lt_r_trkorr = zcl_abapgit_ui_factory=>get_popups( )->popup_select_wb_tc_tr_and_tsk( ).

    lo_repo ?= zcl_abapgit_repo_srv=>get_instance( )->get( iv_key ).

    CREATE OBJECT ro_filter.
    ro_filter->set_filter_values( iv_package  = lo_repo->get_package( )
                                  it_r_trkorr = lt_r_trkorr ).

  ENDMETHOD.


  METHOD jump_display_transport.
    ASSERT 1 = 'replacedByRefactorMJS'.
  ENDMETHOD.
ENDCLASS.
