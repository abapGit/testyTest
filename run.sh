#!/bin/bash
set -e # exit on error

rm -rf abapGit
git clone https://github.com/abapGit/abapGit --depth 1
rm -f open/*
rm -f cloud/*

SECONDS=0

cp abapGit/src/apack/zif_abapgit_apack_definitions* open
cp abapGit/src/background/zif* open
cp abapGit/src/cts/zcl_abapgit_default_transport* open
cp abapGit/src/cts/zcl_abapgit_transport_2_branch* open
cp abapGit/src/cts/zcl_abapgit_transport_objects* open
cp abapGit/src/cts/zif* open
cp abapGit/src/data/z* open
cp abapGit/src/exits/z* open
cp abapGit/src/git_platform/z* open
cp abapGit/src/git/z*.* open
cp abapGit/src/git/v2/z* open
cp abapGit/src/git/zlib/z* open
cp abapGit/src/http/zcl_abapgit_http* open
cp abapGit/src/http/zcl_abapgit_login_manager* open
cp abapGit/src/http/zcl_abapgit_url* open
cp abapGit/src/http/zif* open
cp abapGit/src/inspect/zif* open
cp abapGit/src/json/z* open
cp abapGit/src/objects/aff_types/zif* open
cp abapGit/src/objects/aff/zcl_abapgit_aff_registry* open
cp abapGit/src/objects/aff/zif* open
cp abapGit/src/objects/core/zcl_abapgit_f* open
cp abapGit/src/objects/core/zcl_abapgit_item_graph* open
cp abapGit/src/objects/core/zcl_abapgit_o* open
cp abapGit/src/objects/core/zif_abapgit_tadir* open
cp abapGit/src/objects/jump/zif_abapgit_gui_jumper* open
cp abapGit/src/objects/sap/zcl_abapgit_sap_namespace* open
cp abapGit/src/objects/sap/zif* open
cp abapGit/src/objects/texts/zcl_abapgit_i18n_params* open
cp abapGit/src/objects/texts/zcl_abapgit_po_file* open
cp abapGit/src/objects/texts/zif_abapgit_i18n_file* open
cp abapGit/src/objects/texts/zif_abapgit_longtexts* open
cp abapGit/src/objects/texts/zif_abapgit_lxe_texts* open
cp abapGit/src/objects/zcl_abapgit_objects_factory* open
cp abapGit/src/objects/zif* open
cp abapGit/src/persist/zcl_abapgit_persist_background* open
cp abapGit/src/persist/zcl_abapgit_persist_factory* open
cp abapGit/src/persist/zcl_abapgit_persist_injector* open
cp abapGit/src/persist/zcl_abapgit_persist_settings* open
cp abapGit/src/persist/zcl_abapgit_persistence_db* open
cp abapGit/src/persist/zcl_abapgit_persistence_repo* open
cp abapGit/src/persist/zcl_abapgit_persistence_user* open
cp abapGit/src/persist/zif* open
cp abapGit/src/ui/progress/z* open
cp abapGit/src/repo/zcl* open
cp abapGit/src/repo/zif* open
cp abapGit/src/syntax/z* open
cp abapGit/src/ui/*w3mi* open
cp abapGit/src/ui/core/zcl_abapgit_gui* open
cp abapGit/src/ui/core/zcl_abapgit_html_parts* open
cp abapGit/src/ui/core/zcl_abapgit_html.clas* open
cp abapGit/src/ui/core/zcx* open
cp abapGit/src/ui/core/zif* open
cp abapGit/src/ui/lib/z* open
cp abapGit/src/ui/pages/*w3mi* open
cp abapGit/src/ui/pages/zcl_abapgit_gui_page_addofflin* open
cp abapGit/src/ui/pages/zcl_abapgit_gui_page_addonline* open
cp abapGit/src/ui/pages/zcl_abapgit_gui_page_code_insp* open
cp abapGit/src/ui/pages/zcl_abapgit_gui_page_commit* open
cp abapGit/src/ui/flow/z* open
cp abapGit/src/ui/pages/zcl_abapgit_gui_page_db* open
cp abapGit/src/ui/pages/zcl_abapgit_gui_page_pull* open
cp abapGit/src/ui/pages/zcl_abapgit_gui_page_diff* open
cp abapGit/src/ui/pages/zcl_abapgit_gui_page_ex_object* open
cp abapGit/src/ui/pages/zcl_abapgit_gui_page_ex_pckage* open
cp abapGit/src/ui/pages/zcl_abapgit_gui_page_merge* open
cp abapGit/src/ui/pages/zcl_abapgit_gui_page_patch* open
cp abapGit/src/ui/pages/zcl_abapgit_gui_page_data* open
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
cp abapGit/src/ui/popups/z* open
cp abapGit/src/ui/routing/z* open
cp abapGit/src/ui/zcl_abapgit_ui* open
cp abapGit/src/ui/zif* open
cp abapGit/src/repo/utils/z* open
cp abapGit/src/repo/stage/z* open
cp abapGit/src/utils/zcl_abapgit_log* open
cp abapGit/src/utils/zcl_abapgit_path* open
cp abapGit/src/utils/zcl_abapgit_string_buffer* open
cp abapGit/src/utils/zcl_abapgit_string_map* open
cp abapGit/src/utils/zcl_abapgit_timer* open
cp abapGit/src/utils/zcl_abapgit_utils* open
cp abapGit/src/utils/zif* open
cp abapGit/src/xml/z* open
cp abapGit/src/zcl_abapgit_factory* open
cp abapGit/src/zcl_abapgit_injector* open
cp abapGit/src/env/z* open
cp abapGit/src/zcx* open
cp abapGit/src/zif* open

echo "Copying done, $SECONDS seconds"
SECONDS=0

rm -f open/*xml*.clas.testclasses.abap
rm -f open/zcl_abapgit_data_supporter.clas.*
rm -f open/zcl_abapgit_language.*
rm -f open/zif_abapgit_object_tabl.*
rm -f open/zcl_abapgit_diff.clas.testclasses.abap
rm -f open/zcl_abapgit_file_status.clas.testclasses.abap
rm -f open/zcl_abapgit_environment.clas.testclasses.abap
rm -f open/zcl_abapgit_filename_logic.clas.testclasses.abap
rm -f open/zcl_abapgit_html_action_utils.clas.testclasses.abap
rm -f open/zcl_abapgit_injector.clas.testclasses.abap
rm -f open/zcl_abapgit_object_filter_tran.clas.testclasses.abap
rm -f open/zcl_abapgit_objects_activation.clas.testclasses.abap
rm -f open/zcl_abapgit_objects_check.clas.testclasses.abap
rm -f open/zcl_abapgit_persistence_user.clas.testclasses.abap
rm -f open/zcl_abapgit_requirement_helper.clas.testclasses.abap
rm -f open/zcl_abapgit_ui_injector.clas.testclasses.abap
rm -f open/zcl_abapgit_user_record.clas.testclasses.abap

echo "RM done, $SECONDS seconds"
SECONDS=0

# decoupling classes
sed -i "s/ CREATE OBJECT gi_popups TYPE zcl_abapgit_popups./ ASSERT 1 = 'decoupled'./ig" ./open/zcl_abapgit_ui_factory.clas.abap
sed -i "s/ CREATE OBJECT gi_gui_jumper TYPE zcl_abapgit_gui_jumper./ ASSERT 1 = 'decoupled'./ig" ./open/zcl_abapgit_objects_factory.clas.abap
sed -i "s/ CREATE OBJECT gi_function_module TYPE zcl_abapgit_function_module./ ASSERT 1 = 'decoupled'./ig" ./open/zcl_abapgit_factory.clas.abap
sed -i "s/ ri_http_agent = zcl_abapgit_http_agent=>create( )./ ASSERT 1 = 'decoupled'./ig" ./open/*.abap
sed -i "s/ CREATE OBJECT gi_lxe_texts TYPE zcl_abapgit_lxe_texts./ ASSERT 1 = 'decoupled'./ig" ./open/zcl_abapgit_factory.clas.abap
sed -i "s/ CREATE OBJECT gi_sap_report TYPE zcl_abapgit_sap_report./ ASSERT 1 = 'decoupled'./ig" ./open/zcl_abapgit_factory.clas.abap
sed -i "s/ CREATE OBJECT gi_longtext TYPE zcl_abapgit_longtexts./ ASSERT 1 = 'decoupled'./ig" ./open/*.abap
sed -i "s/ CREATE OBJECT gi_supporter TYPE zcl_abapgit_data_supporter./ ASSERT 1 = 'decoupled'./ig" ./open/zcl_abapgit_data_factory.clas.abap
sed -i "s/ CREATE OBJECT ls_code_inspector-instance TYPE zcl_abapgit_code_inspector/ CREATE OBJECT ls_code_inspector-instance TYPE ('DECOUPLED')/ig" ./open/*.abap
sed -i "s/ CREATE OBJECT gi_html_viewer TYPE zcl_abapgit_html_viewer_gui/ CREATE OBJECT gi_html_viewer TYPE ('DECOUPLED')/ig" ./open/zcl_abapgit_ui_factory.clas.abap
sed -i "s/ zcl_abapgit_code_inspector=>validate_check_variant( lv_check_variant )./ ASSERT 1 = 'decoupled'./ig" ./open/zcl_abapgit_gui_page_sett_locl.clas.abap
sed -i "s/ zcl_abapgit_transport=>validate_transport_request( lv_transport_request )./ ASSERT 1 = 'decoupled'./ig" ./open/zcl_abapgit_gui_page_sett_locl.clas.abap

# types,

sed -i 's/ TYPE e071-object/ TYPE char4/ig' ./open/zcl_abapgit_gui_page_flow.clas.locals_imp.abap
sed -i 's/ TYPE e071-obj_name/ TYPE char30/ig' ./open/zcl_abapgit_gui_page_flow.clas.locals_imp.abap
sed -i 's/ TYPE e071k-object/ TYPE char4/ig' ./open/zif_abapgit_cts_api.intf.abap
sed -i 's/ TYPE e071-object/ TYPE char4/ig' ./open/zif_abapgit_cts_api.intf.abap
sed -i 's/ TYPE tcode/ TYPE string/ig' ./open/zcl_abapgit_services_abapgit.clas.abap
sed -i 's/ OF tcode/ OF string/ig' ./open/zcl_abapgit_services_abapgit.clas.abap
sed -i 's/ TYPE e071k-objname/ TYPE char30/ig' ./open/zif_abapgit_cts_api.intf.abap
sed -i 's/ TYPE e071-obj_name/ TYPE char30/ig' ./open/zif_abapgit_cts_api.intf.abap
sed -i 's/ TYPE e071k-tabkey/ TYPE char120/ig' ./open/zif_abapgit_cts_api.intf.abap
sed -i 's/ TYPE e070-trstatus/ TYPE char1/ig' ./open/zif_abapgit_cts_api.intf.abap
sed -i 's/ TYPE RZLLI_APCL/ TYPE char20/ig' ./open/zif_abapgit_exit.intf.abap
sed -i 's/ TYPE trobjtype/ TYPE tadir-object/ig' ./open/zcl_abapgit_abap_language_vers.clas.abap
sed -i 's/ TYPE trobjtype/ TYPE tadir-object/ig' ./open/zcl_abapgit_gui_page_ex_object.clas.abap
sed -i 's/ TYPE trobjtype/ TYPE tadir-object/ig' ./open/zcl_abapgit_po_file.clas.abap
sed -i 's/ TYPE trobjtype/ TYPE tadir-object/ig' ./open/zcl_abapgit_zip.clas.abap
sed -i 's/ TYPE sobj_name/ TYPE tadir-obj_name/ig' ./open/zcl_abapgit_zip.clas.abap
sed -i 's/ TYPE sobj_name/ TYPE tadir-obj_name/ig' ./open/zif_abapgit_aff_type_mapping.intf.abap
sed -i 's/ TABLE OF sobj_name/ TABLE OF tadir-obj_name/ig' ./open/zcl_abapgit_gui_page_ex_object.clas.abap
sed -i 's/ TYPE SSFAPPLSSL/ TYPE char6/ig' ./open/zif_abapgit_exit.intf.abap
sed -i 's/ TYPE saprelease/ TYPE c LENGTH 10/ig' ./open/zif_abapgit_dot_abapgit.intf.abap
sed -i 's/ TYPE sappatchlv/ TYPE c LENGTH 10/ig' ./open/zif_abapgit_persist_repo.intf.abap
sed -i 's/ TYPE sappatchlv/ TYPE c LENGTH 10/ig' ./open/zif_abapgit_dot_abapgit.intf.abap
sed -i 's/ TYPE r3state/ TYPE char1/ig' ./open/zif_abapgit_sap_report.intf.abap
sed -i 's/ TYPE enqmode/ TYPE c/ig' ./open/zif_abapgit_persist_repo.intf.abap         ## if_abap_lock_object=>tv_mode ??
sed -i 's/ TYPE enqmode/ TYPE c/ig' ./open/zcl_abapgit_persistence_db.clas.abap         ## if_abap_lock_object=>tv_mode ??
sed -i 's/ TYPE progname/ TYPE char30/ig' ./open/zcl_abapgit_objects_files.clas.testclasses.abap
sed -i 's/ TYPE progname/ TYPE char30/ig' ./open/zcl_abapgit_services_repo.clas.abap
sed -i 's/ TYPE LXEOBJNAME/ TYPE char70/ig' ./open/zcl_abapgit_po_file.clas.abap
sed -i 's/ OF bdcdata/ OF string/ig' ./open/zif_abapgit_gui_jumper.intf.abap
#sed -i "s/zcl_abapgit_objects_super=>c_user_unknown/'UNKNOWN'/ig" ./open/*.abap
sed -i 's/ TYPE devlayer/ TYPE char4/ig' ./open/zif_abapgit_sap_package.intf.abap
sed -i 's/ TYPE uccheck/ TYPE char1/ig' ./open/zif_abapgit_sap_report.intf.abap
sed -i 's/ TYPE namespace/ TYPE char10/ig' ./open/zcl_abapgit_folder_logic.clas.abap
sed -i 's/ TYPE namespace/ TYPE char10/ig' ./open/zcl_abapgit_repo_status.clas.locals_imp.abap
sed -i 's/ TYPE parentcl/ TYPE devclass/ig' ./open/zcl_abapgit_folder_logic.clas.abap
sed -i 's/ TYPE tcode/ TYPE string/ig' ./open/zcl_abapgit_gui_page_repo_view.clas.abap
# sed -i 's/ TYPE scit_alvlist/ TYPE string_table/ig' ./open/*.abap
sed -i 's/ TYPE sci_chkv/ TYPE char30/ig' ./open/zif_abapgit_persistence.intf.abap   # if_satc_api_factory=>ty_check_variant_name
sed -i 's/ TYPE sci_chkv/ TYPE char30/ig' ./open/zif_abapgit_code_inspector.intf.abap   # if_satc_api_factory=>ty_check_variant_name
sed -i 's/ TYPE sci_chkv/ TYPE char30/ig' ./open/zcl_abapgit_gui_page_code_insp.clas.abap   # if_satc_api_factory=>ty_check_variant_name
sed -i 's/ TYPE sci_chkv/ TYPE char30/ig' ./open/zcl_abapgit_gui_page_sett_locl.clas.abap   # if_satc_api_factory=>ty_check_variant_name
sed -i 's/ TYPE trobj_name/ TYPE char120/ig' ./open/zif_abapgit_cts_api.intf.abap
sed -i 's/ OF namespace/ OF char10/ig' ./open/zcl_abapgit_repo_status.clas.locals_imp.abap
sed -i 's/ TYPE trnspace-namespace/ TYPE char10/ig' ./open/zif_abapgit_definitions.intf.abap
sed -i 's/ TYPE trnspace-namespace/ TYPE char10/ig' ./open/zif_abapgit_sap_namespace.intf.abap
sed -i 's/ TYPE trnspace-editflag/ TYPE abap_bool/ig' ./open/zcl_abapgit_sap_namespace.clas.abap
sed -i 's/ TYPE ABAPTXT255_TAB/ TYPE string_table/ig' ./open/zcl_abapgit_objects_files.clas*
sed -i 's/ TYPE ABAPTXT255_TAB/ TYPE string_table/ig' ./open/zif_abapgit_sap_report.intf.abap
sed -i "s/ zcl_abapgit_gui_page_repo_view=>c_actions-change_dir / 'decoupled' /ig" ./open/zcl_abapgit_gui_chunk_lib.clas.abap
sed -i "s/ SET LOCALE LANGUAGE lv_main_language./ ASSERT 1 = 'decoupled'./ig" ./open/zcl_abapgit_gui_page_repo_view.clas.abap
sed -i "s/ SET LOCALE LANGUAGE lv_save_sy_langu./ ASSERT 1 = 'decoupled'./ig" ./open/zcl_abapgit_gui_page_repo_view.clas.abap
sed -i "s/ READ LINE lv_line LINE VALUE INTO lv_text./ ASSERT 1 = 'decoupled'./ig" ./open/zcl_abapgit_gui_page_run_bckg.clas.abap
sed -i "s/ rs_handled-page  = zcl_abapgit_gui_page_debuginfo=>create( )./ ASSERT 1 = 'decoupled'./ig" ./open/zcl_abapgit_gui_router.clas.abap
sed -i "s/ rs_handled-page  = zcl_abapgit_gui_page_sett_repo=>create( lo_repo )./ ASSERT 1 = 'decoupled'./ig" ./open/zcl_abapgit_gui_router.clas.abap
sed -i "s/ zcl_abapgit_transport_mass=>run( )./ ASSERT 1 = 'decoupled'./ig" ./open/zcl_abapgit_gui_router.clas.abap
sed -i "s/rs_handled-page  = zcl_abapgit_gui_page_runit=>create( mo_repo )./ ASSERT 1 = 'decoupled'./ig" ./open/zcl_abapgit_gui_page_repo_view.clas.abap
sed -i "s/lv_adt_link = zcl_abapgit_adt_link=>link_transport( iv_transport )./ ASSERT 1 = 'decoupled'./ig" ./open/zcl_abapgit_gui_router.clas.abap

# CLAS shims,
sed -i -e '/PUBLIC SECTION/r ./shims/zcx_abapgit_exception.prog.abap' ./open/zcx_abapgit_exception.clas.abap
sed -i -e '/PUBLIC SECTION/r ./shims/zcl_abapgit_gui.prog.abap' ./open/zcl_abapgit_gui.clas.abap

# INTF shims,
sed -i -e '/PUBLIC /r ./shims/zif_abapgit_definitions.prog.abap' ./open/zif_abapgit_definitions.intf.abap
sed -i -e '/PUBLIC /r ./shims/zif_abapgit_html_viewer.prog.abap' ./open/zif_abapgit_html_viewer.intf.abap
sed -i -e '/PUBLIC /r ./shims/zif_abapgit_popups.prog.abap' ./open/zif_abapgit_popups.intf.abap
sed -i -e '/PUBLIC/r ./shims/zif_abapgit_longtexts.prog.abap' ./open/zif_abapgit_longtexts.intf.abap
sed -i -e '/PUBLIC/r ./shims/zif_abapgit_sap_report.prog.abap' ./open/zif_abapgit_sap_report.intf.abap

echo "sed done, $SECONDS seconds"
SECONDS=0

###########################################################################

cp replace/zcl_abapgit_apack* open
cp replace/zcl_abapgit_cts_api* open
cp replace/zcl_abapgit_default_transport* open
cp replace/zcl_abapgit_background* open
cp replace/zcl_abapgit_diff* open
cp replace/zcl_abapgit_exception_viewer* open
cp replace/zcl_abapgit_http* open
cp replace/zcl_abapgit_tadir.clas* open
cp replace/zcl_abapgit_transport* open
cp replace/zcl_abapgit_progress* open
cp replace/zcl_abapgit_log_viewer* open
cp replace/zcl_abapgit_environment* open
cp replace/zcl_abapgit_objects_activation* open
cp replace/zcl_abapgit_object_filter_tran* open
cp replace/zcl_abapgit_objects.clas* open
cp replace/zcl_abapgit_objects_activation* open
cp replace/zcl_abapgit_repo_filter* open
cp replace/zcl_abapgit_frontend_services* open
cp replace/zcl_abapgit_objects_super* open
cp replace/zcl_abapgit_gui_page_codi_base* open
cp replace/zcl_abapgit_requirement_helper* open
cp replace/zcl_abapgit_serialize* open
# cp replace/zcl_abapgit_services_abapgit* open  # https://github.com/abapGit/abapGit/pull/6695
cp replace/zcl_abapgit_user_record* open
cp replace/zcl_abapgit_sap_package* open
rm ./open/zcl_abapgit_http_agent.clas.locals_imp.abap

cp additional/*.* open
cp open/* cloud
cp additional/open/*.* open
cp additional/cloud/*.* cloud

cp abapGit/src/utils/zcl_abapgit_convert* open
cp abapGit/src/utils/zcl_abapgit_convert* cloud
cp abapGit/src/http/zcl_abapgit_http.clas* open
cp abapGit/src/http/zcl_abapgit_http_client.clas* open
cp abapGit/src/http/zcl_abapgit_proxy_config* open
cp abapGit/src/http/zcl_abapgit_proxy_auth* open
cp abapGit/src/ui/zcl_abapgit_password_dialog* open

# replace or rewrite most of the code,
rm cloud/*.w3mi.*
rm cloud/zcl_abapgit_data_deserializer.clas.testclasses.abap  # uses T100 db table
rm cloud/zcl_abapgit_data_utils.clas.testclasses.abap  # uses T100 db table
rm cloud/zcl_abapgit_gui_event.clas.testclasses.abap
rm cloud/zcl_abapgit_convert.clas.testclasses.abap
rm cloud/zcl_abapgit_repo_status.clas.testclasses.abap
rm open/zcl_abapgit_repo_status.clas.testclasses.abap
rm open/zcl_abapgit_abap_language_vers.clas.testclasses.abap

echo "replace done, $SECONDS seconds"
SECONDS=0

###########################################################################

sed -i "s/cl_gui_cfw=>compute_pixel_from_metric( x_or_y = 'X'//ig" ./cloud/zcl_abapgit_html.clas.abap
sed -i "s/in = 1 )/1/ig" ./cloud/zcl_abapgit_html.clas.abap

node refactor.mjs
echo "refactor done, $SECONDS seconds"