/* CardRuntimeException
 * Author: simone
 * Creation date: 05/06/11
 */
MACHINE
    CardRuntimeException
    
/*This class extends java.lang.RuntimeException */
EXTENDS
    RuntimeException
 
SEES
 JShort

OPERATIONS
	reason <-- getReason = 
		ANY anyReason
		WHERE anyReason : JSHORT
		THEN reason := anyReason
		END;

	setReason(reason) = 
	PRE
		reason : JSHORT
	THEN
		skip
	END;

	throwIt(reason) = /*CardRuntimeException*/
	PRE
		reason : JSHORT
	THEN
		skip
	END
END
