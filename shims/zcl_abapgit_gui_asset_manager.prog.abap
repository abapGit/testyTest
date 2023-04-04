TYPES: BEGIN OF wwwdatatab,
         relid TYPE c LENGTH 2,
         objid TYPE c LENGTH 40,
       END OF wwwdatatab.

TYPES: BEGIN OF wwwparams,
         value TYPE c LENGTH 250,
       END OF wwwparams.

TYPES: BEGIN OF w3mime,
         line TYPE x LENGTH 255,
       END OF w3mime.