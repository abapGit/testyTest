TYPES: BEGIN OF sval,
         tabname TYPE c LENGTH 30,
         fieldname TYPE c LENGTH 30,
         value TYPE c LENGTH 132,
         field_attr TYPE c LENGTH 2,
         field_obl TYPE c LENGTH 1,
         comp_code TYPE c LENGTH 2,
         fieldtext TYPE c LENGTH 20,
         comp_tab TYPE c LENGTH 30,
         comp_field TYPE c LENGTH 30,
         novaluehlp TYPE c LENGTH 1,
       END OF sval.

TYPES lvc_outlen TYPE n LENGTH 6.

TYPES: BEGIN OF ddshretval,
         fieldval TYPE c LENGTH 132,
       END OF ddshretval.

TYPES: BEGIN OF scompkdtln,
         devclass TYPE c LENGTH 30,
         ctext TYPE c LENGTH 60,
         as4user TYPE c LENGTH 8,
       END OF scompkdtln.
TYPES trwbo_request_headers TYPE c LENGTH 1.
TYPES lvc_title TYPE c LENGTH 1.
TYPES salv_de_constant TYPE c LENGTH 1.
TYPES trwbo_selection TYPE c LENGTH 1.
TYPES trwbo_title TYPE c LENGTH 1.
TYPES sci_chkv TYPE c LENGTH 1.