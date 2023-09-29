INTERFACE zif_abapgit_sap_report
  PUBLIC.

TYPES: BEGIN OF progdir,
 name    TYPE c LENGTH 1,
 state   TYPE c LENGTH 1,
 sqlx    TYPE c LENGTH 1,
 edtx    TYPE c LENGTH 1,
 varcl   TYPE c LENGTH 1,
 dbapl   TYPE c LENGTH 1,
 dbna    TYPE c LENGTH 1,
 clas    TYPE c LENGTH 1,
 type    TYPE c LENGTH 1,
 occurs  TYPE c LENGTH 1,
 subc    TYPE c LENGTH 1,
 appl    TYPE c LENGTH 1,
 secu    TYPE c LENGTH 1,
 cnam    TYPE c LENGTH 1,
 cdat    TYPE c LENGTH 1,
 unam    TYPE c LENGTH 1,
 udat    TYPE c LENGTH 1,
 vern    TYPE c LENGTH 1,
 levl    TYPE c LENGTH 1,
 rstat   TYPE c LENGTH 1,
 rmand   TYPE c LENGTH 1,
 rload   TYPE c LENGTH 1,
 fixpt   TYPE c LENGTH 1,
 sset    TYPE c LENGTH 1,
 sdate   TYPE c LENGTH 1,
 stime   TYPE c LENGTH 1,
 idate   TYPE c LENGTH 1,
 itime   TYPE c LENGTH 1,
 ldbname TYPE c LENGTH 1,
 uccheck TYPE c LENGTH 1,
END OF progdir.
  TYPES:
    BEGIN OF ty_progdir,
      name    TYPE progdir-name,
      state   TYPE progdir-state,
      sqlx    TYPE progdir-sqlx,
      edtx    TYPE progdir-edtx,
      varcl   TYPE progdir-varcl,
      dbapl   TYPE progdir-dbapl,
      dbna    TYPE progdir-dbna,
      clas    TYPE progdir-clas,
      type    TYPE progdir-type,
      occurs  TYPE progdir-occurs,
      subc    TYPE progdir-subc,
      appl    TYPE progdir-appl,
      secu    TYPE progdir-secu,
      cnam    TYPE progdir-cnam,
      cdat    TYPE progdir-cdat,
      unam    TYPE progdir-unam,
      udat    TYPE progdir-udat,
      vern    TYPE progdir-vern,
      levl    TYPE progdir-levl,
      rstat   TYPE progdir-rstat,
      rmand   TYPE progdir-rmand,
      rload   TYPE progdir-rload,
      fixpt   TYPE progdir-fixpt,
      sset    TYPE progdir-sset,
      sdate   TYPE progdir-sdate,
      stime   TYPE progdir-stime,
      idate   TYPE progdir-idate,
      itime   TYPE progdir-itime,
      ldbname TYPE progdir-ldbname,
      uccheck TYPE progdir-uccheck,
    END OF ty_progdir.

  METHODS read_report
    IMPORTING
      iv_name          TYPE syrepid
      iv_state         TYPE char1 OPTIONAL
      is_item          TYPE zif_abapgit_definitions=>ty_item OPTIONAL
    RETURNING
      VALUE(rt_source) TYPE string_table
    RAISING
      zcx_abapgit_exception.

  METHODS insert_report
    IMPORTING
      iv_name           TYPE syrepid
      it_source         TYPE STANDARD TABLE
      iv_state          TYPE char1 OPTIONAL
      iv_program_type   TYPE c OPTIONAL
      iv_extension_type TYPE c OPTIONAL
      iv_package        TYPE I_CustABAPObjDirectoryEntry-ABAPPackage
      is_item           TYPE zif_abapgit_definitions=>ty_item OPTIONAL
    RAISING
      zcx_abapgit_exception.

  METHODS update_report
    IMPORTING
      iv_name           TYPE syrepid
      it_source         TYPE STANDARD TABLE
      iv_state          TYPE char1 OPTIONAL
      iv_program_type   TYPE c OPTIONAL
      iv_extension_type TYPE c OPTIONAL
      iv_package        TYPE I_CustABAPObjDirectoryEntry-ABAPPackage
      is_item           TYPE zif_abapgit_definitions=>ty_item OPTIONAL
    RETURNING
      VALUE(rv_updated) TYPE abap_bool
    RAISING
      zcx_abapgit_exception.

  METHODS delete_report
    IMPORTING
      iv_name        TYPE syrepid
      iv_raise_error TYPE abap_bool DEFAULT abap_false
      is_item        TYPE zif_abapgit_definitions=>ty_item OPTIONAL
    RAISING
      zcx_abapgit_exception.

  METHODS read_progdir
    IMPORTING
      iv_name           TYPE syrepid
      iv_state          TYPE char1 DEFAULT 'A'
    RETURNING
      VALUE(rs_progdir) TYPE ty_progdir
    RAISING
      zcx_abapgit_exception.

  METHODS update_progdir
    IMPORTING
      is_progdir TYPE ty_progdir
      iv_package TYPE I_CustABAPObjDirectoryEntry-ABAPPackage
      iv_state   TYPE char1 DEFAULT 'I'
    RAISING
      zcx_abapgit_exception.

ENDINTERFACE.
