/* CardRuntimeException - all Java Card platform unchecked Exception classes 
 * should extend CardRuntimeException.
 * Author: simone
 * Creation date: 05/06/11
 * Not modeled in the current stateless model: a ?eld "reason" and the class 
 * constructor. The value of 
 * the internal reason ?eld of Java Card runtime environment-owned instance
 * is reset to 0 on a tear or reset.  */
 
MACHINE
    CardRuntimeException
    
/*This class extends java.lang.RuntimeException */
EXTENDS
    RuntimeException
 
SEES
    JShort

OPERATIONS

	/*Constructs a CardRuntimeException instance with the specified reason.*/
	C_CardRuntimeException(reason) =
	PRE
		/*the reason for the exception.*/
		reason : JSHORT
	THEN
		skip
	END;

/*---------------------------------------------------------------------*/    
    /* Returns the reason for the exception */
    reason <-- getReason = 
    BEGIN
		/*the reason for the exception*/
		reason :: JSHORT
	END;

/*---------------------------------------------------------------------*/
	/* Sets the reason code. */
	setReason (reason) = 
	PRE
		/*the reason for the exception*/
		reason : JSHORT
	THEN
		skip
	END;

/*---------------------------------------------------------------------*/
	/* Throws the JCRE-owned instance of the CardRuntimeException class with 
	the speci?ed reason. */
	throwIt_1 (reason) = 
	/* throws: CardRuntimeException (always)*/
	PRE
		/*the reason for the exception*/
		reason : JSHORT
	THEN
		skip
	END
	
END
