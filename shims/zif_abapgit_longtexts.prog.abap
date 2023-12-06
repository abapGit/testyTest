TYPES: BEGIN OF ty_aline,
         tdformat TYPE c LENGTH 1,
         tdline   TYPE c LENGTH 1,
       END OF ty_aline.
TYPES tline_tab TYPE STANDARD TABLE OF ty_aline WITH DEFAULT KEY.
TYPES tline TYPE LINE OF tline_tab.

TYPES: BEGIN OF thead,
         tdobject TYPE c LENGTH 10,
         tdname   TYPE c LENGTH 70,
         tdid     TYPE c LENGTH 4,
         tdspras  TYPE c LENGTH 1,
* more here
       END OF thead.

TYPES: BEGIN OF dokil,
         id     TYPE c LENGTH 2,
         object TYPE c LENGTH 60,
         langu  TYPE c LENGTH 1,
* more here
       END OF dokil.