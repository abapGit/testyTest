import fs from "node:fs";

// NOTE: this file only runs for cloud code

const dir = "./cloud/";

const replace = [
  {search: " icon_package_standard",              replace: " '@11@'"},
  {search: " icon_no_status",                     replace: " '@11@'"},
  {search: " icon_change",                        replace: " '@11@'"},
  {search: " icon_create",                        replace: " '@11@'"},
  {search: " icon_delete",                        replace: " '@11@'"},
  {search: " icon_okay",                          replace: " '@11@'"},
  {search: " icon_set_state",                     replace: " '@11@'"},
  {search: " icon_adopt",                         replace: " '@11@'"},

  {search: " tadir-object",                       replace: " I_CustABAPObjDirectoryEntry-ABAPObjectType"},
  {search: " tadir-obj_name",                     replace: " I_CustABAPObjDirectoryEntry-ABAPObject"},
  {search: " tadir-masterlang",                   replace: " spras"},

  {search: " TYPE REF TO if_http_client", replace: " TYPE REF TO object"},
  {search: " tadir-pgmid", replace: " I_CustABAPObjDirectoryEntry-ABAPObjectCategory"},
  {search: " TYPE tadir-srcsystem", replace: " TYPE c LENGTH 10"},
  {search: " TYPE tadir-delflag", replace: " TYPE abap_bool"},
  {search: " TYPE tadir-genflag", replace: " TYPE abap_bool"},
  {search: " TYPE trfunction", replace: " TYPE char1"},
  {search: " TYPE scompkdtln-devclass", replace: " TYPE devclass"},
  {search: " TYPE seoclsname", replace: " TYPE char30"},
  {search: " TYPE wwwdatatab-objid", replace: " TYPE char40"},
  {search: " DEFAULT if_salv_c_selection_mode=>multiple", replace: " OPTIONAL"},
  {search: " TYPE tdevc-dlvunit", replace: " TYPE c LENGTH 30"},
  {search: "GET PARAMETER ID 'DBT' FIELD lv_mode.", replace: ""},
  {search: "GET PARAMETER ID 'TSE' FIELD lv_skip.", replace: ""},
  {search: " TYPE REF TO cl_gui_container DEFAULT cl_gui_container=>screen0", replace: " TYPE REF TO object OPTIONAL"},
  {search: " li_stream_factory->create_istream_string\\( iv_xml \\)", replace: " li_stream_factory->create_istream_xstring( zcl_abapgit_convert=>string_to_xstring_utf8( iv_xml ) )"},
  {search: " li_ostream = li_streamfactory->create_ostream_cstring\\( rv_xml \\).", replace: " DATA foo TYPE xstring. li_ostream = li_streamfactory->create_ostream_xstring( foo ). rv_xml = zcl_abapgit_convert=>xstring_to_string_utf8( foo )."},
  {search: " li_istream->close\\( \\).", replace: " "},
  {search: " SUBMIT \\(sy-cprog\\).", replace: " ASSERT 1 = 'non_cloud'."},
  {search: "IN UPDATE TASK", replace: ""},

  {search: " cl_http_utility=>",                  replace: " cl_web_http_utility=>"},
  {search: " cl_ixml=>",                          replace: " cl_ixml_core=>"},
  {search: " RANGE OF trkorr",                    replace: " RANGE OF sxco_transport"},
  {search: " TYPE STANDARD TABLE OF trkorr",      replace: " TYPE STANDARD TABLE OF sxco_transport"},
  {search: " TABLE OF devclass",                  replace: " TABLE OF I_CustABAPObjDirectoryEntry-ABAPPackage"},
  {search: " TYPE devclass",                      replace: " TYPE I_CustABAPObjDirectoryEntry-ABAPPackage"},
  {search: " TYPE funcname",                      replace: " TYPE sxco_fm_name"},
  {search: " TYPE dirtree-tname",                 replace: " TYPE c LENGTH 45"},
  {search: " TYPE RANGE OF devclass",             replace: " TYPE RANGE OF I_CustABAPObjDirectoryEntry-ABAPPackage"},
  {search: " TYPE REF TO if_ixml_istream",        replace: " TYPE REF TO if_ixml_istream_core"},
  {search: " TYPE REF TO if_ixml_ostream",        replace: " TYPE REF TO if_ixml_ostream_core"},
  {search: " TYPE REF TO if_ixml_parse_error",    replace: " TYPE REF TO if_ixml_parse_error_core"},
  {search: " TYPE REF TO if_ixml_parser",         replace: " TYPE REF TO if_ixml_parser_core"},
  {search: " TYPE REF TO if_ixml_renderer",       replace: " TYPE REF TO if_ixml_renderer_core"},
  {search: " TYPE REF TO if_ixml_stream_factory", replace: " TYPE REF TO if_ixml_stream_factory_core"},
  {search: " TYPE REF TO if_ixml,",               replace: " TYPE REF TO if_ixml_core,"},
  {search: " TYPE tadir-devclass",                replace: " TYPE I_CustABAPObjDirectoryEntry-ABAPPackage"},
  {search: " TYPE tadir-korrnum",                 replace: " TYPE sxco_transport"},
  {search: " TYPE tdevc-parentcl",                replace: " TYPE I_CustABAPObjDirectoryEntry-ABAPPackage"},
  {search: " TYPE trkorr",                        replace: " TYPE sxco_transport"},
  {search: " msgid type symsgid value '00',",     replace: " msgid type symsgid value 'ZABAPGIT',"},
  {search: "MESSAGE '[\\w\\s\\.]+' TYPE '\\w'.",              replace: "ASSERT 1 = 'messageStatementRemoved'."},
  {search: "MESSAGE \\w+ TYPE '\\w' DISPLAY LIKE '\\w'.", replace: "ASSERT 1 = 'messageStatementRemoved'."},
  {search: "MESSAGE \\w+ TYPE '\\w'.",                        replace: "ASSERT 1 = 'messageStatementRemoved'."},
  {search: "MESSAGE s000\\(oo\\) WITH mv_text rv_result.",    replace: "ASSERT 1 = 'messageStatementRemoved'."},
  {search: "MESSAGE e058\\(00\\) WITH 'Value_1' 'Value_2' 'Value_3' 'Value_4' INTO zcx_abapgit_exception=>null.",
   replace: "MESSAGE e001(zabapgit) WITH 'Value_1' 'Value_2' 'Value_3' 'Value_4' INTO zcx_abapgit_exception=>null."},
  {search: "MESSAGE e001\\(00\\) WITH ls_msg-msgv1 ls_msg-msgv2 ls_msg-msgv3 ls_msg-msgv4 INTO null.",
   replace: "MESSAGE e001(zabapgit) WITH ls_msg-msgv1 ls_msg-msgv2 ls_msg-msgv3 ls_msg-msgv4 INTO null."},
]

