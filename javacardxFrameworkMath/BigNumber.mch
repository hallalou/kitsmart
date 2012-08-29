/* BigNumber
 * Author: simone
 * Creation date: 01/09/11
 */
MACHINE
    BigNumber

SEES
	javacardxFrameworkMathClasses,
	JByte,
	JShort

/*This class extends java.lang.Object */
EXTENDS
	Object

CONSTANTS

 FORMAT_BCD,
 FORMAT_HEX

PROPERTIES
	FORMAT_BCD : JSHORT &
	FORMAT_BCD = 1 &
	
	FORMAT_HEX : JSHORT &
	FORMAT_HEX = 2

OPERATIONS
	C_BigNumber(maxBytes) =
	/* throws: ArithmeticException */
	PRE
		/* maxBytes - maximum number of bytes needed in the hexadecimal format for the largest 
		unsigned big number. For example, maxBytes = 2 allows a big number representation 
		range 0-65535. */
		/* ArithmeticException if 'maxBytes' is 0, negative or larger than the supported maximum */
		maxBytes : JSHORT &
		maxBytes > 0
		
	THEN
		skip
	END;

/*-------------------------------------------------------------------------------------------*/
	setMaximum(maxValue, bOff, bLen, arrayFormat) =
	/* throws: NullPointerException,
			ArrayIndexOutOfBoundsException,
			ArithmeticException */
	PRE
		/* maxValue - input byte array */
		/* NullPointerException if 'maxValue' is null */
		maxValue : seq1(JBYTE) & 
		
		/* bOff - offset within input byte array containing first byte (the high order byte) */
		bOff : JSHORT &
		bOff >= 0 &
		
		/* bLen - byte length of input data */
		/* ArrayIndexOutOfBoundsException if 'bLen' is negative and 
		ArithmeticException if 'bLen' is 0 */
		bLen : JSHORT &
		bLen > 0 & 
		
		/* arrayFormat - indicates the format of the input data. Valid codes listed in FORMAT_* constants. */
		/* ArithmeticException if 'arrayFormat' is not one of the FORMAT_ constants */
		arrayFormat : JBYTE &
		(arrayFormat = FORMAT_BCD or
		arrayFormat = FORMAT_HEX) 

		/* ArrayIndexOutOfBoundsException if accessing the input array would cause access of 
		data outside array bounds */
		/* ArithmeticException if the specified maximum value is smaller than the encapsulated 
		big number or if the specified maximum value is larger than will fit within the 
		supported maximum number of bytes or if the input byte array format is not conformant 
		with the specified arrayFormat parameter */
		
	THEN
		skip
	END;

/*-------------------------------------------------------------------------------------------*/
	maxBytes <-- getMaxBytesSupported = 
		ANY bignumber_maxBytes
		WHERE (bignumber_maxBytes : JSHORT) &
		(bignumber_maxBytes >= 0)
		THEN maxBytes := bignumber_maxBytes
		END;

/*-------------------------------------------------------------------------------------------*/
	init(bArray, bOff, bLen, arrayFormat) = 
	/* throws: NullPointerException,
			ArrayIndexOutOfBoundsException,
			ArithmeticException */
	PRE
		/* bArray - input byte array */
		/* NullPointerException if 'bArray' is null */ 
		bArray : seq1(JBYTE) & 
		
		/* bOff - offset within byte array containing first byte (the high order byte) */
		bOff : JSHORT &
		bOff >= 0 &
		
		/* bLen - byte length of input data */
		/*ArrayIndexOutOfBoundsException if 'bLen' is negative and 
		ArithmeticException if 'bLen' is 0 */
		bLen : JSHORT & 
		
		/* arrayFormat - indicates the format of the input data. Valid codes listed in 
		FORMAT_* constants */
		/*ArithmeticException if 'arrayFormat' is not one of the FORMAT_ constants*/
		arrayFormat : JBYTE &
		(arrayFormat = FORMAT_BCD or
		arrayFormat = FORMAT_HEX) 

		/* ArrayIndexOutOfBoundsException - if accessing the input array would cause access 
		outside array bounds */
		/* ArithmeticException if the input byte array format is not conformant with the 
		specified arrayFormat parameter or if the specified input data represents a number 
		which is larger than the maximum value configured or larger than will fit within the 
		supported maximum number of bytes */
		
	THEN
		skip
	END;

