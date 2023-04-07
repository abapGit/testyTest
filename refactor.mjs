import fs from "node:fs";

const dir = "./cloud/";

const replace = [
  {search: " cl_http_utility=>encode_base64",     replace: " cl_web_http_utility=>encode_base64"},
  {search: " cl_http_utility=>unescape_url",      replace: " cl_web_http_utility=>unescape_url"},
  {search: " cl_ixml=>",                          replace: " cl_ixml_core=>"},
  {search: " RANGE OF trkorr",                    replace: " RANGE OF sxco_transport"},
  {search: " TABLE OF devclass",                  replace: " TABLE OF I_CustABAPObjDirectoryEntry-ABAPPackage"},
  {search: " TYPE devclass",                      replace: " TYPE I_CustABAPObjDirectoryEntry-ABAPPackage"},
  {search: " TYPE funcname",                      replace: " TYPE sxco_fm_name"},
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
]

const removeFunctionModuleCalls = [
  "BAPI_USER_DISPLAY",
  "CONVERT_ITF_TO_STREAM_TEXT",
  "DOCU_GET",
  "ENQUEUE_EZABAPGIT",
  "FUNCTION_EXISTS",
  "RS_TABLE_LIST_CREATE",
  "SYSTEM_CALLSTACK",
  "TEXT_SPLIT",
  "TR_DISPLAY_REQUEST",
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
      abap = abap.replace(regex, "ASSERT 1 = 'replacedByAutomation'.");
      changed = true;
    }
  }

  if (changed === true) {
    fs.writeFileSync(dir + filename, abap);
  }
}