/* ArrayLogic
 *
 * The ArrayLogic class contains common utility functions for manipulating arrays of 
 * primitive components - byte, short or int. 
 *
 * Author: simone
 * Creation date: 02/09/11
 */
MACHINE
    ArrayLogic

SEES
	javaLangClasses,
	JShort, 
	JByte

/*This class extends java.lang.Object */
EXTENDS
	Object

OPERATIONS
	value <-- arrayCopyRepack(src, srcOff, srcLen, dest, destOff) = 
	/* throws: NullPointerException, ArrayIndexOutOfBoundsException,
			TransactionException, UtilException */
	PRE
		/* src - source array object */
		/* NullPointerException if 'src' is null */
		src : seq1(OBJECT) & 
		
		/* srcOff - offset within source array to start copy from */
		/* ArrayIndexOutOfBoundsException if 'srcOff' is negative */
		srcOff : JSHORT &
		srcOff >= 0 & 
		
		/* ArrayIndexOutOfBoundsException if 'srcLen' is negative */
		/* ArrayIndexOutOfBoundsException if 'srcOff+srcLen' is greater than the length 
		of the 'src' */
		srcLen : JSHORT &
		srcLen >= 0 & 
		sum_short(srcOff, srcLen) <= size(src) & 
		
		/* dest - destination array object */
		/*NullPointerException if 'dest' is null*/
		dest : seq1(OBJECT) & 
		
		/* destOff - offset within destination array to start copy into */
		/*ArrayIndexOutOfBoundsException if 'destOff' is negative*/
		destOff : JSHORT &
		destOff >= 0 

		/* UtilException UtilException.ILLEGAL_VALUE if src or dest is not an array of 
		primitive components, or if the srcLen parameter is incorrect */
		/* ArrayIndexOutOfBoundsException - if copying would cause access of data outside 
		array bounds */
		/* TransactionException - if copying would cause the commit capacity to be exceeded */
		/* ArrayIndexOutOfBoundsException if 'offset' into the 'dest' array would become 
		greater than the length of the 'dest' array during the copy operation and no copy 
		is performed */
		
	THEN
		ANY arraylogic_value
		WHERE (arraylogic_value : JSHORT) &
		(arraylogic_value >= 0)
		THEN value := arraylogic_value
		END
	END;

/*--------------------------------------------------------------------------------------*/
	value <-- arrayCopyRepackNonAtomic(src, srcOff, srcLen, dest, destOff) = 
	/* throws: NullPointerException, ArrayIndexOutOfBoundsException,
			UtilException */
	PRE
		/* src - source array object */
		/* NullPointerException if 'src' is null */
		src : seq1(OBJECT) & 
		
		/* srcOff - offset within source array to start copy from */
		/* ArrayIndexOutOfBoundsException if 'srcOff' is negative */
		srcOff : JSHORT &
		srcOff >= 0 & 
		
		/* srcLen - number of source component values to be copied from the source array */
		/* ArrayIndexOutOfBoundsException if 'srcLen' is negative */
		/* ArrayIndexOutOfBoundsException if 'srcOff+srcLen' is greater than the length 
		of the 'src' */
		srcLen : JSHORT &
		srcLen >= 0 & 
		sum_short(srcOff, srcLen) <= size(src) & 
		
		/* dest - destination array object */
		/* NullPointerException if 'dest' is null */
		dest : seq1(OBJECT) & 
		
		/* destOff - offset within destination array to start copy into */
		/* ArrayIndexOutOfBoundsException if 'destOff' is negative */
		destOff : JSHORT &
		destOff >= 0 
		
		/* UtilException UtilException.ILLEGAL_VALUE if src or dest is not an array of 
		primitive components, or if the srcLen parameter is incorrect */
		/* ArrayIndexOutOfBoundsException - if copying would cause access of data outside 
		array bounds */
		/* TransactionException - if copying would cause the commit capacity to be exceeded */
		/* ArrayIndexOutOfBoundsException if 'offset' into the 'dest' array would become 
		greater than the length of the 'dest' array during the copy operation and no copy 
		is performed */
		
	THEN
		ANY arraylogic_value
		WHERE (arraylogic_value : JSHORT) &
		(arraylogic_value >= 0)
		THEN value := arraylogic_value
		END
	END;

