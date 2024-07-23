CLASS zcl_abapgit_where_used_tools DEFINITION PUBLIC.
  PUBLIC SECTION.
    TYPES ty_devc_range TYPE RANGE OF tadir-devclass.
    TYPES:
      BEGIN OF ty_dependency,
        package       TYPE devclass,
        obj_type      TYPE tadir-object,
        obj_prog_type TYPE trdir-subc,
        obj_name      TYPE tadir-obj_name,
        obj_cls       TYPE string,
        dep_package   TYPE devclass,
        dep_obj_type  TYPE tadir-object,
        dep_obj_name  TYPE tadir-obj_name,
        dep_used_cls  TYPE string,
        dep_used_obj  TYPE string,
      END OF ty_dependency.
    TYPES
      ty_dependency_tt TYPE STANDARD TABLE OF ty_dependency WITH DEFAULT KEY.

    CLASS-METHODS new
      RETURNING
      VALUE(ro_instance) TYPE REF TO zcl_abapgit_where_used_tools.

  " the initial version of this utility is also available as a standalone tool
  " here: https://github.com/sbcgua/crossdeps
    METHODS select_external_usages
      IMPORTING
        iv_package            TYPE tadir-devclass
        iv_ignore_subpackages TYPE abap_bool DEFAULT abap_false
        ir_package_scope      TYPE ty_devc_range OPTIONAL
      RETURNING
        VALUE(rt_objs)        TYPE ty_dependency_tt
      RAISING
        zcx_abapgit_exception.
ENDCLASS.

CLASS zcl_abapgit_where_used_tools IMPLEMENTATION.
  METHOD new.
    RETURN. " todo, implement method
  ENDMETHOD.

  METHOD select_external_usages.
    RETURN. " todo, implement method
  ENDMETHOD.

ENDCLASS.