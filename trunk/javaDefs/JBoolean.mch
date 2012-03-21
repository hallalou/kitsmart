/*
Developed by the BSmart project group. Models the Java boolean type.
Not modeled: == , != , ?: 
*/
MACHINE
    JBoolean

CONCRETE_CONSTANTS
    /* the boolean type */
    JBOOLEAN ,
    /* Short-circuit OR (||) */
    or_boolean ,
    /* Logical OR (|) */
    lor_boolean ,
    /* Short-circuit AND (&&) */
        and_boolean ,
    /* Logical AND (&) */
    land_boolean ,
    /* Logical NOT (!) */
    lnot_boolean ,
    /* Logical XOR (^) */
        lxor_boolean

PROPERTIES
        JBOOLEAN = BOOL &

    /* Logical OR. Both expressions are always evaluated. */
        lor_boolean = { ( TRUE , TRUE ) |-> TRUE ,
                                        ( TRUE , FALSE ) |-> TRUE ,
                                        ( FALSE , TRUE ) |-> TRUE ,
                                        ( FALSE , FALSE ) |-> FALSE } &

    /* Logical AND. Both expressions are always evaluated. */
    land_boolean = { ( TRUE , TRUE ) |-> TRUE ,
                                        ( TRUE , FALSE ) |-> FALSE ,
                                        ( FALSE , TRUE ) |-> FALSE ,
                                        ( FALSE , FALSE ) |-> FALSE } &

    /* Logical Negation. */
    lnot_boolean = { TRUE |-> FALSE ,
                                 FALSE |-> TRUE } &

    /* Logical exclusive OR. Both expressions are always evaluated. */
    lxor_boolean = { ( TRUE , TRUE ) |-> FALSE ,
                                        ( TRUE , FALSE ) |-> TRUE ,
                                        ( FALSE , TRUE ) |-> TRUE ,
                                        ( FALSE , FALSE ) |-> FALSE } &


    /* Short-circuit OR operation. 
   	   If the first expression is TRUE, the second one is not evaluated. */
    or_boolean : JBOOLEAN * JBOOLEAN --> JBOOLEAN &
            ! ( b1 , b2 ) . ( b1 : JBOOLEAN & b2 : JBOOLEAN & b1 = TRUE =>
                or_boolean ( b1 |-> b2 ) = TRUE ) &
        ! ( b1 , b2 ) . ( b1 : JBOOLEAN & b2 : JBOOLEAN & b1 = FALSE & b2 = TRUE =>
            or_boolean ( b1 |-> b2 ) = TRUE ) &
        ! ( b1 , b2 ) . ( b1 : JBOOLEAN & b2 : JBOOLEAN & b1 = FALSE & b2 = FALSE =>
            or_boolean ( b1 |-> b2 ) = FALSE ) &


        /* Short-circuit AND operation. 
	   If the first expression is FALSE, the second one is not evaluated. */
        and_boolean : JBOOLEAN * JBOOLEAN --> JBOOLEAN &
           ! ( b1 , b2 ) . ( b1 : JBOOLEAN & b2 : JBOOLEAN & b1 = FALSE =>
                           and_boolean ( b1 |-> b2 ) = FALSE ) &
           ! ( b1 , b2 ) . ( b1 : JBOOLEAN & b2 : JBOOLEAN & b1 = TRUE & b2 = FALSE =>
               and_boolean ( b1 |-> b2 ) = FALSE ) &
           ! ( b1 , b2 ) . ( b1 : JBOOLEAN & b2 : JBOOLEAN & b1 = TRUE & b2 = TRUE =>
               and_boolean ( b1 |-> b2 ) = TRUE )


END