/*--------------------------------------------------------------------------------------*/
	result <-- arrayFillGenericNonAtomic(theArray, off, len, valArray, valOff) = 
	/* throws: NullPointerException, ArrayIndexOutOfBoundsException,
			UtilException */
	PRE
		/* theArray - the array object */
		/*NullPointerException if 'theArray' is null */
		theArray : seq1(OBJECT) & 
		
		/* off - offset within array to start filling the specified value */
		/*ArrayIndexOutOfBoundsException if 'off' is negative*/
		off : JSHORT &
		off >= 0 & 
		
		/* len - the number of component values to be filled */
		/* ArrayIndexOutOfBoundsException if 'len' is negative */
		/* ArrayIndexOutOfBoundsException if 'off+len' is greater than the length 
		of the 'theArray' */
		len : JSHORT &
		len >= 0 & 
		sum_short(off, len) <= size(theArray) &
		
		/* valArray - the array object containing the fill value */
		/* NullPointerException if 'valArray' is null */
		valArray : seq1(OBJECT) & 
		
		/*  */
		/* ArrayIndexOutOfBoundsException if 'valOff' is negative */
		/* ArrayIndexOutOfBoundsException if 'valOff' is equal to or greater than the 
		length of the 'valArray' */
		valOff : JSHORT &
		valOff >= 0 &
		valOff < size(valArray) 

		/* UtilException.ILLEGAL_VALUE if 'theArray' or 'valArray' is not an array of 
		primitive components */
		/* UtilException.TYPE_MISMATCHED if the 'valArray' parameter is not an array of 
		the same primitive component type as the theArray */
		/* ArrayIndexOutOfBoundsException if the fill operation would cause access of data
		outside array bounds */
		
	THEN
		result := sum_short(off, len)
	END;

/*--------------------------------------------------------------------------------------*/
	result <-- arrayCompareGeneric(src, srcOff, dest, destOff, length) = 
	/* throws: NullPointerException, ArrayIndexOutOfBoundsException,
			UtilException */
	PRE
		/* src - source array object */
		/* NullPointerException if 'src'is null */
		src : seq1(OBJECT) & 
		
		/* srcOff - offset within source array to start compare */
		/* ArrayIndexOutOfBoundsException if 'srcOff' is negative */
		srcOff : JSHORT &
		srcOff >= 0 & 
		
		/* dest - destination array object */
		/* NullPointerException if 'dest' is null */
		dest : seq1(OBJECT) & 
		
		/* destOff - offset within destination array to start compare */
		/* ArrayIndexOutOfBoundsException if 'destOff' is negative */
		destOff : JSHORT &
		destOff >= 0 & 
		
		/* length - length to be compared */
		/* ArrayIndexOutOfBoundsException if 'length' is negative' */
		length : JSHORT &
		length >= 0 

		/* UtilException.ILLEGAL_VALUE if 'src' or 'dest' is not an array of primitive 
		components, or if the length parameter is incorrect */
		/* UtilException.TYPE_MISMATCHED if the 'dest' parameter is not an array of the 
		same primitive component type */
		
	THEN
		CHOICE
			result := cast_byte(0)
		OR
			result := cast_byte(-1)
		OR
			result := cast_byte(1)
		END
	END;

/*--------------------------------------------------------------------------------------*/
	value <-- arrayFindGeneric(theArray, off, valArray, valOff) = 
	/* throws: NullPointerException, ArrayIndexOutOfBoundsException,
			UtilException */
	PRE
		/* theArray - the array object to search */
		/* NullPointerException if 'theArray' is null */
		theArray : seq1(OBJECT) & 
		
		/* off - offset within the array to start serching for the specified value */
		/* ArrayIndexOutOfBoundsException if 'off' is negative */
		/* ArrayIndexOutOfBoundsException if 'off' is greater than the length of the 'theArray' */
		off : JSHORT &
		off >= 0 & 
		off <= size(theArray) & 
		
		/* valArray - the array object containing the search value */
		/* NullPointerException if 'valArray' is null */
		valArray : seq1(JBYTE) & 
		
		/* valOff - the offset within the valArray array containing the search value */
		/* ArrayIndexOutOfBoundsException if 'valOff' is negative */
		valOff : JSHORT &
		valOff >= 0
		
		/* UtilException.ILLEGAL_VALUE if 'theArray' is not an array of primitive components. */
	
	THEN
		ANY arraylogic_value
		WHERE (arraylogic_value : JSHORT) &
		(arraylogic_value >= -1)
		THEN value := arraylogic_value
		END
	END
END
