INTERFACE zif_abapgit_cts_api
  PUBLIC .

  TYPES: BEGIN OF ty_transport,
           obj_type TYPE I_CustABAPObjDirectoryEntry-ABAPObjectType,
           obj_name TYPE I_CustABAPObjDirectoryEntry-ABAPObject,
           trkorr   TYPE SXCO_TRANSPORT,
         END OF ty_transport.

  TYPES ty_transport_list TYPE SORTED TABLE OF ty_transport WITH NON-UNIQUE KEY obj_type obj_name.

  "! Returns the transport request / task the object is currently in
  "! @parameter is_item | Object
  "! @parameter rv_transport | Transport request / task
  "! @raising zcx_abapgit_exception | Object is not in a transport
  METHODS get_transport_for_object
    IMPORTING
      !is_item            TYPE zif_abapgit_definitions=>ty_item
    RETURNING
      VALUE(rv_transport) TYPE SXCO_TRANSPORT
    RAISING
      zcx_abapgit_exception .
  "! Check if change recording is possible for the given package
  "! @parameter iv_package | Package
  "! @parameter rv_possible | Change recording is possible
  "! @raising zcx_abapgit_exception | Package could not be loaded
  METHODS is_chrec_possible_for_package
    IMPORTING
      !iv_package        TYPE I_CustABAPObjDirectoryEntry-ABAPPackage
    RETURNING
      VALUE(rv_possible) TYPE abap_bool
    RAISING
      zcx_abapgit_exception .
  METHODS get_transports_for_list
    IMPORTING
      !it_items            TYPE zif_abapgit_definitions=>ty_items_tt
    RETURNING
      VALUE(rt_transports) TYPE ty_transport_list
    RAISING
      zcx_abapgit_exception .
  METHODS get_r3tr_obj_for_limu_obj
    IMPORTING
      iv_object   TYPE I_CustABAPObjDirectoryEntry-ABAPObjectType
      iv_obj_name TYPE char120
    EXPORTING
      ev_object   TYPE I_CustABAPObjDirectoryEntry-ABAPObjectType
      ev_obj_name TYPE char120
    RAISING
      zcx_abapgit_exception .

  METHODS read_description
    IMPORTING
      iv_trkorr             TYPE SXCO_TRANSPORT
    RETURNING
      VALUE(rv_description) TYPE string.

  METHODS read_user
    IMPORTING
      iv_trkorr       TYPE SXCO_TRANSPORT
    RETURNING
      VALUE(rv_uname) TYPE uname.

  METHODS create_transport_entries
    IMPORTING
      it_table_ins TYPE ANY TABLE
      it_table_upd TYPE ANY TABLE
      it_table_del TYPE ANY TABLE
      iv_tabname   TYPE tabname.

ENDINTERFACE.
