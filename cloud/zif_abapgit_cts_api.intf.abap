INTERFACE zif_abapgit_cts_api
  PUBLIC .

  CONSTANTS:
    BEGIN OF c_transport_type,
      wb_request   TYPE c LENGTH 1 VALUE 'K', "workbench request
      wb_repair    TYPE c LENGTH 1 VALUE 'R', "workbench repair
      wb_task      TYPE c LENGTH 1 VALUE 'S', "workbench task
      cust_request TYPE c LENGTH 1 VALUE 'W', "customizing request
      cust_task    TYPE c LENGTH 1 VALUE 'Q', "customizing task
    END OF c_transport_type.

  CONSTANTS:
    BEGIN OF c_transport_category,
      workbench   TYPE c LENGTH 4 VALUE 'SYST',
      customizing TYPE c LENGTH 4 VALUE 'CUST',
    END OF c_transport_category.

  CONSTANTS:
    BEGIN OF c_transport_mode,
      insert TYPE c LENGTH 1 VALUE 'I',
      delete TYPE c LENGTH 1 VALUE 'D',
    END OF c_transport_mode.

  TYPES: BEGIN OF ty_transport,
           obj_type TYPE I_CustABAPObjDirectoryEntry-ABAPObjectType,
           obj_name TYPE I_CustABAPObjDirectoryEntry-ABAPObject,
           trkorr   TYPE sxco_transport,
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
      VALUE(rv_transport) TYPE sxco_transport
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
      iv_trkorr             TYPE sxco_transport
    RETURNING
      VALUE(rv_description) TYPE string.

  METHODS read_user
    IMPORTING
      iv_trkorr       TYPE sxco_transport
    RETURNING
      VALUE(rv_uname) TYPE uname.

  METHODS create_transport_entries
    IMPORTING
      iv_transport TYPE sxco_transport
      it_table_ins TYPE ANY TABLE
      it_table_upd TYPE ANY TABLE
      it_table_del TYPE ANY TABLE
      iv_tabname   TYPE tabname
    RAISING
      zcx_abapgit_exception.

  METHODS insert_transport_object
    IMPORTING
      iv_pgmid    TYPE I_CustABAPObjDirectoryEntry-ABAPObjectCategory DEFAULT 'R3TR'
      iv_object   TYPE I_CustABAPObjDirectoryEntry-ABAPObjectType
      iv_obj_name TYPE csequence
      iv_package  TYPE I_CustABAPObjDirectoryEntry-ABAPPackage
      iv_language TYPE sy-langu DEFAULT sy-langu
      iv_mode     TYPE c DEFAULT 'I'
    EXPORTING
      ev_object   TYPE I_CustABAPObjDirectoryEntry-ABAPObjectType
      ev_obj_name TYPE char120
    RAISING
      zcx_abapgit_exception.

  METHODS confirm_transport_messages
    RETURNING
      VALUE(rv_messages_confirmed) TYPE abap_bool .

  TYPES: BEGIN OF ty_transport_key,
           object  TYPE char4,
           objname TYPE char30,
           tabkey  TYPE char120,
         END OF ty_transport_key.

  TYPES: BEGIN OF ty_transport_data,
           trstatus TYPE char1,
           keys     TYPE STANDARD TABLE OF ty_transport_key WITH DEFAULT KEY,
         END OF ty_transport_data.

  METHODS read
    IMPORTING
      !iv_trkorr        TYPE sxco_transport
    RETURNING
      VALUE(rs_request) TYPE ty_transport_data
    RAISING
      zcx_abapgit_exception .

  METHODS validate_transport_request
    IMPORTING
      iv_transport_request TYPE sxco_transport
    RAISING
      zcx_abapgit_exception.

ENDINTERFACE.
