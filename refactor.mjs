import fs from "node:fs";

// NOTE: this file only runs for cloud code

const dir = "./cloud/";

const replace = [
  {search: "li_istream->close\\( \\)\\.",              replace: ""},  // https://github.com/abapGit/abapGit/pull/6532
  {search: " icon_package_standard",              replace: "'@11@'"},
  {search: " icon_no_status",                     replace: "'@11@'"},
  {search: " icon_change",                        replace: "'@11@'"},
  {search: " icon_create",                        replace: "'@11@'"},
  {search: " icon_delete",                        replace: "'@11@'"},
  {search: " icon_adopt",                         replace: "'@11@'"},
  {search: " cl_http_utility=>",                  replace: " cl_web_http_utility=>"},
  {search: " cl_ixml=>",                          replace: " cl_ixml_core=>"},
  {search: " RANGE OF trkorr",                    replace: " RANGE OF sxco_transport"},
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
  {search: " msgid type symsgid value '00',",                                 replace: " msgid type symsgid value 'ZABAPGIT',"},
  {search: "MESSAGE 'abapGit Backup successfully restored' TYPE 'S'.",        replace: "ASSERT 1 = 'messageStatementRemoved'."},
  {search: "MESSAGE 'abapGit Backup successfully saved' TYPE 'S'.",           replace: "ASSERT 1 = 'messageStatementRemoved'."},
  {search: "MESSAGE 'abapGit was updated and will restart itself' TYPE 'I'.", replace: "ASSERT 1 = 'messageStatementRemoved'."},
  {search: "MESSAGE 'Commit was successful' TYPE 'S'.",                       replace: "ASSERT 1 = 'messageStatementRemoved'."},
  {search: "MESSAGE 'No inactive objects found' TYPE 'S'.",                   replace: "ASSERT 1 = 'messageStatementRemoved'."},
  {search: "MESSAGE 'No pull requests found' TYPE 'S'.",                      replace: "ASSERT 1 = 'messageStatementRemoved'."},
  {search: "MESSAGE 'Object successfully exported' TYPE 'S'.",                replace: "ASSERT 1 = 'messageStatementRemoved'."},
  {search: "MESSAGE 'Package successfully exported' TYPE 'S'.",               replace: "ASSERT 1 = 'messageStatementRemoved'."},
  {search: "MESSAGE 'Repository opened in a new window' TYPE 'S'.",           replace: "ASSERT 1 = 'messageStatementRemoved'."},
  {search: "MESSAGE 'Settings succesfully saved' TYPE 'S'.",                  replace: "ASSERT 1 = 'messageStatementRemoved'."},
  {search: "MESSAGE 'Successfully exported to Clipboard.' TYPE 'S'.",         replace: "ASSERT 1 = 'messageStatementRemoved'."},
  {search: "MESSAGE 'Successfully exported URL to Clipboard.' TYPE 'S'.",     replace: "ASSERT 1 = 'messageStatementRemoved'."},
  {search: "MESSAGE ix_exception TYPE 'S' DISPLAY LIKE 'E'.",                 replace: "ASSERT 1 = 'messageStatementRemoved'."},
  {search: "MESSAGE lv_hint TYPE 'S' DISPLAY LIKE 'E'.",                      replace: "ASSERT 1 = 'messageStatementRemoved'."},
  {search: "MESSAGE lv_message TYPE 'S'.",                                    replace: "ASSERT 1 = 'messageStatementRemoved'."},
  {search: "MESSAGE lv_msg TYPE 'S'.",                                        replace: "ASSERT 1 = 'messageStatementRemoved'."},
  {search: "MESSAGE lv_text TYPE 'S'.",                                       replace: "ASSERT 1 = 'messageStatementRemoved'."},
  {search: "MESSAGE lx_exception TYPE 'S' DISPLAY LIKE 'E'.",                 replace: "ASSERT 1 = 'messageStatementRemoved'."},
  {search: "MESSAGE s000\\(oo\\) WITH mv_text rv_result.",                    replace: "ASSERT 1 = 'messageStatementRemoved'."},
  {search: "MESSAGE 'Please save conversion to online repository before choosing a tag' TYPE 'S'.",               replace: "ASSERT 1 = 'messageStatementRemoved'."},
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