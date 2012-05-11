/* Util
 * Author: simone
 * Creation date: 05/06/11
 *
 * Extraído de LibsBSmart
 *
 */
MACHINE
    Util
    
/*ATENTION This class extends Object (java.lang.Object)*/
EXTENDS
	Object
    
SEES
	JShort,
	JByte
	/*apdu.APDU*/

OPERATIONS
	result <-- arrayCopy(src, srcOff, dest, destOff, length) =
	/* throws: ArrayIndexOutOfBoundsException
			NullPointerException
			TransactionException
			*/
	PRE
		/* src - source byte array */
		/*NullPointerException if 'src' is null*/
		src : seq1(JBYTE) &
		
		/* srcOff - offset within source byte array to start copy from */
		/*ArrayIndexOutOfBoundsException if 'srcOff' is negative*/
		srcOff : JSHORT &
		srcOff >= 0 &
		
		/* dest - destination byte array */
		/*NullPointerException if 'dest' is null*/
		dest : seq1(JBYTE) &
		
		/* destOff - offset within destination byte array to start copy into */
		/*ArrayIndexOutOfBoundsException if 'destOff' is negative*/
		destOff : JSHORT &
		destOff >= 0 &
		
		/* length - byte length to be copied */
		/*ArrayIndexOutOfBoundsException if 'length' is negative*/
		length : JSHORT &
		length >= 0 &
		
		/*ArrayIndexOutOfBoundsException if 'srcOff+length' is greater than the 
		length of the 'src'*/
		sum_short(srcOff, length) <= size(src) &
		
		/*ArrayIndexOutOfBoundsException if 'destOff+length' is greater than the 
		length of the 'dest'*/
		sum_short(destOff, length) <= size(dest) 
		
		/*ArrayIndexOutOfBoundsException if copying would cause access of data 
		outside array bounds*/
		/*TransactionException if copying would cause the commit capacity to be 
		exceeded*/
	THEN
		result := sum_short (destOff , length)
	END;

/*------------------------------------------------------------------------------*/	
	result <-- arrayCopyNonAtomic(src, srcOff, dest, destOff, length) =
	/* throws: ArrayIndexOutOfBoundsException
			NullPointerException
			*/
	PRE
		/* src - source byte array */
		/*NullPointerException if 'src' is null*/
		src : seq1(JBYTE) &
		
		/* srcOff - offset within source byte array to start copy from */
		/*ArrayIndexOutOfBoundsException if 'srcOff' is negative */
		srcOff : JSHORT &
		srcOff >= 0 &
		
		/* dest - destination byte array */
		/*NullPointerException if 'dest' is null*/
		dest : seq1(JBYTE) &
		
		/* destOff - offset within destination byte array to start copy into */
		/*ArrayIndexOutOfBoundsException if 'destOff' is negative*/
		destOff : JSHORT &
		destOff >= 0 &
		
		/* length - byte length to be copied */
		/*ArrayIndexOutOfBoundsException if 'length' is negative*/
		length : JSHORT &
		length >= 0 &
		
		/*ArrayIndexOutOfBoundsException if 'srcOff+length' is greater than the 
		length of the 'src'*/
		sum_short(srcOff, length) <= size(src) & 
		
		/*ArrayIndexOutOfBoundsException if 'destOff+length' is greater than the 
		length of the 'dest'*/
		sum_short(destOff, length) <= size(dest) 
		
		/*ArrayIndexOutOfBoundsException if copying would cause access of data outside array bount*/
	THEN
		result := sum_short (destOff , length)
	END;

/*------------------------------------------------------------------------------*/	
	result <-- arrayFillNonAtomic(bArray, bOff, bLen, bValue) =
	/* throws: ArrayIndexOutOfBoundsException
			NullPointerException
			*/
	PRE
		/* bArray - the byte array */
		/*NullPointerException if 'bArray' is null*/
		bArray : seq1(JBYTE) &
		
		/* bOff - offset within byte array to start filling bValue into */
		/*ArrayIndexOutOfBoundsException if 'bOff' is negative*/
		bOff : JSHORT &
		bOff >= 0 &
		
		/* bLen - byte length to be filled */
		/*ArrayIndexOutOfBoundsException if 'bLen' is negative*/
		bLen : JSHORT & 
		bLen >= 0 &
		
		/* bValue - the value to fill the byte array with */		
		bValue : JBYTE &
		
		/*ArrayIndexOutOfBoundsException if 'bOff+bLen' is greater than the 
		length of the 'bArray'*/
		sum_short(bOff, bLen) <= size(bArray)
		
		/*ArrayIndexOutOfBoundsException if the fill operation would cause access 
		of data outside array bounds*/
	THEN
		result := sum_short(bOff, bLen)
	END;