const removeFunctionModuleCalls = [
  "ABAP4_CALL_TRANSACTION",
  "BAPI_USER_DISPLAY",
  "CONVERT_ITF_TO_STREAM_TEXT",
  "DOCU_GET",
  "ENQUEUE_EZABAPGIT",
  "FUNCTION_EXISTS",
  "TR_TADIR_INTERFACE",
  "WB_TREE_ACTUALIZE",
  "RS_TABLE_LIST_CREATE",
  "SYSTEM_CALLSTACK",
  "RS_DD_DELETE_OBJ",
  "ENQUEUE_READ",
  "TEXT_SPLIT",
  "TR_DISPLAY_REQUEST",
  "CDNAMES_GET",
  "TR_TASK_GET",
  "TR_TASK_RESET",
  "TR_TASK_SET",
  "WWWDATA_IMPORT",
  "WWWPARAMS_READ",
];

for (const filename of fs.readdirSync(dir)) {
  if (filename.endsWith(".xml") === true) {
    continue;
  }
  let abap = fs.readFileSync(dir + filename, "utf-8");
  let changed = false;

  for (const re of replace) {
    const regex = new RegExp(re.search, "ig");
    if (abap.match(regex)) {
      abap = abap.replace(regex, re.replace);
      changed = true;
    }
  }

  for (const fm of removeFunctionModuleCalls) {
    const regex = new RegExp(`CALL FUNCTION '${fm}'[\\s\\S]+?\\.`, "ig");
    if (abap.match(regex)) {
      abap = abap.replace(regex, "ASSERT 1 = 'replacedByRefactorMJS'.");
      changed = true;
    }
  }

  if (changed === true) {
    fs.writeFileSync(dir + filename, abap);
  }
}