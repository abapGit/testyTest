#!/bin/bash
set -e # exit on error

rm -rf abapGit
git clone https://github.com/abapGit/abapGit --depth 1
rm -f open/*
rm -f cloud/*

cp abapGit/src/ui/core/zcl_abapgit_gui_hotkey_ctl* open
cp abapGit/src/apack/zif_abapgit_apack_definitions* open
cp abapGit/src/background/zif_abapgit_background* open
cp abapGit/src/cts/zcl_abapgit_default_transport* open
cp abapGit/src/cts/zif_abapgit_cts_api* open
cp abapGit/src/data/z* open
cp abapGit/src/utils/zcl_abapgit_timer* open
cp abapGit/src/exits/z* open
cp abapGit/src/git_platform/z* open
cp abapGit/src/git/zif* open
cp abapGit/src/git/zcl* open
cp abapGit/src/git/zlib/z* open
cp abapGit/src/http/zcl_abapgit_http* open
cp abapGit/src/http/zcl_abapgit_login_manager* open
cp abapGit/src/http/zcl_abapgit_url* open
cp abapGit/src/http/zif_abapgit_http_agent* open
cp abapGit/src/http/zif_abapgit_http_response* open
cp abapGit/src/inspect/zif_abapgit_code_inspector* open
cp abapGit/src/json/z* open
cp abapGit/src/objects/aff/zcl_abapgit_aff_registry* open
cp abapGit/src/objects/aff/zif_abapgit_aff_registry* open
cp abapGit/src/repo/zcl_abapgit_file_status* open
cp abapGit/src/objects/core/zcl_abapgit_filename_logic* open
cp abapGit/src/objects/core/zcl_abapgit_folder_logic* open
cp abapGit/src/utils/zcl_abapgit_item_state* open
cp abapGit/src/objects/core/zif_abapgit_tadir* open
cp abapGit/src/objects/jump/zif_abapgit_gui_jumper* open
cp abapGit/src/objects/texts/zif_abapgit_longtexts* open
cp abapGit/src/objects/texts/zif_abapgit_lxe_texts* open
cp abapGit/src/objects/zif_abapgit_comparator* open
cp abapGit/src/objects/zif_abapgit_object* open
cp abapGit/src/objects/zif_abapgit_objects* open
cp abapGit/src/persist/zcl_abapgit_persist_background* open
cp abapGit/src/persist/zcl_abapgit_persist_factory* open
cp abapGit/src/persist/zcl_abapgit_persist_injector* open
cp abapGit/src/persist/zcl_abapgit_persistence_repo* open
cp abapGit/src/persist/zcl_abapgit_persist_settings* open
cp abapGit/src/persist/zcl_abapgit_persistence_db* open
cp abapGit/src/persist/zcl_abapgit_persistence_user* open
cp abapGit/src/persist/zif_abapgit_persist_repo_cs* open
cp abapGit/src/persist/zif_abapgit_persist_repo* open
cp abapGit/src/persist/zif_abapgit_persist_settings* open
cp abapGit/src/persist/zif_abapgit_persist_user* open
cp abapGit/src/persist/zif_abapgit_persistence* open
cp abapGit/src/progress/z* open
cp abapGit/src/progress/*clas* open
cp abapGit/src/progress/*intf* open
cp abapGit/src/progress/z* open
cp abapGit/src/repo/zcl_abapgit_dot_abapgit* open
cp abapGit/src/repo/zcl_abapgit_repo_content_list* open
cp abapGit/src/repo/zcl_abapgit_repo_offline* open
cp abapGit/src/repo/zcl_abapgit_repo_srv* open
cp abapGit/src/repo/zcl_abapgit_repo_online* open
cp abapGit/src/repo/zcl_abapgit_repo.clas* open
cp abapGit/src/repo/zcl_abapgit_repo_checksums* open
cp abapGit/src/repo/zif* open
cp abapGit/src/stage/z* open
cp abapGit/src/syntax/z* open
cp abapGit/src/ui/*w3mi* open
cp abapGit/src/ui/core/zcl_abapgit_gui_asset_manager* open
cp abapGit/src/ui/core/zcl_abapgit_gui_css_processor* open
cp abapGit/src/ui/core/zcl_abapgit_gui_event* open
cp abapGit/src/ui/core/zcl_abapgit_gui_html_processor* open
cp abapGit/src/ui/core/zcl_abapgit_gui_utils.clas* open
cp abapGit/src/ui/core/zcl_abapgit_gui.clas* open
cp abapGit/src/ui/core/zcl_abapgit_html_parts* open
cp abapGit/src/ui/core/zcl_abapgit_html.clas* open
cp abapGit/src/ui/core/zcx* open
cp abapGit/src/ui/core/zif* open
cp abapGit/src/ui/lib/zcl_abapgit_gui_buttons* open
cp abapGit/src/ui/lib/zcl_abapgit_gui_chunk_lib* open
cp abapGit/src/ui/lib/zcl_abapgit_gui_component* open
cp abapGit/src/ui/lib/zcl_abapgit_html* open
cp abapGit/src/ui/lib/zif* open
cp abapGit/src/utils/zcl_abapgit_string_buffer* open
cp abapGit/src/ui/pages/zcl_abapgit_gui_page_addofflin* open
cp abapGit/src/ui/pages/zcl_abapgit_gui_page_addonline* open
cp abapGit/src/ui/pages/zcl_abapgit_gui_page_code_insp* open
cp abapGit/src/ui/pages/zcl_abapgit_gui_page_commit* open
cp abapGit/src/ui/pages/zcl_abapgit_gui_page_db* open
cp abapGit/src/ui/pages/zcl_abapgit_gui_page_diff* open
cp abapGit/src/ui/pages/zcl_abapgit_gui_page_ex_object* open
cp abapGit/src/ui/pages/zcl_abapgit_gui_page_ex_pckage* open
cp abapGit/src/ui/lib/zcl_abapgit_gui_page_hoc* open
cp abapGit/src/ui/pages/zcl_abapgit_gui_page_merge* open
cp abapGit/src/ui/pages/zcl_abapgit_gui_page_patch* open
cp abapGit/src/ui/pages/zcl_abapgit_gui_page_repo_over* open
cp abapGit/src/ui/pages/zcl_abapgit_gui_page_repo_view* open
cp abapGit/src/ui/pages/zcl_abapgit_gui_page_run_bckg* open
cp abapGit/src/ui/pages/zcl_abapgit_gui_page_sett_bckg* open
cp abapGit/src/ui/pages/zcl_abapgit_gui_page_sett_glob* open
cp abapGit/src/ui/pages/zcl_abapgit_gui_page_sett_info* open
cp abapGit/src/ui/pages/zcl_abapgit_gui_page_sett_locl* open
cp abapGit/src/ui/pages/zcl_abapgit_gui_page_sett_pers* open
cp abapGit/src/ui/pages/zcl_abapgit_gui_page_sett_remo* open
cp abapGit/src/ui/pages/zcl_abapgit_gui_page_stage* open
cp abapGit/src/ui/pages/zcl_abapgit_gui_page_syntax* open
cp abapGit/src/ui/pages/zcl_abapgit_gui_page_tags* open
cp abapGit/src/ui/pages/zcl_abapgit_gui_page_tutorial* open
cp abapGit/src/ui/lib/zcl_abapgit_gui_page.clas* open
cp abapGit/src/ui/lib/zcl_abapgit_gui_picklist* open
cp abapGit/src/ui/lib/zcl_abapgit_gui_in_page_modal* open
cp abapGit/src/ui/routing/zcl* open
cp abapGit/src/ui/routing/zif* open
cp abapGit/src/ui/zcl_abapgit_ui_factory* open
cp abapGit/src/ui/zcl_abapgit_ui_injector* open
cp abapGit/src/ui/zif_abapgit_frontend_services* open
cp abapGit/src/ui/zif_abapgit_popups* open
cp abapGit/src/objects/sap/zif_abapgit_* open
cp abapGit/src/utils/zcl_abapgit_log* open
cp abapGit/src/utils/zcl_abapgit_news* open
cp abapGit/src/utils/zcl_abapgit_path* open
cp abapGit/src/utils/zcl_abapgit_repo_labels* open
cp abapGit/src/utils/zcl_abapgit_string_map* open
cp abapGit/src/utils/zcl_abapgit_utils* open
cp abapGit/src/utils/zcl_abapgit_version* open
cp abapGit/src/utils/zif_abapgit_log* open
cp abapGit/src/utils/zcl_abapgit_environment.clas.abap open
cp abapGit/src/utils/zcl_abapgit_zip* open
cp abapGit/src/xml/*clas* open
cp abapGit/src/xml/*intf* open
cp abapGit/src/exits/z* open
cp abapGit/src/zcl_abapgit_factory* open
cp abapGit/src/zcl_abapgit_injector* open
cp abapGit/src/zcl_abapgit_settings.clas* open
cp abapGit/src/zcx* open
cp abapGit/src/zif_abapgit_environment* open
cp abapGit/src/zif_abapgit_definitions* open
cp abapGit/src/zif_abapgit_version* open

rm -f open/zcl_abapgit_html_action_utils.clas.testclasses.abap
rm -f open/zcl_abapgit_injector.clas.testclasses.abap
rm -f open/zcl_abapgit_file_status.clas.testclasses.abap
rm -f open/zcl_abapgit_filename_logic.clas.testclasses.abap
rm -f open/zcl_abapgit_ui_injector.clas.testclasses.abap
rm -f open/*xml*.clas.testclasses.abap
rm -f open/zcl_abapgit_persistence_user.clas.testclasses.abap


# decoupling classes
sed -i "s/ CREATE OBJECT gi_popups TYPE zcl_abapgit_popups./ ASSERT 1 = 'decoupled'./ig" ./open/zcl_abapgit_ui_factory.clas.abap
sed -i "s/ CREATE OBJECT gi_gui_jumper TYPE zcl_abapgit_gui_jumper./ ASSERT 1 = 'decoupled'./ig" ./open/zcl_abapgit_ui_factory.clas.abap
sed -i "s/ CREATE OBJECT gi_cts_api TYPE zcl_abapgit_cts_api./ ASSERT 1 = 'decoupled'./ig" ./open/zcl_abapgit_factory.clas.abap
sed -i "s/ ri_http_agent = zcl_abapgit_http_agent=>create( )./ ASSERT 1 = 'decoupled'./ig" ./open/*.abap
sed -i "s/ CREATE OBJECT gi_lxe_texts TYPE zcl_abapgit_lxe_texts./ ASSERT 1 = 'decoupled'./ig" ./open/zcl_abapgit_factory.clas.abap
sed -i "s/ CREATE OBJECT gi_longtext TYPE zcl_abapgit_longtexts./ ASSERT 1 = 'decoupled'./ig" ./open/*.abap
sed -i "s/ CREATE OBJECT ls_code_inspector-instance TYPE zcl_abapgit_code_inspector/ CREATE OBJECT ls_code_inspector-instance TYPE ('DECOUPLED')/ig" ./open/*.abap
sed -i "s/ CREATE OBJECT gi_html_viewer TYPE zcl_abapgit_html_viewer_gui/ CREATE OBJECT gi_html_viewer TYPE ('DECOUPLED')/ig" ./open/zcl_abapgit_ui_factory.clas.abap
sed -i "s/ TYPE seoclskey/ TYPE char30/ig" ./open/zif_abapgit_exit.intf.abap # https://github.com/abapGit/abapGit/pull/6305
sed -i "s/ zcl_abapgit_code_inspector=>validate_check_variant( lv_check_variant )./ ASSERT 1 = 'decoupled'./ig" ./open/zcl_abapgit_gui_page_sett_locl.clas.abap
sed -i "s/ zcl_abapgit_transport=>validate_transport_request( lv_transport_request )./ ASSERT 1 = 'decoupled'./ig" ./open/zcl_abapgit_gui_page_sett_locl.clas.abap
sed -i "s/ cl_gui_cfw=>flush( )./ ASSERT 1 = 'decoupled'./ig" ./open/zcl_abapgit_services_basis.clas.abap

sed -i 's/ TYPE trobjtype/ TYPE tadir-object/ig' ./open/*.abap
sed -i 's/ TYPE sobj_name/ TYPE tadir-obj_name/ig' ./open/*.abap
sed -i 's/ TABLE OF sobj_name/ TABLE OF tadir-obj_name/ig' ./open/*.abap
sed -i 's/ TYPE SSFAPPLSSL/ TYPE char6/ig' ./open/*.intf.abap
sed -i 's/ TYPE saprelease/ TYPE c LENGTH 10/ig' ./open/*.intf.abap
sed -i 's/ TYPE sappatchlv/ TYPE c LENGTH 10/ig' ./open/*.intf.abap
sed -i 's/ TYPE sappatchlv/ TYPE c LENGTH 10/ig' ./open/*.intf.abap
sed -i 's/ TYPE enqmode/ TYPE c/ig' ./open/*.abap
sed -i 's/ TYPE progname/ TYPE char30/ig' ./open/*.abap
sed -i 's/ OF bdcdata/ OF string/ig' ./open/*.abap
sed -i "s/zcl_abapgit_objects_super=>c_user_unknown/'UNKNOWN'/ig" ./open/*.abap
sed -i 's/ TYPE devlayer/ TYPE char4/ig' ./open/*.abap
sed -i 's/ TYPE namespace/ TYPE char10/ig' ./open/*.abap
sed -i 's/ TYPE parentcl/ TYPE devclass/ig' ./open/*.abap
sed -i 's/ TYPE tcode/ TYPE string/ig' ./open/zcl_abapgit_gui_page_repo_view.clas.abap
sed -i 's/ TYPE scit_alvlist/ TYPE string_table/ig' ./open/*.abap
sed -i 's/ TYPE tdevc-as4user/ TYPE usnam/ig' ./open/*.abap
sed -i 's/ TYPE sci_chkv/ TYPE char30/ig' ./open/*.abap   # if_satc_api_factory=>ty_check_variant_name
sed -i 's/ TYPE trobj_name/ TYPE char120/ig' ./open/*.abap
sed -i 's/ OF namespace/ OF char10/ig' ./open/*.abap
sed -i 's/ TYPE trnspace-namespace/ TYPE char10/ig' ./open/*.abap
sed -i 's/ TYPE trnspace/ TYPE char10/ig' ./open/*.abap
sed -i 's/ TYPE ABAPTXT255_TAB/ TYPE string_table/ig' ./open/*.abap
sed -i "s/ zcl_abapgit_gui_page_repo_view=>c_actions-change_dir / 'decoupled' /ig" ./open/zcl_abapgit_gui_chunk_lib.clas.abap
sed -i "s/ SET LOCALE LANGUAGE lv_main_language./ ASSERT 1 = 'decoupled'./ig" ./open/zcl_abapgit_gui_page_repo_view.clas.abap
sed -i "s/ SET LOCALE LANGUAGE lv_save_sy_langu./ ASSERT 1 = 'decoupled'./ig" ./open/zcl_abapgit_gui_page_repo_view.clas.abap
sed -i "s/ READ LINE lv_line LINE VALUE INTO lv_text./ ASSERT 1 = 'decoupled'./ig" ./open/zcl_abapgit_gui_page_run_bckg.clas.abap
sed -i "s/ SELECT SINGLE editflag FROM trnspace INTO ls_trnspace-editflag WHERE namespace = lv_namespace./ ASSERT 1 = 'decoupled'./ig" ./open/zcl_abapgit_file_status.clas.abap
sed -i "s/ ELSEIF ls_trnspace-editflag <> 'X'./ ELSEIF ls_trnspace <> 'X'./ig" ./open/zcl_abapgit_file_status.clas.abap
sed -i "s/ rs_handled-page  = zcl_abapgit_gui_page_debuginfo=>create( )./ ASSERT 1 = 'decoupled'./ig" ./open/zcl_abapgit_gui_router.clas.abap
sed -i "s/ rs_handled-page  = zcl_abapgit_gui_page_sett_repo=>create( lo_repo )./ ASSERT 1 = 'decoupled'./ig" ./open/zcl_abapgit_gui_router.clas.abap
sed -i "s/ zcl_abapgit_transport_mass=>run( )./ ASSERT 1 = 'decoupled'./ig" ./open/zcl_abapgit_gui_router.clas.abap
sed -i "s/rs_handled-page  = zcl_abapgit_gui_page_runit=>create( mo_repo )./ ASSERT 1 = 'decoupled'./ig" ./open/zcl_abapgit_gui_page_repo_view.clas.abap
sed -i "s/lv_adt_link = zcl_abapgit_adt_link=>link_transport( iv_transport )./ ASSERT 1 = 'decoupled'./ig" ./open/zcl_abapgit_gui_router.clas.abap

# CLAS shims,
sed -i -e '/PUBLIC SECTION/r ./shims/zcx_abapgit_exception.prog.abap' ./open/zcx_abapgit_exception.clas.abap
sed -i -e '/PUBLIC SECTION/r ./shims/zcl_abapgit_html_action_utils.prog.abap' ./open/zcl_abapgit_html_action_utils.clas.abap
sed -i -e '/PUBLIC SECTION/r ./shims/zcl_abapgit_gui_event.prog.abap' ./open/zcl_abapgit_gui_event.clas.abap
sed -i -e '/PUBLIC SECTION/r ./shims/zcl_abapgit_gui.prog.abap' ./open/zcl_abapgit_gui.clas.abap
sed -i -e '/PUBLIC SECTION/r ./shims/zcl_abapgit_default_transport.prog.abap' ./open/zcl_abapgit_default_transport.clas.abap
sed -i -e '/PUBLIC SECTION/r ./shims/zcl_abapgit_folder_logic.prog.abap' ./open/zcl_abapgit_folder_logic.clas.abap
sed -i -e '/PUBLIC SECTION/r ./shims/zcl_abapgit_services_basis.prog.abap' ./open/zcl_abapgit_services_basis.clas.abap
sed -i -e '/PUBLIC SECTION/r ./shims/zcl_abapgit_services_repo.prog.abap' ./open/zcl_abapgit_services_repo.clas.abap

# INTF shims,
sed -i -e '/PUBLIC /r ./shims/zif_abapgit_definitions.prog.abap' ./open/zif_abapgit_definitions.intf.abap
sed -i -e '/PUBLIC /r ./shims/zif_abapgit_html_viewer.prog.abap' ./open/zif_abapgit_html_viewer.intf.abap
sed -i -e '/PUBLIC /r ./shims/zif_abapgit_popups.prog.abap' ./open/zif_abapgit_popups.intf.abap
sed -i -e '/PUBLIC/r ./shims/zif_abapgit_longtexts.prog.abap' ./open/zif_abapgit_longtexts.intf.abap
sed -i -e '/PUBLIC/r ./shims/zif_abapgit_sap_package.prog.abap' ./open/zif_abapgit_sap_package.intf.abap

###########################################################################

cp replace/zcl_abapgit_apack* open
cp replace/zcl_abapgit_data_supporter* open
cp replace/zcl_abapgit_background* open
cp replace/zcl_abapgit_diff* open
cp replace/zcl_abapgit_exception_viewer* open
cp replace/zcl_abapgit_http* open
cp replace/zcl_abapgit_tadir.clas* open
cp replace/zcl_abapgit_transport* open
cp replace/zcl_abapgit_progress* open
cp replace/zcl_abapgit_sap_namespace* open
cp replace/zcl_abapgit_log_viewer* open
cp replace/zcl_abapgit_environment* open
cp replace/zcl_abapgit_objects_activation* open
cp replace/zcl_abapgit_object_filter_tran* open
cp replace/zcl_abapgit_objects* open
# cp replace/zcl_abapgit_repo* open
cp replace/zcl_abapgit_repo_filter* open
cp replace/zcl_abapgit_frontend_services* open
cp replace/zcl_abapgit_objects_super* open
cp replace/zcl_abapgit_gui_page_codi_base* open
cp replace/zcl_abapgit_gui_page_data* open
cp replace/zcl_abapgit_requirement_helper* open
cp replace/zcl_abapgit_serialize* open
cp replace/zcl_abapgit_services_abapgit* open
cp replace/zcl_abapgit_user_record* open
cp replace/zcl_abapgit_sap_package* open
rm ./open/zcl_abapgit_http_agent.clas.locals_imp.abap

cp additional/*.* open
cp open/* cloud
cp additional/open/*.* open
cp additional/cloud/*.* cloud

cp abapGit/src/utils/zcl_abapgit_convert* open
cp abapGit/src/http/zcl_abapgit_http.clas* open
cp abapGit/src/http/zcl_abapgit_http_client.clas* open
cp abapGit/src/http/zcl_abapgit_proxy_config* open
cp abapGit/src/http/zcl_abapgit_proxy_auth* open
cp abapGit/src/ui/zcl_abapgit_password_dialog* open

# replace or rewrite most of the code,
cp replace/zcl_abapgit_convert* cloud
cp replace/zcl_abapgit_http_utility* cloud
cp replace/zcl_abapgit_xml_pretty* cloud
rm cloud/*.w3mi.*

###########################################################################

sed -i "s/ TYPE REF TO if_http_client/ TYPE REF TO object/ig" ./cloud/*.abap
sed -i 's/tadir-pgmid/I_CustABAPObjDirectoryEntry-ABAPObjectCategory/ig' ./cloud/*.intf.abap
sed -i 's/ tadir-object/ I_CustABAPObjDirectoryEntry-ABAPObjectType/ig' ./cloud/*.abap
sed -i 's/ tadir-obj_name/ I_CustABAPObjDirectoryEntry-ABAPObject/ig' ./cloud/*.abap
sed -i 's/ tadir-masterlang/ spras/ig' ./cloud/*.abap
sed -i 's/ TYPE tadir-srcsystem/ TYPE c LENGTH 10/ig' ./cloud/*.intf.abap
sed -i 's/ TYPE tadir-delflag/ TYPE abap_bool/ig' ./cloud/*.abap
sed -i 's/ TYPE tadir-genflag/ TYPE abap_bool/ig' ./cloud/*.abap
sed -i 's/ TYPE seoclsname/ TYPE char30/ig' ./cloud/*.abap
sed -i 's/ TYPE filetable/ TYPE string/ig' ./cloud/*.abap
sed -i 's/ TYPE wwwdatatab-objid/ TYPE char40/ig' ./cloud/*.abap
sed -i 's/ DEFAULT if_salv_c_selection_mode=>multiple/ OPTIONAL/ig' ./cloud/*.intf.abap
sed -i 's/ TYPE tdevc-dlvunit/ TYPE c LENGTH 30/ig' ./cloud/*.intf.abap
sed -i 's/ cl_http_utility=>fields_to_string/ zcl_abapgit_http_utility=>fields_to_string/ig' ./cloud/*.abap
sed -i "s/GET PARAMETER ID 'DBT' FIELD lv_mode.//ig" ./cloud/*.abap
sed -i "s/ TYPE REF TO cl_gui_container DEFAULT cl_gui_container=>screen0/ TYPE REF TO object OPTIONAL/ig" ./cloud/*.abap
sed -i "s/ li_stream_factory->create_istream_string( iv_xml )/ li_stream_factory->create_istream_xstring( zcl_abapgit_convert=>string_to_xstring_utf8( iv_xml ) )/ig" ./cloud/*xml*.abap
sed -i "s/ li_ostream = li_streamfactory->create_ostream_cstring( rv_xml )./ DATA foo TYPE xstring. li_ostream = li_streamfactory->create_ostream_xstring( foo ). rv_xml = zcl_abapgit_convert=>xstring_to_string_utf8( foo )./ig" ./cloud/*xml*.abap
sed -i "s/ li_istream->close( )./ /ig" ./cloud/*xml*.abap
sed -i "s/ SUBMIT (sy-cprog)./ ASSERT 1 = 'non_cloud'./ig" ./cloud/zcl_abapgit_repo.clas.abap
sed -i "s/IN UPDATE TASK//ig" ./cloud/zcl_abapgit_persistence_db.clas.abap

sed -i "s/cl_gui_cfw=>compute_pixel_from_metric( x_or_y = 'X'//ig" ./cloud/zcl_abapgit_html.clas.abap
sed -i "s/in = 1 )/1/ig" ./cloud/zcl_abapgit_html.clas.abap

node refactor.mjs