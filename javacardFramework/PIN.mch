/* PIN - This interface represents a PIN.
 * Author: simone
 * Creation date: 23/04/11
 */
MACHINE
    PIN

SEES
 JByte,
 JShort

OPERATIONS
    
    /* Compares pin against the PIN value. If they match and the PIN is not
    * blocked, sets the validated ?ag and resets the try counter to its
    * maximum. If it does not match, it decrements the try counter and, if 
    * the counter has reached zero, blocks the PIN. */
    
    result <-- check(pin, offset, length) =
	/* throws: ArrayIndexOutOfBoundsException, 
		     NullPointerException */
	PRE
	    /* the byte array to be compared with PIN. */
	    /* NullPointerException if 'pin' is null*/         
	    pin : seq1(JBYTE) & 
	    
	    /* the starting offset in thepin array */
	    /* ArrayIndexOutOfBoundsException if 'offset' is negative*/
		offset : JSHORT &
		offset >= 0 & 
		
	    /* the length of pin */ 	
	    /* ArrayIndexOutOfBoundsException if 'length' is negative*/
		length : JBYTE &
		length >= 0 & 
		
	    /* ArrayIndexOutOfBoundsException */	
		(offset + length) <= size(pin) 
		
	THEN  
		CHOICE
			result := TRUE /* if the PIN value matches */
		OR
			result := FALSE /* otherwise */
		END
	END;
	
	
	/* Returns the number of times remaining that an incorrect PIN can be
	 * presented before the PIN is blocked. */
	 tries <-- getTriesRemaining =
	 BEGIN
		tries : ((tries : JBYTE) & (tries >= 0))
	 END;


	/* Returns true if a valid PIN value has been presented since the last
	 * card reset or last call to reset(). */
	result <-- isValidated =
		CHOICE
			result := TRUE /* if validated */
		OR
			result := FALSE /* otherwise */
		END;
		
	/* If the validated flag is set, resets the validated flag
	* and resets the PIN try counter to the value of the PIN try limit. If
	* the validated flag is not set, this method does nothing. */
	reset = skip

END
