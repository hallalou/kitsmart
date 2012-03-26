/* CardException
 * Author: simone
 * Creation date: 05/06/11
 */
MACHINE
    CardException
    
/*This class extends Exception (java.lang.Exception) */
EXTENDS
    Exception
    
SEES
 JShort,
 JByte

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

	throwIt(reason) = 
	PRE
		reason : JSHORT
	THEN
		skip
	END
END
