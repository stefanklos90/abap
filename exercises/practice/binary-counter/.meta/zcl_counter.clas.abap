CLASS zcl_counter DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.

    METHODS increment_by_one.
    METHODS decrement_by_one.

    METHODS get_counter
      RETURNING VALUE(rv_result) TYPE string.

  PRIVATE SECTION.
    DATA mv_counter TYPE x LENGTH 2 VALUE '0000'.
ENDCLASS.

CLASS zcl_counter IMPLEMENTATION.

  METHOD increment_by_one.
    mv_counter = mv_counter + 1 .
  ENDMETHOD.

  METHOD decrement_by_one.
    mv_counter = mv_counter - 1.
  ENDMETHOD.

  METHOD get_counter.
    DO 16 TIMES.
      GET BIT sy-index OF mv_counter INTO DATA(lv_bit).
      IF lv_bit = 1.
        rv_result = rv_result && '1'.
      ELSE.
        rv_result = rv_result && '0'.
      ENDIF.
    ENDDO.
  ENDMETHOD.

ENDCLASS.
