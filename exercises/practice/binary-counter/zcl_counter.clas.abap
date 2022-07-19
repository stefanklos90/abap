CLASS zcl_counter DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.

    METHODS increment_by_one.
    METHODS decrement_by_one.

    METHODS get_counter
      RETURNING VALUE(rv_result) TYPE string.

  PRIVATE SECTION.

ENDCLASS.

CLASS zcl_counter IMPLEMENTATION.

  METHOD increment_by_one.
	"Implement me!
  ENDMETHOD.

  METHOD decrement_by_one.
	"Implement me!
  ENDMETHOD.

  METHOD get_counter.
	"Implement me!
  ENDMETHOD.

ENDCLASS.
