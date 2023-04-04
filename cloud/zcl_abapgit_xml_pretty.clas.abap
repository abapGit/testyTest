CLASS zcl_abapgit_xml_pretty DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS print
      IMPORTING
        !iv_xml           TYPE string
        !iv_ignore_errors TYPE abap_bool DEFAULT abap_true
        !iv_unpretty      TYPE abap_bool DEFAULT abap_false
      RETURNING
        VALUE(rv_xml)     TYPE string
      RAISING
        zcx_abapgit_exception .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_ABAPGIT_XML_PRETTY IMPLEMENTATION.


  METHOD print.

* todo

  ENDMETHOD.
ENDCLASS.
