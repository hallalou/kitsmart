/* OwnerPIN
 * Author: simone
 * Creation date: 05/06/11
 *
 * Extraído em parte do LibsBSmart
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
	C_OwnerPIN(tryLimit, maxPINSize) =
	PRE
		tryLimit : JBYTE &
		tryLimit >= 1 & /*PINException.ILLEGAL_VALUE if 'tryLimit' parameter is less than 1*/
		maxPINSize : JBYTE &
		maxPINSize >= 1 /*PINException.ILLEGAL_VALUE if 'maxPINSize' parameter is less than 1*/
	THEN
		TryLimit := tryLimit ||
		MaxPINsize := maxPINSize ||
		ValidatedFlag := FALSE
	END;

	result <-- getValidatedFlag = 
	BEGIN
		result := ValidatedFlag
	END;

	setValidatedFlag(value) = 
	PRE
		value : JBOOLEAN
	THEN
		ValidatedFlag := value
	END;

	tries <-- getTriesRemaining_2 = 
	BEGIN
		tries := TryCounter
	END;



	result <-- check_2(pin, offset, length) =
	PRE
		pin : seq1(JBYTE) & 
		offset : JSHORT &
		offset >= 0 & 
		length : JBYTE &
		length >= 0 & 
		(offset + length) <= size(pin) 
	THEN
		CHOICE
			result := TRUE
		OR
			result := FALSE
		END
	END;

	result <-- isValidated_2 = 
		CHOICE
			result := TRUE
		OR
			result := FALSE
		END;


	reset_2 = 
	CHOICE
		TryCounter := TryLimit ||
		ValidatedFlag := FALSE
	OR
		skip
	END;

	update(pin, offset, length) = /*PINException*/
	PRE
		pin : seq(JBYTE) &
		offset : JSHORT &
		offset >= 0 &
		length : JBYTE &
		length >= 0

		/*PINException.ILLEGAL_VALUE if length is greater than configured maximum PIN size*/
	THEN
		Pin := pin ||
		TryCounter := TryLimit ||
		ValidatedFlag := FALSE
	END;

	resetAndUnblock = 
	CHOICE
		TryCounter := TryLimit ||
		ValidatedFlag := FALSE
	OR
		skip
	END
	
END
