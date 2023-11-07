INTERFACE zif_abapgit_longtexts
  PUBLIC .
TYPES: BEGIN OF ty_aline,
         tdformat TYPE c LENGTH 1,
         tdline   TYPE c LENGTH 1,
       END OF ty_aline.
TYPES tline_tab TYPE STANDARD TABLE OF ty_aline WITH DEFAULT KEY.
TYPES tline TYPE LINE OF tline_tab.

TYPES: BEGIN OF thead,
tdobject TYPE c LENGTH 10,
tdname TYPE c LENGTH 70,
tdid TYPE c LENGTH 4,
tdspras TYPE c LENGTH 1,
* more here
END OF thead.

TYPES: BEGIN OF dokil,
         id     TYPE c LENGTH 2,
         object TYPE c LENGTH 60,
         langu  TYPE c LENGTH 1,
* more here
       END OF dokil.
  TYPES:
    BEGIN OF ty_longtext,
      dokil TYPE dokil,
      head  TYPE thead,
      lines TYPE tline_tab,
    END OF ty_longtext .
  TYPES:
    ty_longtexts TYPE STANDARD TABLE OF ty_longtext WITH NON-UNIQUE DEFAULT KEY .

  METHODS changed_by
    IMPORTING
      !iv_object_name TYPE I_CustABAPObjDirectoryEntry-ABAPObject
      !iv_longtext_id TYPE dokil-id
      !it_dokil       TYPE zif_abapgit_definitions=>ty_dokil_tt OPTIONAL
    RETURNING
      VALUE(rv_user)  TYPE syuname
    RAISING
      zcx_abapgit_exception .
  METHODS serialize
    IMPORTING
      !iv_longtext_name   TYPE string DEFAULT 'LONGTEXTS'
      !iv_object_name     TYPE clike
      !iv_longtext_id     TYPE dokil-id
      !it_dokil           TYPE zif_abapgit_definitions=>ty_dokil_tt OPTIONAL
      !ii_xml             TYPE REF TO zif_abapgit_xml_output
      !io_i18n_params     TYPE REF TO zcl_abapgit_i18n_params
    RETURNING
      VALUE(rt_longtexts) TYPE ty_longtexts
    RAISING
      zcx_abapgit_exception .
  METHODS deserialize
    IMPORTING
      !iv_longtext_name TYPE string DEFAULT 'LONGTEXTS'
      !iv_object_name   TYPE clike
      !iv_longtext_id   TYPE dokil-id
      !ii_xml           TYPE REF TO zif_abapgit_xml_input
      !iv_main_language TYPE sy-langu
    RAISING
      zcx_abapgit_exception .
  METHODS delete
    IMPORTING
      !iv_object_name TYPE I_CustABAPObjDirectoryEntry-ABAPObject
      !iv_longtext_id TYPE dokil-id
    RAISING
      zcx_abapgit_exception .
ENDINTERFACE.
