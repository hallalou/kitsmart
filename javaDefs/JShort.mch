/* JShort 
 * Author: BSmart project group.
 * Creation date: 05/04/10
 * Models the Short data type in Java.
 * Not modeled: ...(to be completed)
 */
MACHINE
    JShort

CONCRETE_CONSTANTS
    /* the short type */
    JSHORT ,

    /* short type limits */
        MAXSHORT , MINSHORT ,

        /* short type operations */

        /* addition (+) */
        sum_short ,
        /* subtraction (-) */
        subt_short ,
        /* multiplication (*) */
        mult_short ,
        /* division (/) */
        div_short ,
        /* remainder (%) */
        mod_short ,
        /* explicit cast into short (cast) */
        cast_short ,
        /* equal to (==) */
        equal_short ,
        /* greater than (>) */
        gt_short ,
        /* greater than or equal (>=) */
        gte_short


PROPERTIES

        /*
	Type definition 
	*/

        MAXSHORT : INTEGER & MAXSHORT = 32767 &
        MINSHORT : INTEGER & MINSHORT = - 32768 &
        JSHORT = MINSHORT .. MAXSHORT &

        /*
	Description of short operations
	*/

                /*  Addition (+)
			An overflow situation returns a non-specified short value  */
        sum_short : JSHORT * JSHORT --> JSHORT &
        sum_short = % ( n1 , n2 ) . ( n1 : JSHORT & n2 : JSHORT & n1 + n2 : JSHORT | n1 + n2 )
        &

        /*  Subtraction (-) 
			An overflow situation returns a non-specified short value  */
        subt_short : JSHORT * JSHORT --> JSHORT &
        subt_short = % ( n1 , n2 ) . ( n1 : JSHORT & n2 : JSHORT &         n1 - n2  : JSHORT | n1 - n2 )
        &

        /*  Multiplication (*) 
			An overflow situation returns a non-specified short value  */
        mult_short : JSHORT * JSHORT --> JSHORT &
        mult_short = % ( n1 , n2 ) . ( n1 : JSHORT & n2 : JSHORT & n1 * n2 : JSHORT | n1 * n2 )
        &

        /*  Division (/) 
        	A division by zero raises an exception in Java.
        	A division which is not exact is rounded down (in B and Java).
        	There is no overflow situation.
        	*/
        div_short : JSHORT * ( JSHORT - { 0 } ) --> JSHORT &
        div_short = % ( n1 , n2 ) . (
            n1 : JSHORT & n2 : JSHORT & not ( n2 = 0 ) | n1 / n2 )
        &

                /*  Remainder (% in Java, mod in B - only for natural numbers) 
        	A division by zero raises an exception in Java.
        	There is no overflow situation.
		*/
                mod_short :  JSHORT * ( JSHORT - { 0 } ) --> JSHORT &
                mod_short = % ( n1 , n2 ) . (
                    n1 : JSHORT & n2 : JSHORT & n2 /= 0 | n1 - n2 * ( n1 / n2 ) )

                &


                /*  Casts an integer into short (cast)
		*/
                cast_short : INTEGER --> JSHORT &
                ! ( s1 ) . ( s1 : INTEGER  =>
                        ( s1 = 0 => cast_short ( s1 ) = 0 ) &
                        ( s1 > 0 => cast_short ( s1 ) = s1 mod 32767 ) &
                        ( s1 < 0 => cast_short ( s1 ) = - ( - s1 mod 32767 ) )
                ) &

                /* Checks whether 2 shorts are equal to each other (==) 
		*/
                equal_short :
            JSHORT * JSHORT --> BOOL &
            ! ( s1 , s2 ) . ( s1 : JSHORT & s2 : JSHORT  =>
        ( ( s1 = s2 )   => equal_short ( s1 |-> s2 ) = TRUE ) &
        ( ( s1 /= s2 )  => equal_short ( s1 |-> s2 ) = FALSE ) )

                  &

                /* Checks whether the first short is greater than the second (>) 
		*/
            gt_short :
            JSHORT * JSHORT --> BOOL &
            ! ( s1 , s2 ) . (  s1 : JSHORT  &  s2 : JSHORT =>
        ( ( s1 > s2 ) => gt_short ( s1 |-> s2 ) = TRUE ) &
        ( ( s1 <= s2 ) => gt_short ( s1 |-> s2 ) = FALSE ) )

            &

                /* Checks whether the first short is greater than or equal to the 		         *  second (>) 
		*/
            gte_short :
            JSHORT * JSHORT --> BOOL &
            ! ( s1 , s2 ) . ( s1 : JSHORT & s2 : JSHORT =>
        ( ( s1 >= s2 ) => gte_short ( s1 |-> s2 ) = TRUE ) &
        ( ( s1 < s2 ) => gte_short ( s1 |-> s2 ) = FALSE ) )


ASSERTIONS
    JSHORT * JSHORT = dom ( sum_short )

END
