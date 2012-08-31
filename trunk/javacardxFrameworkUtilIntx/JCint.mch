/* JCint
 * Author: bruno
 * Creation date: 01/09/11
 */
MACHINE
    JCint

SEES
	JByte, 
	JShort, 
	JInt,  /* maybe change to JCInt ? */
	JCSystem

CONSTANTS
	MAKEARRAYINT
	
PROPERTIES
	MAKEARRAYINT : seq(JINT)
	
/*This class extends java.lang.Object */
EXTENDS
   obj.Object

OPERATIONS

/*Concatenates the four parameter bytes to form an int value.*/
	result <-- makeInt_1(b1, b2, b3, b4) =
	PRE
		/* b1 - the first byte ( high order byte ) */
		b1 : JBYTE & 
		
		/* b2 - the second byte */
		b2 : JBYTE & 
		
		/* b3 - the third byte */
		b3 : JBYTE & 
		
		/* b4 - the fourth byte ( low order byte ) */
		b4 : JBYTE 
		
	THEN
		result :: JINT
	END;

/*-------------------------------------------------------------------------------------*/
/*Concatenates the two parameter short values to form an int value.*/
	result <-- makeInt_2(s1, s2) = 
	PRE
		/* s1 - the first short value ( high order short value ) */
		s1 : JSHORT & 
		
		/* s2 - the second short value ( low order short value ) */
		s2 : JSHORT 
		
	THEN 
		result :: JINT
	END;

/*-------------------------------------------------------------------------------------*/
/* Concatenates four bytes in a byte array to form a int value. */
	result <-- getInt(bArray, bOff) =
	PRE
		/* bArray - byte array */
		/* NullPointerException if the 'bArray' parameter is null */
		bArray : seq1(JBYTE) &  
		
		/* bOff - offset within byte array containing first byte (the high order byte) */
		/* ArrayIndexOutOfBoundsException if the bOff parameter is negative or if bOff+4 is 
		greater than the length of bArray */
		bOff   : JSHORT &
		bOff >= 0 & 
		sum_short(bOff, 4) <= size(bArray)
		
	THEN 
		result :: JINT
	END;
 
 /*-------------------------------------------------------------------------------------*/
/*Deposits the int value as four successive bytes at the specified offset in the byte array.*/
	result <-- setInt(bArray, bOff, iValue) = 
	PRE 
		/* bArray - byte array */
		/* NullPointerException if the bArray parameter is null */
		bArray : seq1(JBYTE) & 
		
		/* bOff - offset within byte array to deposit the first byte (the high order byte) */
		bOff   : JSHORT &
		bOff >= 0 & 
		/* ArrayIndexOutOfBoundsException if the bOff parameter is negative or if bOff+4 
		is greater than the length of bArray */
		sum_short(bOff, 4) <= size(bArray) & 
		
		/* iValue - the short value to set into array. */
		iValue : JINT
				
		/* TransactionException if the operation would cause the commit capacity to be 
		exceeded */
		
	THEN
	 	result := sum_short(bOff, 4)
	END;

/*-------------------------------------------------------------------------------------*/
/*Creates a transient int array with the specified array length.*/
	result <-- makeTransientIntArray(length, event) = 
	PRE 
		/* length - the length of the int array */
		length : JSHORT & 		
		length >= 0 & /*NegativeArraySizeException if the length parameter is negative*/ 
		
		/* event - the CLEAR_ON... event which causes the array elements to be cleared */
		/* SystemException.ILLEGAL_VALUE if event is not a valid event code. */
		event : JBYTE & 
		(event = CLEAR_ON_RESET or 
		 event = CLEAR_ON_DESELECT)
		 
		
		/* SystemException.NO_TRANSIENT_SPACE if sufficient transient space is not available. */
		/* SystemException.ILLEGAL_TRANSIENT if the current applet context is not the 
		currently selected applet context and CLEAR_ON_DESELECT is specified. */ 
		
	THEN
	 	result :: MAKEARRAYINT
	END
END
