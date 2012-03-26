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
	result <-- arrayCopy(src, srcOff, dest, destOff, length) = /*ArrayIndexOutOfBoundsException, NullPointerException, TransactionException*/
	PRE
		src : seq1(JBYTE) & /*NullPointerException if 'src' is null*/
		srcOff : JSHORT &
		srcOff >= 0 & /*ArrayIndexOutOfBoundsException if 'srcOff' is negative*/
		dest : seq1(JBYTE) & /*NullPointerException if 'dest' is null*/
		destOff : JSHORT &
		destOff >= 0 & /*ArrayIndexOutOfBoundsException if 'destOff' is negative*/
		length : JSHORT &
		length >= 0 & /*ArrayIndexOutOfBoundsException if 'length' is negative*/
		sum_short(srcOff, length) <= size(src) & /*ArrayIndexOutOfBoundsException if 'srcOff+length' is greater than the length of the 'src'*/
		sum_short(destOff, length) <= size(dest) /*ArrayIndexOutOfBoundsException if 'destOff+length' is greater than the length of the 'dest'*/
		
		/*ArrayIndexOutOfBoundsException if copying would cause access of data outside array bounds*/
		/*TransactionException if copying would cause the commit capacity to be exceeded*/
	THEN
		result := sum_short (destOff , length)
	END;
	
	result <-- arrayCopyNonAtomic(src, srcOff, dest, destOff, length) = /*ArrayIndexOutOfBoundsException, NullPointerException*/
	PRE
		src : seq1(JBYTE) & /*NullPointerException if 'src' is null*/
		srcOff : JSHORT &
		srcOff >= 0 & /*ArrayIndexOutOfBoundsException if 'srcOff' is negative */
		dest : seq1(JBYTE) & /*NullPointerException if 'dest' is null*/
		destOff : JSHORT &
		destOff >= 0 & /*ArrayIndexOutOfBoundsException if 'destOff' is negative*/
		length : JSHORT &
		length >= 0 & /*ArrayIndexOutOfBoundsException if 'length' is negative*/
		sum_short(srcOff, length) <= size(src) & /*ArrayIndexOutOfBoundsException if 'srcOff+length' is greater than the length of the 'src'*/
		sum_short(destOff, length) <= size(dest) /*ArrayIndexOutOfBoundsException if 'destOff+length' is greater than the length of the 'dest'*/
		
		/*ArrayIndexOutOfBoundsException if copying would cause access of data outside array bount*/
	THEN
		result := sum_short (destOff , length)
	END;
			   
	result <-- arrayFillNonAtomic(bArray, bOff, bLen, bValue) = /*ArrayIndexOutOfBoundsException, NullPointerException*/
	PRE
		bArray : seq1(JBYTE) & /*NullPointerException if 'bArray' is null*/
		bOff : JSHORT &
		bOff >= 0 & /*ArrayIndexOutOfBoundsException if 'bOff' is negative*/
		bLen : JSHORT & 
		bLen >= 0 & /*ArrayIndexOutOfBoundsException if 'bLen' is negative*/
		bValue : JBYTE &
		sum_short(bOff, bLen) <= size(bArray) /*ArrayIndexOutOfBoundsException if 'bOff+bLen' is greater than the length of the 'bArray'*/
		
		/*ArrayIndexOutOfBoundsException if the fill operation would cause access of data outside array bounds*/
	THEN
		result := sum_short(bOff, bLen)
	END;
	
	result <-- arrayCompare(src, srcOff, dest, destOff, length) = /*ArrayIndexOutOfBoundsException, NullPointerException*/
	PRE
		src : seq1(JBYTE) & /*NullPointerException if 'src' is null*/
		srcOff : JSHORT &
		srcOff >= 0 & /*ArrayIndexOutOfBoundsException if 'srcOff' is negative*/
		dest : seq1(JBYTE) & /*NullPointerException if 'dest' is null*/
		destOff : JSHORT &
		destOff >= 0 & /*ArrayIndexOutOfBoundsException if 'destOff' is negative*/
		length : JSHORT &
		length >= 0 & /*ArrayIndexOutOfBoundsException if 'length' is negative*/
		sum_short(srcOff, length) <= size(src) & /*ArrayIndexOutOfBoundsException if 'srcOff+length' is greater than the length of the 'src'*/
		sum_short(destOff, length) <= size(dest) /*ArrayIndexOutOfBoundsException if 'destOff+length' is greater than the length of the 'dest'*/
		
		/*ArrayIndexOutOfBoundsException if comparing all bytes would cause access of data outside array bounds*/
	THEN
		CHOICE
			result := cast_short(0)
		OR
			result := cast_short(-1)
		OR
			result := cast_short(1)
		END	
	END;

	result <-- makeShort(b1, b2) =
	PRE
		b1 : JBYTE & 
		b2 : JBYTE
	THEN
		result :: JSHORT
	END;
	
	result <-- getShort(bArray, bOff) = /*NullPointerException, ArrayIndexOutOfBoundsException*/
	PRE
		bArray : seq1(JBYTE) & /*NullPointerException if the 'bArray' is null*/
		bOff : JSHORT &
		bOff >= 0 & /*ArrayIndexOutOfBoundsException if the 'bOff' is negative*/
		sum_short(bOff, 2) <= size(bArray) /*ArrayIndexOutOfBoundsException if 'bOff+2' is greater than the length of 'bArray'*/
	THEN
		result :: JSHORT
	END;
	
	result <--  setShort(bArray, bOff, sValue) = /*NullPointerException, ArrayIndexOutOfBoundsException, TransactionException*/
	PRE
		bArray : seq1(JBYTE) & /*NullPointerException if the 'bArray' is null*/
		bOff : JSHORT & 
		bOff >= 0 & /*ArrayIndexOutOfBoundsException if the 'bOff'  is negative*/
		sum_short(bOff, 2) <= size(bArray) & /*ArrayIndexOutOfBoundsException if 'bOff+2' is greater than the length of 'bArray'*/
		sValue : JSHORT
	THEN
		result := sum_short(bOff, 2)
	END
END
