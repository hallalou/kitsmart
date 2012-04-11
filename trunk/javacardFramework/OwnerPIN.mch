/* OwnerPIN - represents an Owner PIN, implements Personal Identi?cation  
 * Number functionality as de?ned in the PIN interface, and provides the 
 * ability to update the PIN and thus owner functionality. 
 * Author: simone
 * Creation date: 05/06/11
 *
 * Extrai­do em parte do LibsBSmart
 */
MACHINE OwnerPIN
    
    
/*ATENTION This class extends Object (java.lang.Object) and implements PIN (javacard.framework.PIN)*/
EXTENDS
	Object,
	PIN
    
SEES
 JShort,
 JByte,
 JBoolean

VARIABLES
	Pin,
	TryLimit,
	MaxPINsize,
	TryCounter,
	ValidatedFlag

INVARIANT
	Pin : seq(JBYTE) &
	TryLimit : JBYTE &
	TryLimit >= 1 &
	MaxPINsize : JBYTE &
	MaxPINsize >= 1 &
	TryCounter : JBYTE &
	TryCounter >= 0 &
	ValidatedFlag : JBOOLEAN

INITIALISATION
	Pin := [] ||
	TryLimit, MaxPINsize, TryCounter := 1, 1, 0 ||
	ValidatedFlag := FALSE

OPERATIONS
    /* Constructor. Allocates a new PIN instance with validated ?ag set to 	
       false. */
	C_OwnerPIN(tryLimit, maxPINSize) =
	PRE
	    /* the maximum number of times an incorrect PIN can be presented */ 
	    /* PINException.ILLEGAL_VALUE if 'tryLimit' is less than 1 */
		tryLimit : JBYTE &
		tryLimit >= 1 & 
		
	    /* the maximum allowed PIN size */
	    /* PINException.ILLEGAL_VALUE if 'maxPINSize' is less than 1 */
		maxPINSize : JBYTE &
		maxPINSize >= 1 
	THEN
		TryLimit := tryLimit ||
		MaxPINsize := maxPINSize ||
		ValidatedFlag := FALSE
	END;
			
	    
   /* Implements check from the PIN interface */	    
   /* Compares pin against the PIN value. If they match and the PIN is not
    * blocked, sets the validated flag and resets the try counter to its
    * maximum. If it does not match, it decrements the try counter and, if 
    * the counter has reached zero, blocks the PIN. */
    
    result <-- check_2(pin, offset, length) =
	/* throws: ArrayIndexOutOfBoundsException, 
		     NullPointerException */
	PRE
	    /* the byte array to be compared with PIN. */
	    /* NullPointerException if 'pin' is null*/         
	    pin : seq1(JBYTE) & 
	    
	    /* the starting offset in the pin array */
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
	tries <-- getTriesRemaining_2 = 
	BEGIN
		tries := TryCounter
	END;
	
	/* returns the value of the validated ?ag.*/	
	result <-- getValidatedFlag = 
	BEGIN
		result := ValidatedFlag
	END;

	/* Returns true if a valid PIN value has been presented since the last
	 * card reset or last call to reset(). */
	result <-- isValidated_2 = 
		CHOICE
			result := TRUE
		OR
			result := FALSE
		END;

	/* If the validated flag is set, resets the validated flag
	* and resets the PIN try counter to the value of the PIN try limit. If
	* the validated flag is not set, this method does nothing. */
	reset_2 = 
	IF (ValidatedFlag = TRUE)
	THEN
		TryCounter := TryLimit ||
		ValidatedFlag := FALSE
	ELSE
		skip
	END;

	/* This method resets the validated ?ag and resets the PIN try counter
	* to the value of the PIN try limit. 
	* This method is used by the owner to re-enable the blocked PIN. */
	resetAndUnblock = 
	CHOICE
		TryCounter := TryLimit ||
		ValidatedFlag := FALSE
	OR
		skip
	END;
	
	
	/* This protected method sets the value of the validated ?ag. */
	setValidatedFlag(value) = 
	PRE
		value : JBOOLEAN
	THEN
		ValidatedFlag := value
	END;


	/* This method sets a new value for the PIN and resets the PIN try 	 
	* counter to the value of the PIN try limit. It also resets the 	
	* validated ?ag. */

	update (pin, offset, length) = 
	/* throws: PINException */
	PRE
	    /* the new PIN. */
	    pin : seq(JBYTE) &
	    
	    /* the starting offset in the pin array */
	    offset : JSHORT &
		
	    /* the length of the new PIN */
	    /* PINException.ILLEGAL_VALUE if length is greater than configured
	       maximum PIN size */
	    length : JBYTE &
	    length <= MaxPINsize

	THEN
		Pin := pin ||
		TryCounter := TryLimit ||
		ValidatedFlag := FALSE
	END

	
END
