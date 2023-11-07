CLASS zcl_abapgit_log_viewer DEFINITION PUBLIC FINAL CREATE PRIVATE.
  PUBLIC SECTION.
    CLASS-METHODS show_log
      IMPORTING
        !ii_log TYPE REF TO zif_abapgit_log .
    CLASS-METHODS to_html
      IMPORTING
        !ii_log        TYPE REF TO zif_abapgit_log
      RETURNING
        VALUE(ri_html) TYPE REF TO zif_abapgit_html .
    CLASS-METHODS write_log
      IMPORTING
        !ii_log TYPE REF TO zif_abapgit_log .
ENDCLASS.



CLASS zcl_abapgit_log_viewer IMPLEMENTATION.
  method show_log.
  endmethod.
  method to_html.
  endmethod.
  method write_log.
  ENDMETHOD.
ENDCLASS.