/*-------------------------------------------------------------------------------------------*/
	add(bArray, bOff, bLen, arrayFormat) = 
	/* throws: NullPointerException,
			ArrayIndexOutOfBoundsException,
			ArithmeticException */
	PRE
		/* bArray - input byte array */
		/*NullPointerException if 'bArray' is null*/
		bArray : seq1(JBYTE) &  
		
		/* bOff - offset within input byte array containing first byte (the high order byte) */
		bOff : JSHORT &
		bOff >= 0 &
		
		/* bLen - byte length of input data */
		/*ArrayIndexOutOfBoundsException if 'bLen' is negative and 
		ArithmeticException if 'bLen' is 0 */	
		bLen : JSHORT & 
		bLen > 0 & 
		
		/* arrayFormat - indicates the format of the input data. Valid codes listed in 
		FORMAT_* constants. */
		/*ArithmeticException if 'arrayFormat' is not one of the FORMAT_ constants*/
		arrayFormat : JBYTE &
		(arrayFormat = FORMAT_BCD or
		arrayFormat = FORMAT_HEX) 

		/* ArrayIndexOutOfBoundsException - if accessing the input array would cause access of 
		data outside array bounds*/
		/* ArithmeticException if the input byte array format is not conformant with the 
		specified arrayFormat parameter or if the specified input data represents a number 
		which is larger than the maximum value configured or larger than will fit within the 
		supported maximum number of bytes */
		
	THEN
		skip
	END;

/*-------------------------------------------------------------------------------------------*/
	subtract(bArray, bOff, bLen, arrayFormat) = 
	/* throws: NullPointerException,
			ArrayIndexOutOfBoundsException,
			ArithmeticException */
	PRE
		/* bArray - input byte array */
		/*NullPointerException if 'bArray' is null*/ 
		bArray : seq1(JBYTE) & 
		
		/* bOff - offset within input byte array containing first byte (the high order byte) */
		bOff : JSHORT &
		bOff >= 0 &
		
		/* bLen - byte length of input data */
		/*ArrayIndexOutOfBoundsException if 'bLen' is negative and 
		ArithmeticException if 'bLen' is 0 */	
		bLen : JSHORT & 
		bLen > 0 & 
		
		/* arrayFormat - indicates the format of the input data. Valid codes listed in 
		FORMAT_* constants. */
		/*ArithmeticException if 'arrayFormat' is not one of the FORMAT_ constants*/
		arrayFormat : JBYTE &
		(arrayFormat = FORMAT_BCD or
		arrayFormat = FORMAT_HEX) 

		/* ArrayIndexOutOfBoundsException - if accessing the input array would cause access of data 
		outside array bounds*/
		/* ArithmeticException if the input byte array format is not conformant with the specified 
		arrayFormat parameter or if the result of the subtraction results in a negative number. 
		The internal big number is left unchanged */
		
	THEN
		skip
	END;

/*-------------------------------------------------------------------------------------------*/
	multiply_1(bArray, bOff, bLen, arrayFormat) = 
	/* throws: NullPointerException,
			ArrayIndexOutOfBoundsException,
			ArithmeticException */
	PRE
		/* bArray - input byte array */
		/*NullPointerException if 'bArray' is null*/
		bArray : seq1(JBYTE) &  
		
		/* bOff - offset within input byte array containing first byte (the high order byte) */
		bOff : JSHORT &
		bOff >= 0 &
		
		/* bLen - byte length of input data */
		/*ArrayIndexOutOfBoundsException if 'bLen' is negative and 
		ArithmeticException if 'bLen' is 0 */	
		bLen : JSHORT & 
		bLen > 0 & 
		
		/* arrayFormat - indicates the format of the input data. Valid codes listed in 
		FORMAT_* constants. */
		/*ArithmeticException if 'arrayFormat' is not one of the FORMAT_ constants*/
		arrayFormat : JBYTE &
		(arrayFormat = FORMAT_BCD or
		arrayFormat = FORMAT_HEX) 

		/* ArrayIndexOutOfBoundsException - if accessing the input array would cause access of 
		data outside array bounds*/
		/* ArithmeticException if the input byte array format is not conformant with the 
		specified arrayFormat parameter or if the result of the multiplication results in a 
		big number which cannot be represented within the maximum supported bytes or is greater 
		than the configured max value. The internal big number is left unchanged. */
		
	THEN		
		skip
	END;

