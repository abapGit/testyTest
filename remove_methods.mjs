import fs from "node:fs";

// NOTE: this file only runs for open code

const dir = "./open/";
const removeMethodImplementations = [
  {"filename": "zcl_abapgit_gui_router.clas.abap", "method": "jump_display_transport"},
  {"filename": "zcl_abapgit_gui_page_chg_pckg.clas.abap", "method": "update_sotr_package_assignment"},
];

for (const filename of fs.readdirSync(dir)) {
  if (filename.endsWith(".xml") === true) {
    continue;
  }
  let abap = fs.readFileSync(dir + filename, "utf-8");
  let changed = false;

  for (const method of removeMethodImplementations) {
    if (filename !== method.filename) {
      continue;
    }
    const regex = new RegExp(`METHOD ${method.method}\\.[\\s\\S]*?ENDMETHOD`, "ig");
    if (abap.match(regex)) {
      abap = abap.replace(regex, `METHOD ${method.method}.
    ASSERT 1 = 'replacedByRefactorMJS'.
  ENDMETHOD`);
      changed = true;
    }
  }

  if (changed === true) {
    fs.writeFileSync(dir + filename, abap);
  }
}