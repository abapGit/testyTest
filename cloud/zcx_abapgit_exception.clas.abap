"! abapGit general error
CLASS zcx_abapgit_exception DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  CREATE PUBLIC .

  PUBLIC SECTION.
TYPES: BEGIN OF ty_astack,
         mainprogram  TYPE c LENGTH 40,
         include      TYPE c LENGTH 40,
         line         TYPE i,
         blocktype    TYPE c LENGTH 12,
         blockname    TYPE string,
         flag_system	TYPE c LENGTH 1,
       END OF ty_astack.
TYPES abap_callstack TYPE STANDARD TABLE OF ty_astack WITH DEFAULT KEY.
TYPES abap_callstack_line TYPE LINE OF abap_callstack.

TYPES: BEGIN OF ty_aline,
         tdformat TYPE c LENGTH 1,
         tdline   TYPE c LENGTH 1,
       END OF ty_aline.
TYPES tline_tab TYPE STANDARD TABLE OF ty_aline WITH DEFAULT KEY.
TYPES tline TYPE LINE OF tline_tab.

TYPES doku_obj TYPE c LENGTH 60.
TYPES tdline TYPE c LENGTH 1.
    INTERFACES if_t100_message .

    CONSTANTS:
      BEGIN OF c_section_text,
        cause           TYPE string VALUE `Cause`,
        system_response TYPE string VALUE `System response`,
        what_to_do      TYPE string VALUE `Procedure`,
        sys_admin       TYPE string VALUE `System administration`,
      END OF c_section_text .
    CONSTANTS:
      BEGIN OF c_section_token,
        cause           TYPE string VALUE `&CAUSE&`,
        system_response TYPE string VALUE `&SYSTEM_RESPONSE&`,
        what_to_do      TYPE string VALUE `&WHAT_TO_DO&`,
        sys_admin       TYPE string VALUE `&SYS_ADMIN&`,
      END OF c_section_token .

    CLASS-DATA null TYPE string.

    DATA msgv1 TYPE symsgv READ-ONLY .
    DATA msgv2 TYPE symsgv READ-ONLY .
    DATA msgv3 TYPE symsgv READ-ONLY .
    DATA msgv4 TYPE symsgv READ-ONLY .
    DATA mv_longtext TYPE string READ-ONLY.
    DATA mt_callstack TYPE abap_callstack READ-ONLY.
    DATA mi_log TYPE REF TO zif_abapgit_log READ-ONLY.

    "! Raise exception with text
    "! @parameter iv_text | Text
    "! @parameter ix_previous | Previous exception
    "! @parameter ii_log | Log
    "! @parameter iv_longtext | Longtext
    "! @raising zcx_abapgit_exception | Exception
    CLASS-METHODS raise
      IMPORTING
        !iv_text     TYPE clike
        !ix_previous TYPE REF TO cx_root OPTIONAL
        !ii_log      TYPE REF TO zif_abapgit_log OPTIONAL
        !iv_longtext TYPE csequence OPTIONAL
      RAISING
        zcx_abapgit_exception .
    "! Raise exception with T100 message
    "! <p>
    "! Will default to sy-msg* variables. These need to be set right before calling this method.
    "! </p>
    "! @parameter iv_msgid | Message ID
    "! @parameter iv_msgno | Message number
    "! @parameter iv_msgv1 | Message variable 1
    "! @parameter iv_msgv2 | Message variable 2
    "! @parameter iv_msgv3 | Message variable 3
    "! @parameter iv_msgv4 | Message variable 4
    "! @parameter ii_log | Log
    "! @parameter ix_previous | Previous exception
    "! @parameter iv_longtext | Longtext
    "! @raising zcx_abapgit_exception | Exception
    CLASS-METHODS raise_t100
      IMPORTING
        !iv_msgid    TYPE symsgid DEFAULT sy-msgid
        !iv_msgno    TYPE symsgno DEFAULT sy-msgno
        !iv_msgv1    TYPE symsgv DEFAULT sy-msgv1
        !iv_msgv2    TYPE symsgv DEFAULT sy-msgv2
        !iv_msgv3    TYPE symsgv DEFAULT sy-msgv3
        !iv_msgv4    TYPE symsgv DEFAULT sy-msgv4
        !ii_log      TYPE REF TO zif_abapgit_log OPTIONAL
        !ix_previous TYPE REF TO cx_root OPTIONAL
        !iv_longtext TYPE csequence OPTIONAL
      RAISING
        zcx_abapgit_exception .
    "! Raise with text from previous exception
    "! @parameter ix_previous | Previous exception
    "! @parameter iv_longtext | Longtext
    "! @raising zcx_abapgit_exception | Exception
    CLASS-METHODS raise_with_text
      IMPORTING
        !ix_previous TYPE REF TO cx_root
        !iv_longtext TYPE csequence OPTIONAL
      RAISING
        zcx_abapgit_exception .
    METHODS constructor
      IMPORTING
        !textid   LIKE if_t100_message=>t100key OPTIONAL
        !previous LIKE previous OPTIONAL
        !log      TYPE REF TO zif_abapgit_log OPTIONAL
        !msgv1    TYPE symsgv OPTIONAL
        !msgv2    TYPE symsgv OPTIONAL
        !msgv3    TYPE symsgv OPTIONAL
        !msgv4    TYPE symsgv OPTIONAL
        !longtext TYPE csequence OPTIONAL .

    METHODS get_source_position
        REDEFINITION .
    METHODS if_message~get_longtext
        REDEFINITION .
  PROTECTED SECTION.
  PRIVATE SECTION.

    CONSTANTS c_generic_error_msg TYPE string VALUE `An error occurred (ZCX_ABAPGIT_EXCEPTION)`.

    METHODS save_callstack .
    METHODS itf_to_string
      IMPORTING
        !it_itf          TYPE tline_tab
      RETURNING
        VALUE(rv_result) TYPE string .
    METHODS get_t100_longtext_itf
      RETURNING
        VALUE(rt_itf) TYPE tline_tab .
    METHODS remove_empty_section
      IMPORTING
        !iv_tabix_from TYPE i
        !iv_tabix_to   TYPE i
      CHANGING
        !ct_itf        TYPE tline_tab .
    METHODS replace_section_head_with_text
      CHANGING
        !cs_itf TYPE tline .
    CLASS-METHODS remove_newlines_from_string
      IMPORTING
        iv_string        TYPE string
      RETURNING
        VALUE(rv_result) TYPE string.
