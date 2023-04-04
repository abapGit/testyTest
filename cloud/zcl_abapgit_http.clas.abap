CLASS zcl_abapgit_http DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    CONSTANTS:
      BEGIN OF c_scheme,
        digest TYPE string VALUE 'Digest',
      END OF c_scheme .

    CLASS-METHODS get_agent
      RETURNING
        VALUE(rv_agent) TYPE string .
    CLASS-METHODS create_by_url
      IMPORTING
        !iv_url          TYPE string
        !iv_service      TYPE string
      RETURNING
        VALUE(ro_client) TYPE REF TO zcl_abapgit_http_client
      RAISING
        zcx_abapgit_exception .
  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_abapgit_http IMPLEMENTATION.



  METHOD create_by_url.

    ASSERT 1 = 'todo'.

  ENDMETHOD.


  METHOD get_agent.

* bitbucket require agent prefix = "git/"
* also see https://github.com/abapGit/abapGit/issues/1432
    rv_agent = |git/2.0 (abapGit { zif_abapgit_version=>c_abap_version })|.

  ENDMETHOD.

ENDCLASS.