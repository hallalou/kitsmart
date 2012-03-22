
/* Int32
 * Author: BSmart project group
 * Creation date: qua abr 29 2009
 * Models 32 bit integers. Intended as auxiliary to model Java integers.
 * Not modeled: ...(to be completed)
 */
MACHINE
    Int32


CONCRETE_CONSTANTS
    /* the data type */
    INT32 ,

    /* the data type limits */
    MININT32 , MAXINT32 ,

    /* the operations */

    /* addition */
    sum_int32 ,

    /* subtraction */
    subt_int32 ,

    /* multiplication */
    mult_int32 ,

    /* integer division */
    div_int32 ,

    /* remainder */
    mod_int32


PROPERTIES

    /* type definition */

    MININT32 : INTEGER & MININT32 = - 2147483647 &
    MAXINT32 : INTEGER & MAXINT32 = 2147483647 &

    INT32 = MININT32 .. MAXINT32  &

    /*
	Description of INT32 operations
	*/

    /* Addition    
	   An overflow situation returns a non-specified INT32 value  */
    sum_int32 : INT32 * INT32 --> INT32 &
    sum_int32 = % ( a1 , a2 ) . ( a1 : INT32 & a2 : INT32 & ( a1 + a2 ) : INT32 | a1 + a2 ) &

    /* Subtraction   
	   An overflow situation returns a non-specified INT32 value  */
    subt_int32 : INT32 * INT32 --> INT32 &
    subt_int32 = % ( a1 , a2 ) . ( a1 : INT32 & a2 : INT32 & ( a1 - a2 ) : INT32 | a1 - a2 ) &

    /* Multiplication  
	   An overflow situation returns a non-specified INT32 value  */
        mult_int32 : INT32 * INT32 --> INT32 &
        mult_int32 = % ( a1 , a2 ) . ( a1 : INT32 & a2 : INT32 & ( a1 * a2 ) : INT32 | a1 * a2 ) &

        /* Integer division.  
	   A division by zero is undefined.
       A division which is not exact is rounded down (towards zero).
       There is no overflow situation.
    */
    div_int32 : INT32 * ( INT32 - { 0 } ) --> INT32 &
    div_int32 = % ( a1 , a2 ) .
    ( a1 : INT32 & a2 : INT32 & not ( a2 = 0 ) | a1 / a2 ) &

    /*  Remainder.
       	A division by zero is undefined.
       	There is no overflow situation.
	*/

        mod_int32 :  INT32 * ( INT32 - { 0 } ) --> INT32 &
        mod_int32 = % ( a1 , a2 ) . (
            a1 : INT32 & a2 : INT32 & a2 /= 0 | a1 - a2 * ( a1 / a2 ) )


END
