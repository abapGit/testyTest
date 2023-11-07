CLASS zcl_abapgit_services_abapgit DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CONSTANTS c_abapgit_repo TYPE string VALUE 'https://github.com/abapGit/abapGit' ##NO_TEXT.
    CONSTANTS c_abapgit_homepage TYPE string VALUE 'https://www.abapgit.org' ##NO_TEXT.
    CONSTANTS c_abapgit_wikipage TYPE string VALUE 'https://docs.abapgit.org' ##NO_TEXT.
    CONSTANTS c_dotabap_homepage TYPE string VALUE 'https://dotabap.org' ##NO_TEXT.
    CONSTANTS c_abapgit_class TYPE seoclsname VALUE `ZCX_ABAPGIT_EXCEPTION` ##NO_TEXT.
    CONSTANTS c_changelog_path TYPE string VALUE '/blob/main/changelog.txt' ##NO_TEXT.

    CLASS-METHODS open_abapgit_homepage
      IMPORTING
        iv_page TYPE string OPTIONAL
      RAISING
        zcx_abapgit_exception .
    CLASS-METHODS open_abapgit_wikipage
      IMPORTING
        iv_page TYPE string OPTIONAL
      RAISING
        zcx_abapgit_exception .
    CLASS-METHODS open_dotabap_homepage
      RAISING
        zcx_abapgit_exception .
    CLASS-METHODS open_abapgit_changelog
      RAISING
        zcx_abapgit_exception .
    CLASS-METHODS is_installed
      RETURNING
        VALUE(rv_devclass) TYPE tadir-devclass .
    CLASS-METHODS prepare_gui_startup
      RAISING
        zcx_abapgit_exception .
    CLASS-METHODS get_abapgit_tcode
      RETURNING
        VALUE(rv_tcode) TYPE string .
  PROTECTED SECTION.
  PRIVATE SECTION.

    CLASS-METHODS set_start_repo_from_package
      IMPORTING
        !iv_package TYPE devclass
      RAISING
        zcx_abapgit_exception .
    CLASS-METHODS get_package_from_adt
      RETURNING
        VALUE(rv_package) TYPE devclass .
    CLASS-METHODS check_sapgui
      RAISING
        zcx_abapgit_exception .
    CLASS-METHODS open_url_in_browser
      IMPORTING
        !iv_url TYPE string
      RAISING
        zcx_abapgit_exception.
ENDCLASS.



CLASS zcl_abapgit_services_abapgit IMPLEMENTATION.


  METHOD check_sapgui.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD get_abapgit_tcode.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.


  METHOD get_package_from_adt.

    ASSERT 1 = 'decoupled'.
  ENDMETHOD.


  METHOD is_installed.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD open_abapgit_changelog.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.


  METHOD open_abapgit_homepage.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.


  METHOD open_abapgit_wikipage.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.


  METHOD open_dotabap_homepage.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.


  METHOD open_url_in_browser.
    ASSERT 1 = 'decoupled'.
  ENDMETHOD.


  METHOD prepare_gui_startup.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD set_start_repo_from_package.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.
ENDCLASS.