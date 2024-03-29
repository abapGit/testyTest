INTERFACE zif_abapgit_tadir
  PUBLIC .


  METHODS get_object_package
    IMPORTING
      !iv_pgmid          TYPE I_CustABAPObjDirectoryEntry-ABAPObjectCategory DEFAULT 'R3TR'
      !iv_object         TYPE I_CustABAPObjDirectoryEntry-ABAPObjectType
      !iv_obj_name       TYPE I_CustABAPObjDirectoryEntry-ABAPObject
    RETURNING
      VALUE(rv_devclass) TYPE I_CustABAPObjDirectoryEntry-ABAPPackage
    RAISING
      zcx_abapgit_exception .
  METHODS read
    IMPORTING
      !iv_package            TYPE I_CustABAPObjDirectoryEntry-ABAPPackage
      !iv_ignore_subpackages TYPE abap_bool DEFAULT abap_false
      !iv_only_local_objects TYPE abap_bool DEFAULT abap_false
      !io_dot                TYPE REF TO zcl_abapgit_dot_abapgit OPTIONAL
      !ii_log                TYPE REF TO zif_abapgit_log OPTIONAL
      !it_filter             TYPE zif_abapgit_definitions=>ty_tadir_tt OPTIONAL
      !iv_check_exists       TYPE abap_bool DEFAULT abap_true
    RETURNING
      VALUE(rt_tadir)        TYPE zif_abapgit_definitions=>ty_tadir_tt
    RAISING
      zcx_abapgit_exception .
  METHODS read_single
    IMPORTING
      !iv_pgmid       TYPE I_CustABAPObjDirectoryEntry-ABAPObjectCategory DEFAULT 'R3TR'
      !iv_object      TYPE I_CustABAPObjDirectoryEntry-ABAPObjectType
      !iv_obj_name    TYPE I_CustABAPObjDirectoryEntry-ABAPObject
    RETURNING
      VALUE(rs_tadir) TYPE zif_abapgit_definitions=>ty_tadir.
ENDINTERFACE.