ENDCLASS.



CLASS zcx_abapgit_exception IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.

    super->constructor( previous = previous ).

    me->msgv1 = msgv1.
    me->msgv2 = msgv2.
    me->msgv3 = msgv3.
    me->msgv4 = msgv4.
    mi_log = log.
    mv_longtext = longtext.

    CLEAR me->textid.

    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.

    save_callstack( ).

  ENDMETHOD.


  METHOD get_source_position.

    FIELD-SYMBOLS: <ls_callstack> LIKE LINE OF mt_callstack.

    READ TABLE mt_callstack ASSIGNING <ls_callstack>
                            INDEX 1.
    IF sy-subrc = 0.
      program_name = <ls_callstack>-mainprogram.
      include_name = <ls_callstack>-include.
      source_line  = <ls_callstack>-line.
    ELSE.
      super->get_source_position(
        IMPORTING
          program_name = program_name
          include_name = include_name
          source_line  = source_line ).
    ENDIF.

  ENDMETHOD.


  METHOD get_t100_longtext_itf.

    DATA: lv_docu_key TYPE doku_obj.

    FIELD-SYMBOLS <lv_msgv> TYPE any.

    lv_docu_key = if_t100_message~t100key-msgid && if_t100_message~t100key-msgno.

    ASSERT 1 = 'replacedByRefactorMJS'.

    IF sy-subrc = 0.
      ASSIGN me->(if_t100_message~t100key-attr1) TO <lv_msgv>.
      IF sy-subrc = 0.
        REPLACE ALL OCCURRENCES OF '&V1&' IN TABLE rt_itf WITH <lv_msgv>.
      ENDIF.
      ASSIGN me->(if_t100_message~t100key-attr2) TO <lv_msgv>.
      IF sy-subrc = 0.
        REPLACE ALL OCCURRENCES OF '&V2&' IN TABLE rt_itf WITH <lv_msgv>.
      ENDIF.
      ASSIGN me->(if_t100_message~t100key-attr3) TO <lv_msgv>.
      IF sy-subrc = 0.
        REPLACE ALL OCCURRENCES OF '&V3&' IN TABLE rt_itf WITH <lv_msgv>.
      ENDIF.
      ASSIGN me->(if_t100_message~t100key-attr4) TO <lv_msgv>.
      IF sy-subrc = 0.
        REPLACE ALL OCCURRENCES OF '&V4&' IN TABLE rt_itf WITH <lv_msgv>.
      ENDIF.
    ENDIF.

  ENDMETHOD.


  METHOD if_message~get_longtext.
    DATA: lv_preserve_newlines_handled TYPE abap_bool VALUE abap_false.

    IF mv_longtext IS NOT INITIAL.
      result = mv_longtext.
    ELSEIF if_t100_message~t100key IS NOT INITIAL.
      result = itf_to_string( get_t100_longtext_itf( ) ).
    ELSE.
      result = super->get_longtext( preserve_newlines ).
      lv_preserve_newlines_handled = abap_true.
    ENDIF.

    IF lv_preserve_newlines_handled = abap_false AND preserve_newlines = abap_false.
      result = remove_newlines_from_string( result ).
    ENDIF.
  ENDMETHOD.


  METHOD itf_to_string.

    CONSTANTS: lc_format_section TYPE string VALUE 'U1'.

    DATA:
      lt_stream      TYPE TABLE OF tdline,
      lt_string      TYPE TABLE OF string,
      lt_itf         TYPE tline_tab,
      lv_has_content TYPE abap_bool,
      lv_tabix_from  TYPE syst-tabix,
      lv_tabix_to    TYPE syst-tabix.

    FIELD-SYMBOLS: <ls_itf_section>      TYPE tline,
                   <ls_itf_section_item> TYPE tline.

    lt_itf = it_itf.

    " You should remember that we replace the U1 format because
    " that preserves the section header of longtexts.
    LOOP AT lt_itf ASSIGNING <ls_itf_section>
                   WHERE tdformat = lc_format_section.

      CLEAR:
        lv_has_content,
        lv_tabix_to.

      lv_tabix_from = sy-tabix.

      LOOP AT lt_itf ASSIGNING <ls_itf_section_item>
                     FROM sy-tabix + 1.

        IF <ls_itf_section_item>-tdformat = lc_format_section.
          lv_tabix_to = sy-tabix.
          EXIT.
        ELSEIF <ls_itf_section_item>-tdline IS NOT INITIAL.
          lv_has_content = abap_true.
        ENDIF.

      ENDLOOP.

      IF lv_has_content = abap_false.
        remove_empty_section(
          EXPORTING
            iv_tabix_from = lv_tabix_from
            iv_tabix_to   = lv_tabix_to
          CHANGING
            ct_itf        = lt_itf ).
        CONTINUE.
      ENDIF.

      replace_section_head_with_text( CHANGING cs_itf = <ls_itf_section> ).

    ENDLOOP.

    ASSERT 1 = 'replacedByRefactorMJS'.

    rv_result = concat_lines_of(
      table = lt_string
      sep   = cl_abap_char_utilities=>newline ).

  ENDMETHOD.


  METHOD raise.

    IF iv_text IS INITIAL.
      cl_message_helper=>set_msg_vars_for_clike( c_generic_error_msg ).
    ELSE.
      cl_message_helper=>set_msg_vars_for_clike( iv_text ).
    ENDIF.

    raise_t100(
      ii_log      = ii_log
      ix_previous = ix_previous
      iv_longtext = iv_longtext ).

  ENDMETHOD.


  METHOD raise_t100.
    DATA: ls_t100_key TYPE scx_t100key.

    ls_t100_key-msgid = iv_msgid.
    ls_t100_key-msgno = iv_msgno.
    ls_t100_key-attr1 = 'MSGV1'.
    ls_t100_key-attr2 = 'MSGV2'.
    ls_t100_key-attr3 = 'MSGV3'.
    ls_t100_key-attr4 = 'MSGV4'.

    IF iv_msgid IS INITIAL.
      CLEAR ls_t100_key.
    ENDIF.

    RAISE EXCEPTION TYPE zcx_abapgit_exception
      EXPORTING
        textid   = ls_t100_key
        log      = ii_log
        msgv1    = iv_msgv1
        msgv2    = iv_msgv2
        msgv3    = iv_msgv3
        msgv4    = iv_msgv4
        previous = ix_previous
        longtext = iv_longtext.
  ENDMETHOD.


  METHOD raise_with_text.
    raise(
      iv_text     = ix_previous->get_text( )
      ix_previous = ix_previous
      iv_longtext = iv_longtext ).
  ENDMETHOD.


  METHOD remove_empty_section.
    IF iv_tabix_to BETWEEN iv_tabix_from AND lines( ct_itf ).
      DELETE ct_itf FROM iv_tabix_from TO iv_tabix_to.
    ELSE.
      DELETE ct_itf FROM iv_tabix_from.
    ENDIF.
  ENDMETHOD.


  METHOD remove_newlines_from_string.
    rv_result = iv_string.

    REPLACE ALL OCCURRENCES OF ` ` && cl_abap_char_utilities=>cr_lf IN rv_result WITH ` `.
    REPLACE ALL OCCURRENCES OF cl_abap_char_utilities=>cr_lf IN rv_result WITH ` `.
    REPLACE ALL OCCURRENCES OF ` ` && cl_abap_char_utilities=>newline IN rv_result WITH ` `.
    REPLACE ALL OCCURRENCES OF cl_abap_char_utilities=>newline IN rv_result WITH ` `.
  ENDMETHOD.


  METHOD replace_section_head_with_text.

    CASE cs_itf-tdline.
      WHEN c_section_token-cause.
        cs_itf-tdline = c_section_text-cause.
      WHEN c_section_token-system_response.
        cs_itf-tdline = c_section_text-system_response.
      WHEN c_section_token-what_to_do.
        cs_itf-tdline = c_section_text-what_to_do.
      WHEN c_section_token-sys_admin.
        cs_itf-tdline = c_section_text-sys_admin.
    ENDCASE.

  ENDMETHOD.


  METHOD save_callstack.

    FIELD-SYMBOLS: <ls_callstack> LIKE LINE OF mt_callstack.

    ASSERT 1 = 'replacedByRefactorMJS'.

    " You should remember that the first lines are from zcx_abapgit_exception
    " and are removed so that highest level in the callstack is the position where
    " the exception is raised.
    "
    " For the merged report it's hard to do that, because zcx_abapgit_exception
    " isn't visible in the callstack. Therefore we have to check the Events.
    LOOP AT mt_callstack ASSIGNING <ls_callstack>.

      IF <ls_callstack>-mainprogram CP |ZCX_ABAPGIT_EXCEPTION*| " full
      OR <ls_callstack>-blockname = `SAVE_CALLSTACK` " merged
      OR <ls_callstack>-blockname = `CONSTRUCTOR` " merged
      OR <ls_callstack>-blockname CP `RAISE*`. "merged
        DELETE TABLE mt_callstack FROM <ls_callstack>.
      ELSE.
        EXIT.
      ENDIF.

    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