/*-------------------------------------------------------------------------------------------*/
	result <-- compareTo_1(operand) =
	PRE
		/* operand - contains the BigNumber operand */
		operand : BIG_NUMBER
	THEN
		CHOICE 
			result := cast_byte(0)
		OR
			result := cast_byte(-1)
		OR
			result := cast_byte(1)
		END
	END;

/*-------------------------------------------------------------------------------------------*/
	result <-- compareTo_2(bArray, bOff, bLen, arrayFormat) =
	/* throws: NullPointerException,
			ArrayIndexOutOfBoundsException,
			ArithmeticException */
	PRE
		/* bArray - input byte array */
		/* NullPointerException if 'bArray' is null */ 
		bArray : seq1(JBYTE) & 
		
		
		/* bOff - offset within input byte array containing first byte (the high order byte) */
		bOff : JSHORT &
		bOff >= 0 &
		
		/* bLen - byte length of input data */
		/*ArrayIndexOutOfBoundsException if 'bLen' is negative and 
		ArithmeticException if 'bLen' is 0 */	
		bLen : JSHORT & 
		bLen > 0 & 
		
		/* arrayFormat - indicates the format of the input data. Valid codes listed in 
		FORMAT_* constants. */
		/*ArithmeticException if 'arrayFormat' is not one of the FORMAT_ constants*/
		arrayFormat : JBYTE &
		(arrayFormat = FORMAT_BCD or
		arrayFormat = FORMAT_HEX) 

		/* ArrayIndexOutOfBoundsException - if accessing the input array would cause access of 
		data outside array bounds */
		/* ArithmeticException if the input byte array format is not conformant with the specified 
		arrayFormat parameter */
		
	THEN
		CHOICE 
			result := cast_byte(0)
		OR
			result := cast_byte(-1)
		OR
			result := cast_byte(1)
		END
	END;

/*-------------------------------------------------------------------------------------------*/
	toBytes(outBuf, bOff, numBytes, arrayFormat) = 
	/* throws: NullPointerException,
			ArrayIndexOutOfBoundsException,
			ArithmeticException */
	PRE
		/* outBuf - output byte array */
		/* NullPointerException if 'outBuf' is null */ 
		outBuf : seq1(JBYTE) & 
		
		/* bOff - offset within byte array containing first byte (the high order byte) */
		bOff : JSHORT &
		bOff >= 0 &
		
		/* numBytes - number of output bytes required */
		 /*ArrayIndexOutOfBoundsException if 'numBytes' is negative and 
		 ArithmeticException if 'numBytes' is 0 */	
		numBytes : JSHORT & 
		numBytes > 0 &
		
		/* arrayFormat - indicates the format of the input data. Valid codes listed in 
		FORMAT_* constants. */
		/*ArithmeticException if 'arrayFormat' is not one of the FORMAT_ constants*/
		arrayFormat : JBYTE &
		(arrayFormat = FORMAT_BCD or
		arrayFormat = FORMAT_HEX) 

		/* ArithmeticException if numBytes is not sufficient to represent the big number in the 
		desired format */
		
	THEN
		skip
	END;

/*-------------------------------------------------------------------------------------------*/
	length <-- getByteLength(arrayFormat) =
	/* throws: ArithmeticException */
	PRE
		/* arrayFormat - indicates the format of the output data. Valid codes listed in 
		FORMAT_* constants */
		/* ArithmeticException if 'arrayFormat' is not one of the FORMAT_ constants */
		arrayFormat : JBYTE &
		(arrayFormat = FORMAT_BCD or
		arrayFormat = FORMAT_HEX) 
	THEN
		ANY bignumber_length
		WHERE (bignumber_length : JSHORT) & (bignumber_length >= 0)
		THEN length := bignumber_length
		END
	END;

/*-------------------------------------------------------------------------------------------*/
	reset = 
		skip
		
END
