/* BCDUtil
 *
 * The BCDUtil class contains common BCD(binary coded decimal) related utility functions. 
 *
 * Author: simone
 * Creation date: 01/09/11
 */
MACHINE
    BCDUtil

SEES
	JShort,
	JByte

/*This class extends java.lang.Object */
EXTENDS
	Object

OPERATIONS
	maxByte <-- getMaxBytesSupported = 
		ANY bcdutil_maxByte
		WHERE (bcdutil_maxByte : JSHORT) & (bcdutil_maxByte >= 0)
		THEN maxByte := bcdutil_maxByte
		END;

/*-------------------------------------------------------------------------------------------*/
	hex <-- convertToHex(bcdArray, bOff, bLen, hexArray, outOff) =
	/* throws: NullPointerException,
			ArrayIndexOutOfBoundsException,
			ArithmeticException */
	PRE
		/* bcdArray - input byte array */
		/* NullPointerException if 'bcdArray' is null */
		bcdArray : seq1(JBYTE) & 
		
		/* bOff - offset within byte array containing first byte (the high order byte) */
		/* ArrayIndexOutOfBoundsException if 'bOff' is negative */
		bOff : JSHORT &
		bOff >= 0 & 
		
		/* bLen - byte length of input BCD data */
		/* ArrayIndexOutOfBoundsException if 'bLen' is negative */ 
		/* ArithmeticException if bLen is 0 */
		bLen : JSHORT &
		bLen > 0 & 
		
		/* hexArray - output byte array */
		/* NullPointerException if 'hexArray' is null */
		hexArray : seq1(JBYTE) & 
		
		/* outOff - offset within hexArray where output data begins */
		/* ArrayIndexOutOfBoundsException if 'outOff' is negative */
		outOff : JSHORT &
		outOff >= 0 & 
		
		/*ArrayIndexOutOfBoundsException if 'bOff+bLen' is greater than the length of 
		the 'bcdArray' and no conversion is performed */
		sum_short(bOff, bLen) <= size(bcdArray) 

		/* ArrayIndexOutOfBoundsException - if converting would cause access of data outside array bounds */
		/* ArithmeticException:
			- if the input byte array format is not a correctly formed BCD value
			- if the size of the BCD value requires greater than supported maximum number of 
			bytes to represent in hex format */
	THEN
		ANY bcdutil_hex
		WHERE (bcdutil_hex : JSHORT) & (bcdutil_hex >= 0)
		THEN hex := bcdutil_hex
		END
	END;

/*-------------------------------------------------------------------------------------------*/
	BCD <-- convertToBCD(hexArray, bOff, bLen, bcdArray, outOff) =
	/* throws: NullPointerException,
			ArrayIndexOutOfBoundsException,
			ArithmeticException */
	PRE
		/* hexArray - input byte array */
		/*NullPointerException if 'hexArray' is null*/
		hexArray : seq1(JBYTE) & 
		
		/* bOff - offset within byte array containing first byte (the high order byte) */
		/*ArrayIndexOutOfBoundsException if 'bOff' is negative*/
		bOff : JSHORT &
		bOff >= 0 & 
		
		/* bLen - byte length of input hex data */
		/* ArrayIndexOutOfBoundsException if 'bLen' is negative and 
		ArithmeticException if 'bLen' is 0 */
		bLen : JSHORT &
		bLen > 0 & 
		
		/* bcdArray - output byte array */
		/* NullPointerException if 'bcdArray' is null */
		bcdArray : seq1(JBYTE) & 
		
		/* outOff - offset within bcdArray where output data begins */
		/* ArrayIndexOutOfBoundsException if 'outOff' is negative */
		outOff : JSHORT &
		outOff >= 0 & 
		
		/* ArrayIndexOutOfBoundsException if 'bOff+bLen' is greater than the length of 
		the 'hexArray' and no conversion is performed */
		sum_short(bOff, bLen) <= size(hexArray) 

		/* ArithmeticException if the length of the input hex value is larger than the 
		supported maximum number of bytes */

	THEN
		ANY bcdutil_BCD
		WHERE (bcdutil_BCD : JSHORT) & (bcdutil_BCD >= 0)
		THEN BCD := bcdutil_BCD
		END
	END;

/*-------------------------------------------------------------------------------------------*/
	result <-- isBCDFormat(bcdArray, bOff, bLen) =
	PRE	
		/* bcdArray - input byte array */
		/* NullPointerException if 'bcdArray' is null */
		bcdArray : seq1(JBYTE) & 
		
		/* bOff - offset within byte array containing first byte (the high order byte) */
		/* ArrayIndexOutOfBoundsException if 'bOff' is negative */
		bOff : JSHORT &
		bOff >= 0 & 
		
		/* bLen - byte length of input BCD data */
		/* ArrayIndexOutOfBoundsException if 'bLen' is negative and 
		ArithmeticException if 'bLen' is 0 */
		bLen : JSHORT &
		bLen > 0 
	
	THEN
		CHOICE
			result := TRUE
		OR
			result := FALSE
		END
	END
END
