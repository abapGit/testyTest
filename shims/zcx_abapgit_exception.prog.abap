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