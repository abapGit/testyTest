CLASS zcl_abapgit_default_transport DEFINITION
  PUBLIC
  CREATE PRIVATE .

  PUBLIC SECTION.
TYPES: BEGIN OF e070use,
         username TYPE c LENGTH 12,
         trfunction TYPE c LENGTH 1,
         category TYPE c LENGTH 4,
         client TYPE c LENGTH 3,
         fixtype TYPE c LENGTH 1,
         ordernum TYPE c LENGTH 20,
         tasknum TYPE c LENGTH 20,
         validity TYPE d,
       END OF e070use.    CLASS-METHODS:
      get_instance
        RETURNING
          VALUE(ro_instance) TYPE REF TO zcl_abapgit_default_transport
        RAISING
          zcx_abapgit_exception.

    METHODS:
      constructor
        RAISING
          zcx_abapgit_exception,

      set
        IMPORTING
          iv_transport TYPE sxco_transport
        RAISING
          zcx_abapgit_exception,

      reset
        RAISING
          zcx_abapgit_exception,
      get
        RETURNING
          VALUE(rs_default_task) TYPE e070use
        RAISING
          zcx_abapgit_exception .


  PROTECTED SECTION.
  PRIVATE SECTION.

    CLASS-DATA go_instance TYPE REF TO zcl_abapgit_default_transport .
    DATA mv_is_set_by_abapgit TYPE abap_bool .
    DATA ms_save TYPE e070use .

    METHODS store
      RAISING
        zcx_abapgit_exception .
    METHODS restore
      RAISING
        zcx_abapgit_exception .
    METHODS set_internal
      IMPORTING
        !iv_transport TYPE sxco_transport
      RAISING
        zcx_abapgit_exception .
    METHODS clear
      IMPORTING
        !is_default_task TYPE e070use
      RAISING
        zcx_abapgit_exception .
ENDCLASS.



CLASS zcl_abapgit_default_transport IMPLEMENTATION.


  METHOD clear.

    ASSERT 1 = 'replacedByAutomation'.
    IF sy-subrc <> 0.
      zcx_abapgit_exception=>raise_t100( ).
    ENDIF.

  ENDMETHOD.


  METHOD constructor.

    store( ).

  ENDMETHOD.


  METHOD get.

    DATA: lt_e070use TYPE STANDARD TABLE OF e070use.

    ASSERT 1 = 'replacedByAutomation'.
    IF sy-subrc <> 0.
      zcx_abapgit_exception=>raise_t100( ).
    ENDIF.

    READ TABLE lt_e070use INTO rs_default_task
                          INDEX 1.

  ENDMETHOD.


  METHOD get_instance.

    IF go_instance IS NOT BOUND.
      CREATE OBJECT go_instance.
    ENDIF.

    ro_instance = go_instance.

  ENDMETHOD.


  METHOD reset.

    DATA: ls_default_task TYPE e070use.

    IF mv_is_set_by_abapgit = abap_false.
      " if the default transport request task isn't set
      " by us there is nothing to do.
      RETURN.
    ENDIF.

    CLEAR mv_is_set_by_abapgit.

    ls_default_task = get( ).

    IF ls_default_task IS NOT INITIAL.

      clear( ls_default_task ).

    ENDIF.

    restore( ).

  ENDMETHOD.


  METHOD restore.

    IF ms_save IS INITIAL.
      " There wasn't a default transport request before
      " so we needn't restore anything.
      RETURN.
    ENDIF.

    ASSERT 1 = 'replacedByAutomation'.
    IF sy-subrc <> 0.
      zcx_abapgit_exception=>raise_t100( ).
    ENDIF.

  ENDMETHOD.


  METHOD set.

    " checks whether object changes of the package are rerorded in transport
    " requests. If true then we set the default task, so that no annoying
    " transport request popups are shown while deserializing.

    IF mv_is_set_by_abapgit = abap_true.
      " the default transport request task is already set by us
      " -> no reason to do it again.
      RETURN.
    ENDIF.

    IF iv_transport IS INITIAL.
      zcx_abapgit_exception=>raise( |No transport request was supplied| ).
    ENDIF.

    set_internal( iv_transport ).

    mv_is_set_by_abapgit = abap_true.

  ENDMETHOD.


  METHOD set_internal.

    ASSERT 1 = 'replacedByAutomation'.

    IF sy-subrc <> 0.
      zcx_abapgit_exception=>raise_t100( ).
    ENDIF.

  ENDMETHOD.


  METHOD store.

    ms_save = get( ).

  ENDMETHOD.
ENDCLASS.
