INTERFACE zif_abapgit_services_repo
  PUBLIC .

  TYPES:
    BEGIN OF ty_repo_params,
      name               TYPE string,
      url                TYPE string,
      package            TYPE I_CustABAPObjDirectoryEntry-ABAPPackage,
      branch_name        TYPE string,
      display_name       TYPE string,
      folder_logic       TYPE string,
      labels             TYPE string,
      ignore_subpackages TYPE abap_bool,
      main_lang_only     TYPE abap_bool,
      abap_lang_vers     TYPE string,
    END OF ty_repo_params .

ENDINTERFACE.
