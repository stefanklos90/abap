CLASS zcl_counter_test DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      counter_initial FOR TESTING RAISING cx_static_check,
      counter_after_one_increment FOR TESTING RAISING cx_static_check,
      counter_after_fifty_increment FOR TESTING RAISING cx_static_check,
      overflow FOR TESTING RAISING cx_static_check,
      decrement_initial_counter FOR TESTING RAISING cx_static_check,
      add_100_decrement_50 FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS zcl_counter_test IMPLEMENTATION.

  METHOD counter_initial.
    cl_abap_unit_assert=>assert_equals( act = NEW zcl_counter( )->get_counter( )
                                        exp = '0000000000000000' ).
  ENDMETHOD.

  METHOD counter_after_one_increment.
    DATA(lr_cut) = NEW zcl_counter( ).
    lr_cut->increment_by_one( ).
    cl_abap_unit_assert=>assert_equals( act = lr_cut->get_counter( )
                                        exp = '0000000000000001' ).
  ENDMETHOD.

  METHOD decrement_initial_counter.
    DATA(lr_cut) = NEW zcl_counter( ).
    lr_cut->decrement_by_one( ).
    cl_abap_unit_assert=>assert_equals( act = lr_cut->get_counter( )
                                        exp = '1111111111111111' ).
  ENDMETHOD.

  METHOD add_100_decrement_50.
    DATA(lr_cut) = NEW zcl_counter( ).
    DO 100 TIMES.
      lr_cut->increment_by_one( ).
    ENDDO.
    DO 50 TIMES.
      lr_cut->decrement_by_one( ).
    ENDDO.
    cl_abap_unit_assert=>assert_equals( act = lr_cut->get_counter( )
                                        exp = '0000000000110010' ).
  ENDMETHOD.

  METHOD counter_after_fifty_increment.
    DATA(lr_cut) = NEW zcl_counter( ).
    DO 50 TIMES.
      lr_cut->increment_by_one( ).
    ENDDO.
    cl_abap_unit_assert=>assert_equals( act = lr_cut->get_counter( )
                                        exp = '0000000000110010' ).

  ENDMETHOD.

  METHOD overflow.
    DATA(lr_cut) = NEW zcl_counter( ).
    DO 65586 TIMES.
      lr_cut->increment_by_one( ).
    ENDDO.
    cl_abap_unit_assert=>assert_equals( act = lr_cut->get_counter( )
                                        exp = '0000000000110010' ).
  ENDMETHOD.



ENDCLASS.