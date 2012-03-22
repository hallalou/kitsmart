/* JInt 
 * Author: BSmart project group.
 * Creation date: ter abr 7 2009
 * Models the integer data type in Java.
 * Not modeled: ...(to be completed)
 */
MACHINE
    JInt
   
CONCRETE_CONSTANTS
    
    /* the integer data type */
    JINT,
    
    /* the integer data type limits */
	MAXJINT, 
	MINJINT, 
	
	/* integer type operations */
	
    /* addition (+) */
    sum_jint, 
    
    /* subtraction (-) */
    subt_jint, 
    
	/* multiplication (*) */
    mult_jint, 
    
	/* division (/) */
    div_jint, 
    
	/* remainder (%) */
    mod_jint, 
    
	/* equal to (==) */
    equal_jint, 
    
	/* greater than (>) */
    gt_jint, 
    
	/* greater than or equal (>=) */
    gte_jint

PROPERTIES
    	MAXJINT : INT &
		MAXJINT = 2147483647 &
    	MINJINT : INT &
		MINJINT = - 2147483647 &	

		JINT = MINJINT .. MAXJINT &


        sum_jint : JINT * JINT +-> JINT &
        sum_jint = % ( a1 , a2 ) . ( a1 : JINT & a2 : JINT & ( a1 + a2 ) : JINT | a1 + a2 ) &

        subt_jint : JINT * JINT +-> JINT &
        subt_jint = % ( a1 , a2 ) . ( a1 : JINT & a2 : JINT & ( a1 - a2 ) : JINT | a1 - a2 ) &

        mult_jint : JINT * JINT +-> JINT &
        mult_jint = % ( a1 , a2 ) . ( a1 : JINT & a2 : JINT & ( a1 * a2 ) : JINT | a1 * a2 ) &

        div_jint : JINT * JINT +-> JINT &
        div_jint = % ( a1 , a2 ) . ( a1 : JINT & a2 : JINT & not ( a2 = 0 ) & ( a1 / a2 ) : JINT | a1 / a2 ) &

        mod_jint :  JINT * JINT +-> JINT &
        mod_jint = % ( a1 , a2 ) . ( a1 : JINT & a1 >= 0 & a2 : JINT & a2 > 0 & ( a1 mod a2 ) : JINT | a1 mod a2 ) &
        
       	equal_jint :
    	JINT * JINT +-> BOOL &
    	! ( s1 , s2 ) . ( s1 : JINT & s2 : JINT & (s1 |-> s2) : dom (equal_jint) =>
        ( ( s1 = s2 )   => equal_jint ( s1 |-> s2 ) = TRUE ) &
        ( ( s1 /= s2 )  => equal_jint ( s1 |-> s2 ) = FALSE ) )
  
  		&
  
    	gt_jint :
    	JINT * JINT +-> BOOL &
    	! ( s1 , s2 ) . (  s1 : JINT  &  s2 : JINT  & (s1 |-> s2) : dom (gt_jint) =>
        ( ( s1 > s2 ) => gt_jint ( s1 |-> s2 ) = TRUE ) &
        ( ( s1 <= s2 ) => gt_jint ( s1 |-> s2 ) = FALSE ) )
    
    	&
    
    	gte_jint :
    	JINT * JINT +-> BOOL &
    	! ( s1 , s2 ) . ( s1 : JINT & s2 : JINT & (s1 |-> s2) : dom (gte_jint) =>
        ( ( s1 >= s2) => gte_jint ( s1 |-> s2 ) = TRUE ) &
        (  ( s1 < s2 ) => gte_jint ( s1 |-> s2 ) = FALSE ) )

END
