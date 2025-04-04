INTERFACE zif_abapgit_cts_api
  PUBLIC .


  TYPES:
    BEGIN OF ty_transport,
      obj_type TYPE I_CustABAPObjDirectoryEntry-ABAPObjectType,
      obj_name TYPE I_CustABAPObjDirectoryEntry-ABAPObject,
      trkorr   TYPE sxco_transport,
    END OF ty_transport .
  TYPES:
    ty_transport_list TYPE SORTED TABLE OF ty_transport WITH NON-UNIQUE KEY obj_type obj_name .
  TYPES:
    ty_trkorr_tt TYPE STANDARD TABLE OF sxco_transport WITH DEFAULT KEY .
  TYPES:
    BEGIN OF ty_transport_key,
      object  TYPE char4,
      objname TYPE char30,
      tabkey  TYPE char120,
    END OF ty_transport_key .
  TYPES:
    BEGIN OF ty_transport_data,
      trstatus TYPE char1,
      keys     TYPE STANDARD TABLE OF ty_transport_key WITH DEFAULT KEY,
    END OF ty_transport_data .
  TYPES:
    BEGIN OF ty_transport_obj,
      object   TYPE char4,
      obj_name TYPE char30,
    END OF ty_transport_obj .
  TYPES:
    ty_transport_obj_tt TYPE STANDARD TABLE OF ty_transport_obj WITH DEFAULT KEY .

  CONSTANTS:
    BEGIN OF c_transport_type,
      wb_request   TYPE c LENGTH 1 VALUE 'K', "workbench request
      wb_repair    TYPE c LENGTH 1 VALUE 'R', "workbench repair
      wb_task      TYPE c LENGTH 1 VALUE 'S', "workbench task
      cust_request TYPE c LENGTH 1 VALUE 'W', "customizing request
      cust_task    TYPE c LENGTH 1 VALUE 'Q', "customizing task
    END OF c_transport_type .
  CONSTANTS:
    BEGIN OF c_transport_category,
      workbench   TYPE c LENGTH 4 VALUE 'SYST',
      customizing TYPE c LENGTH 4 VALUE 'CUST',
    END OF c_transport_category .
  CONSTANTS:
    BEGIN OF c_transport_mode,
      insert TYPE c LENGTH 1 VALUE 'I',
      delete TYPE c LENGTH 1 VALUE 'D',
    END OF c_transport_mode .
  CONSTANTS:
    BEGIN OF c_transport_status,
      modifiable TYPE c LENGTH 1 VALUE 'D',
    END OF c_transport_status .

  METHODS confirm_transport_messages
    RETURNING
      VALUE(rv_messages_confirmed) TYPE abap_bool .
  METHODS create_transport_entries
    IMPORTING
      !iv_transport TYPE sxco_transport
      !it_table_ins TYPE ANY TABLE OPTIONAL
      !it_table_upd TYPE ANY TABLE OPTIONAL
      !it_table_del TYPE ANY TABLE OPTIONAL
      !iv_tabname   TYPE tabname
    RAISING
      zcx_abapgit_exception .
  METHODS get_r3tr_obj_for_limu_obj
    IMPORTING
      !iv_object   TYPE I_CustABAPObjDirectoryEntry-ABAPObjectType
      !iv_obj_name TYPE char120
    EXPORTING
      !ev_object   TYPE I_CustABAPObjDirectoryEntry-ABAPObjectType
      !ev_obj_name TYPE char120
    RAISING
      zcx_abapgit_exception .
  METHODS get_transports_for_list
    IMPORTING
      !it_items            TYPE zif_abapgit_definitions=>ty_items_tt
    RETURNING
      VALUE(rt_transports) TYPE ty_transport_list
    RAISING
      zcx_abapgit_exception .
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
  METHODS insert_transport_object
    IMPORTING
      !iv_pgmid    TYPE I_CustABAPObjDirectoryEntry-ABAPObjectCategory DEFAULT 'R3TR'
      !iv_object   TYPE I_CustABAPObjDirectoryEntry-ABAPObjectType
      !iv_obj_name TYPE csequence
      !iv_package  TYPE I_CustABAPObjDirectoryEntry-ABAPPackage
      !iv_language TYPE sy-langu DEFAULT sy-langu
      !iv_mode     TYPE c DEFAULT 'I'
    EXPORTING
      !ev_object   TYPE I_CustABAPObjDirectoryEntry-ABAPObjectType
      !ev_obj_name TYPE char120
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
  METHODS list_open_requests_by_user
    IMPORTING
      !iv_user         TYPE sy-uname DEFAULT sy-uname
    RETURNING
      VALUE(rt_trkorr) TYPE ty_trkorr_tt
    RAISING
      zcx_abapgit_exception .
  METHODS list_r3tr_by_request
    IMPORTING
      !iv_request    TYPE sxco_transport
    RETURNING
      VALUE(rt_list) TYPE ty_transport_obj_tt
    RAISING
      zcx_abapgit_exception .
  METHODS read
    IMPORTING
      !iv_trkorr        TYPE sxco_transport
    RETURNING
      VALUE(rs_request) TYPE ty_transport_data
    RAISING
      zcx_abapgit_exception .
  METHODS read_description
    IMPORTING
      !iv_trkorr            TYPE sxco_transport
    RETURNING
      VALUE(rv_description) TYPE string .
  METHODS read_user
    IMPORTING
      !iv_trkorr      TYPE sxco_transport
    RETURNING
      VALUE(rv_uname) TYPE uname .
  METHODS validate_transport_request
    IMPORTING
      !iv_transport_request TYPE sxco_transport
    RAISING
      zcx_abapgit_exception .

  METHODS change_transport_type
    IMPORTING
      !iv_transport_request   TYPE sxco_transport
      !iv_transport_type_from TYPE char1
      !iv_transport_type_to   TYPE char1
    RAISING
      zcx_abapgit_exception.
ENDINTERFACE.
