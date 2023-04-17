
TYPES: BEGIN OF ty,
         name  TYPE string,
         value TYPE string,
       END OF ty.
* TIHTTPNVP is actually released, but the structure it refers is not
* this is a problem for the cloud version
TYPES tihttpnvp TYPE STANDARD TABLE OF ty WITH DEFAULT KEY.