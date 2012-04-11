/* CardException - all Java Card platform checked Exception classes 
 * should extend CardException.
 * Author: simone
 * Creation date: 05/06/11
 * Not modeled in the current stateless model: a field "reason" and the class 
 * constructor. The value of 
 * the internal reason field of JCRE-owned instance
 * is reset to 0 on a tear or reset.  */


MACHINE
    CardException
    
/*This class extends Exception (java.lang.Exception) */
EXTENDS
    Exception
    
SEES
 JShort

OPERATIONS
    
    /* Returns the reason for the exception */
    reason <-- getReason = 
    BEGIN
        reason :: JSHORT
    END;
		
	/* Sets the reason code. */	
	setReason(reason) = 
	PRE
		reason : JSHORT
	THEN
		skip
	END;

	/* Throws the JCRE-owned instance of the CardException class with 
	the speci?ed reason. */
	throwIt(reason) = 
	/* throws: CardException (always)*/
	PRE
		reason : JSHORT
	THEN
		skip
	END
END