/*------------------------------------------------------------------------------*/	
	result <-- arrayCompare(src, srcOff, dest, destOff, length) =
	/* throws: ArrayIndexOutOfBoundsException
			NullPointerException
			*/
	PRE
		/* src - source byte array */
		/*NullPointerException if 'src' is null*/
		src : seq1(JBYTE) &
		
		/* srcOff - offset within source byte array to start compare */
		/*ArrayIndexOutOfBoundsException if 'srcOff' is negative*/
		srcOff : JSHORT &
		srcOff >= 0 &
		
		/* dest - destination byte array */
		/*NullPointerException if 'dest' is null*/
		dest : seq1(JBYTE) &
		
		/* destOff - offset within destination byte array to start compare */
		/*ArrayIndexOutOfBoundsException if 'destOff' is negative*/
		destOff : JSHORT &
		destOff >= 0 &
		
		/* length - byte length to be compared */
		/*ArrayIndexOutOfBoundsException if 'length' is negative*/
		length : JSHORT &
		length >= 0 &
		
		/*ArrayIndexOutOfBoundsException if 'srcOff+length' is greater than the 
		length of the 'src'*/
		sum_short(srcOff, length) <= size(src) &
		
		/*ArrayIndexOutOfBoundsException if 'destOff+length' is greater than the 
		length of the 'dest'*/
		sum_short(destOff, length) <= size(dest)
		
		/*ArrayIndexOutOfBoundsException if comparing all bytes would cause access 
		of data outside array bounds*/
	THEN
		CHOICE
			result := cast_short(0)
		OR
			result := cast_short(-1)
		OR
			result := cast_short(1)
		END	
	END;

/*------------------------------------------------------------------------------*/
	result <-- makeShort(b1, b2) =
	PRE
		/* b1 - the first byte ( high order byte ) */
		b1 : JBYTE &
		
		/* b2 - the second byte ( low order byte ) */
		b2 : JBYTE
		
	THEN
		result :: JSHORT
	END;

/*------------------------------------------------------------------------------*/	
	result <-- getShort(bArray, bOff) =
	/* throws: NullPointerException
			ArrayIndexOutOfBoundsException
			*/
	PRE
	
		/* bArray - byte array */
		/*NullPointerException if the 'bArray' is null*/
		bArray : seq1(JBYTE) &
		
		/* bOff - offset within byte array containing first byte (the high order 
		byte) */
		/*ArrayIndexOutOfBoundsException if the 'bOff' is negative*/
		bOff : JSHORT &
		bOff >= 0 &
		
		/*ArrayIndexOutOfBoundsException if 'bOff+2' is greater than the 
		length of 'bArray'*/
		sum_short(bOff, 2) <= size(bArray) 
	THEN
		result :: JSHORT
	END;

/*------------------------------------------------------------------------------*/	
	result <--  setShort(bArray, bOff, sValue) =
	/* throws: NullPointerException
			ArrayIndexOutOfBoundsException
			TransactionException
			*/
	PRE
	
		/* bArray - byte array */
		/*NullPointerException if the 'bArray' is null*/
		bArray : seq1(JBYTE) &
	
		/* bOff - offset within byte array to deposit the first byte (the high order 
		byte) */
		/*ArrayIndexOutOfBoundsException if the 'bOff'  is negative*/
		bOff : JSHORT & 
		bOff >= 0 &
		
		/* sValue - the short value to set into array. */
		sValue : JSHORT &
		
		/*ArrayIndexOutOfBoundsException if 'bOff+2' is greater than the length 
		of 'bArray'*/
		sum_short(bOff, 2) <= size(bArray)		
		
		
	THEN
		result := sum_short(bOff, 2)
	END
END
