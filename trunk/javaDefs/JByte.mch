/* JByte
 * Author: BSmart project group
 * Creation date: 05/04/10
 * Models the byte data type in Java.
 * Not modeled: ...(to be completed)
 */
MACHINE
    JByte
    
CONSTANTS
    /* the byte type */
	JBYTE,
	
    /* byte type limits */
	MAXBYTE, 
	MINBYTE, 

	/* byte type operations */
	
	/* addition (+) */
	sum_byte,
	
	/* subtraction (-) */	
	subt_byte, 
	
	/* multiplication (*) */
	mult_byte, 
	
	/* division (/) */
	div_byte, 
	
	/* remainder (%) */
	mod_byte, 
	
	/* explicit cast into byte (cast) */
	cast_byte,
	
	/* equal to (==) */
	equal_byte,
	
	/* greater than (>) */
	gt_byte,
	
	/* greater than or equal to (>=) */
	gte_byte

PROPERTIES
    
    /*
	Type definition 
	*/
    MAXBYTE : INTEGER & MAXBYTE = 127 &
	MINBYTE : INTEGER & MINBYTE = -128 &
	JBYTE =   MINBYTE .. MAXBYTE &
	
	/*
	Description of byte operations
	*/

	
	/*  Addition (+)
		An overflow situation returns a non-specified short value  */
    sum_byte : JBYTE * JBYTE --> JBYTE & 
    sum_byte = % ( n1 , n2 ) . ( 
        n1 : JBYTE & n2 : JBYTE & ( n1 + n2 ) : JBYTE | n1 + n2 )
  
    &

    /*  Subtraction (-) 
		An overflow situation returns a non-specified short value  */
    subt_byte : JBYTE * JBYTE --> JBYTE & 
    subt_byte = % ( n1 , n2 ) . ( 
        n1 : JBYTE & n2 : JBYTE & ( n1 - n2 ) : JBYTE | n1 - n2 )
    &

    /*  Multiplication (*) 
		An overflow situation returns a non-specified short value  */
    mult_byte : JBYTE * JBYTE --> JBYTE & 
    mult_byte = % ( n1 , n2 ) . ( 
        n1 : JBYTE & n2 : JBYTE & ( n1 * n2 ) : JBYTE | n1 * n2 )
    &

    /*  Division (/) 
      	A division by zero raises an exception in Java.
       	A division which is not exact is rounded down (in B and Java).
       	There is no overflow situation.
    */
    div_byte : JBYTE * (JBYTE - {0}) --> JBYTE & 
    div_byte = % ( n1 , n2 ) . ( 
        n1 : JBYTE & n2 : JBYTE & not ( n2 = 0 ) | n1 / n2 )
    &

	/*  Remainder (% in Java, mod in B - only for natural numbers) 
       	A division by zero raises an exception in Java.
       	There is no overflow situation.
	*/
    mod_byte :  JBYTE * (JBYTE - {0}) --> JBYTE &
    mod_byte = % ( n1 , n2 ) . ( 
        n1 : JBYTE & n2 : JBYTE & n2 /= 0 | n1 - n2 * (n1/n2) )

	&

	/*  Casts an integer into byte (cast)
	*/
    cast_byte :  INTEGER --> JBYTE & 
		! (s1) . ( s1 : INTEGER => 
			       		(s1 = 0 => cast_byte (s1) = 0) & 
				   		(s1 > 0 => cast_byte (s1) = s1 mod MAXBYTE) &
				   		(s1 < 0 => cast_byte (s1) = -(-s1 mod -MINBYTE)) 
                  )
	&
	
	/* Checks whether 2 bytes are equal to each other (==) 
	*/
	equal_byte :
   		JBYTE * JBYTE --> BOOL &
    	! ( s1 , s2 ) . ( s1 : JBYTE & s2 : JBYTE =>
        ( ( s1 = s2 )   => equal_byte ( s1 |-> s2 ) = TRUE ) &
        ( ( s1 /= s2 )  => equal_byte ( s1 |-> s2 ) = FALSE ) )
  
  	&
  
	/* Checks whether the first byte is greater than the second (>) 
	*/
    gt_byte :
    	JBYTE * JBYTE --> BOOL &
    	! ( s1 , s2 ) . (  s1 : JBYTE  &  s2 : JBYTE =>
        ( ( s1 > s2 ) => gt_byte ( s1 |-> s2 ) = TRUE ) &
        ( ( s1 <= s2 ) => gt_byte ( s1 |-> s2 ) = FALSE ) )
    
    &
    
	/* Checks whether the first byte is greater than or equal to the second (>) 
	*/
    gte_byte:
    	JBYTE * JBYTE --> BOOL &
    	! ( s1 , s2 ) . ( s1 : JBYTE & s2 : JBYTE =>
        ( ( s1 >= s2) => gte_byte ( s1 |-> s2 ) = TRUE ) &
        (  ( s1 < s2 ) => gte_byte ( s1 |-> s2 ) = FALSE ) )

END
