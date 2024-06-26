INTERFACE zif_abapgit_apack_definitions PUBLIC .


  TYPES:
    BEGIN OF ty_dependency,
      group_id       TYPE string,
      artifact_id    TYPE string,
      version        TYPE string,
      sem_version    TYPE zif_abapgit_definitions=>ty_version,
      git_url        TYPE string,
      target_package TYPE I_CustABAPObjDirectoryEntry-ABAPPackage,
    END OF ty_dependency,
    ty_dependencies    TYPE STANDARD TABLE OF ty_dependency
                    WITH NON-UNIQUE DEFAULT KEY,

    ty_repository_type TYPE string,

    BEGIN OF ty_descriptor_wo_dependencies,
      group_id        TYPE string,
      artifact_id     TYPE string,
      version         TYPE string,
      sem_version     TYPE zif_abapgit_definitions=>ty_version,
      repository_type TYPE ty_repository_type,
      git_url         TYPE string,
    END OF ty_descriptor_wo_dependencies,

    BEGIN OF ty_descriptor.
      INCLUDE TYPE ty_descriptor_wo_dependencies.
  TYPES:
      dependencies TYPE ty_dependencies,
    END OF ty_descriptor,

    ty_descriptors TYPE STANDARD TABLE OF ty_descriptor WITH NON-UNIQUE DEFAULT KEY.

  TYPES:
    BEGIN OF ty_manifest_declaration,
      clsname  TYPE char30,
      devclass TYPE I_CustABAPObjDirectoryEntry-ABAPPackage,
    END OF ty_manifest_declaration,
    ty_manifest_declarations TYPE STANDARD TABLE OF ty_manifest_declaration WITH DEFAULT KEY.

  CONSTANTS c_dot_apack_manifest TYPE string VALUE '.apack-manifest.xml' ##NO_TEXT.
  CONSTANTS c_repository_type_abapgit TYPE ty_repository_type VALUE 'abapGit' ##NO_TEXT.
  CONSTANTS c_apack_interface_sap TYPE char30 VALUE 'IF_APACK_MANIFEST' ##NO_TEXT.
  CONSTANTS c_apack_interface_cust TYPE char30 VALUE 'ZIF_APACK_MANIFEST' ##NO_TEXT.
  CONSTANTS c_apack_interface_nspc TYPE char30 VALUE '/*/IF_APACK_MANIFEST' ##NO_TEXT.
ENDINTERFACE.
