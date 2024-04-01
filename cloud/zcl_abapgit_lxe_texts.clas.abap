CLASS zcl_abapgit_lxe_texts DEFINITION PUBLIC.
  PUBLIC SECTION.
    CLASS-METHODS get_translation_languages
      IMPORTING
        iv_main_language   TYPE spras
        it_i18n_languages  TYPE zif_abapgit_definitions=>ty_languages
      RETURNING
        VALUE(rt_languages) TYPE zif_abapgit_definitions=>ty_languages
      RAISING
        zcx_abapgit_exception.
ENDCLASS.

CLASS zcl_abapgit_lxe_texts IMPLEMENTATION.

  METHOD get_translation_languages.
    RETURN.
  ENDMETHOD.

ENDCLASS.