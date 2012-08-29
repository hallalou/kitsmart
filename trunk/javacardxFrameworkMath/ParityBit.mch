/* ParityBit
 * Author: simone
 * Creation date: 01/09/11
 */
MACHINE
    ParityBit

SEES
	JShort,
	JByte,
	JBoolean

/*This class extends java.lang.Object */
EXTENDS
	Object

OPERATIONS
	set(bArray, bOff, bLen, isEven) =
	/* throws: NullPointerException,
			ArrayIndexOutOfBoundsException*/
	PRE
		/* bArray - input/output byte array */
		/* NullPointerException - if bArray is null */
		bArray : seq1(JBYTE) & 
		
		/* bOff - offset within byte array to start setting parity on */
		/*ArrayIndexOutOfBoundsException if 'bOff' is negative */
		bOff : JSHORT &
		bOff >= 0 & 
		
		/* bLen - byte length of input/output bytes */
		/* ArrayIndexOutOfBoundsException if 'bLen' is negative*/
		bLen : JSHORT &
		bLen >= 0 & 
		
		/* ArrayIndexOutOfBoundsException if 'bOff+bLen' is greater than the length 
		of the 'bArray' */
		sum_short(bOff, bLen) <= size(bArray) & 
		
		/* isEven - true if even parity is required and false if odd parity is required */
		isEven : JBOOLEAN

		/* ArrayIndexOutOfBoundsException if accessing the input array would cause access of 
		data outside array bounds */
		
	THEN
		skip
	END
END
