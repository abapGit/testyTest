CLASS zcl_abapgit_repo_filter DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS apply
      IMPORTING
        it_filter TYPE zif_abapgit_definitions=>ty_tadir_tt
      CHANGING
        ct_tadir  TYPE zif_abapgit_definitions=>ty_tadir_tt .

    METHODS apply_object_filter
      IMPORTING
        it_filter   TYPE zif_abapgit_definitions=>ty_tadir_tt
        io_dot      TYPE REF TO zcl_abapgit_dot_abapgit OPTIONAL
        iv_devclass TYPE I_CustABAPObjDirectoryEntry-ABAPPackage OPTIONAL
      CHANGING
        ct_files    TYPE zif_abapgit_git_definitions=>ty_files_tt
      RAISING
        zcx_abapgit_exception.
  PROTECTED SECTION.

    METHODS filter_generated_tadir
      CHANGING
        !ct_tadir TYPE zif_abapgit_definitions=>ty_tadir_tt .

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_abapgit_repo_filter IMPLEMENTATION.


  METHOD apply.

    DATA: lt_filter TYPE SORTED TABLE OF zif_abapgit_definitions=>ty_tadir
                      WITH NON-UNIQUE KEY object obj_name,
          lv_index  TYPE i.

    FIELD-SYMBOLS: <ls_tadir> LIKE LINE OF ct_tadir.

    filter_generated_tadir( CHANGING ct_tadir = ct_tadir ).

    IF lines( it_filter ) = 0.
      RETURN.
    ENDIF.

    lt_filter = it_filter.

* this is another loop at TADIR, but typically the filter is blank
    LOOP AT ct_tadir ASSIGNING <ls_tadir>.
      lv_index = sy-tabix.
      READ TABLE lt_filter TRANSPORTING NO FIELDS WITH KEY object = <ls_tadir>-object
                                                           obj_name = <ls_tadir>-obj_name
                                                  BINARY SEARCH.
      IF sy-subrc <> 0.
        DELETE ct_tadir INDEX lv_index.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.


  METHOD apply_object_filter.
    ASSERT 1 = 'decoupled'.

  ENDMETHOD.


  METHOD filter_generated_tadir.

    ASSERT 1 = 'decoupled'.

  ENDMETHOD.
ENDCLASS.