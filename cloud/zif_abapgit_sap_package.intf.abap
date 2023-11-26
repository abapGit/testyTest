INTERFACE zif_abapgit_sap_package
  PUBLIC .
TYPES: BEGIN OF scompkdtln,
         devclass TYPE c LENGTH 30,
         ctext    TYPE c LENGTH 60,
         as4user  TYPE c LENGTH 8,
       END OF scompkdtln.

  TYPES:
    ty_devclass_tt TYPE STANDARD TABLE OF I_CustABAPObjDirectoryEntry-ABAPPackage WITH DEFAULT KEY .

  TYPES: BEGIN OF ty_create,
           devclass  TYPE I_CustABAPObjDirectoryEntry-ABAPPackage,
           dlvunit   TYPE c LENGTH 30,
           component TYPE c LENGTH 20,
           ctext     TYPE c LENGTH 60,
           parentcl  TYPE I_CustABAPObjDirectoryEntry-ABAPPackage,
           pdevclass TYPE c LENGTH 4,
           as4user   TYPE usnam,
         END OF ty_create.

  METHODS validate_name
    RAISING
      zcx_abapgit_exception .
  METHODS create
    IMPORTING
      !is_package TYPE ty_create
    RAISING
      zcx_abapgit_exception .
  METHODS create_local
    RAISING
      zcx_abapgit_exception .
  METHODS list_subpackages
    RETURNING
      VALUE(rt_list) TYPE ty_devclass_tt .
  METHODS list_superpackages
    RETURNING
      VALUE(rt_list) TYPE ty_devclass_tt
    RAISING
      zcx_abapgit_exception .
  METHODS read_parent
    RETURNING
      VALUE(rv_parentcl) TYPE I_CustABAPObjDirectoryEntry-ABAPPackage
    RAISING
      zcx_abapgit_exception .
  METHODS read_description
    RETURNING
      VALUE(rv_description) TYPE string
    RAISING
      zcx_abapgit_exception .
  METHODS read_responsible
    RETURNING
      VALUE(rv_responsible) TYPE usnam
    RAISING
      zcx_abapgit_exception .
  METHODS create_child
    IMPORTING
      !iv_child TYPE I_CustABAPObjDirectoryEntry-ABAPPackage
    RAISING
      zcx_abapgit_exception .
  METHODS exists
    RETURNING
      VALUE(rv_bool) TYPE abap_bool .
  METHODS are_changes_recorded_in_tr_req
    RETURNING
      VALUE(rv_are_changes_rec_in_tr_req) TYPE abap_bool
    RAISING
      zcx_abapgit_exception .
  METHODS get_transport_type
    RETURNING
      VALUE(rs_transport_type) TYPE zif_abapgit_definitions=>ty_transport_type
    RAISING
      zcx_abapgit_exception .
ENDINTERFACE.
