/* PIN
 * Author: simone
 * Creation date: 23/04/11
 */
MACHINE
    PIN

SEES
 JByte,
 JShort

OPERATIONS

	numtime <-- getTriesRemaining =
		ANY pin_numtime
		WHERE (pin_numtime : JBYTE) & (pin_numtime >= 0)
		THEN numtime := pin_numtime
		END;

	result <-- check(pin, offset, length) =
	PRE
		pin : seq1(JBYTE) & /*NullPointerException if 'pin' is null*/
		offset : JSHORT &
		offset >= 0 & /*ArrayIndexOutOfBoundsException If 'offset' parameter is negative*/
		length : JBYTE &
		length >= 0 & /*ArrayIndexOutOfBoundsException If 'length' parameter is negative*/
		(offset + length) <= size(pin) /*ArrayIndexOutOfBoundsException*/
		
		/*ArrayIndexOutOfBoundsException if the check operation would cause access of data outside array bounds*/
	THEN
		CHOICE
			result := TRUE
		OR
			result := FALSE
		END
	END;

	result <-- isValidated =
		CHOICE
			result := TRUE
		OR
			result := FALSE
		END;

	reset = skip

END
