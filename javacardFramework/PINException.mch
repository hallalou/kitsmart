/* PINException - represents aOwnerPIN class access-related exception.
 * Author: simone
 * Creation date: 05/06/11
 * Not modeled in the current stateless model: the ?eld "reason" and the class 
 * constructor.   */

MACHINE
    PINException
    
/* This class extends javacard.framework.CardRuntimeException */
EXTENDS
    CardRuntimeException
    
SEES
    JShort
    
CONSTANTS
    ILLEGAL_VALUE /* NOTE: also in SystemException */

PROPERTIES
 /* one or more input parameters is out of allowed bounds. */
 ILLEGAL_VALUE : JSHORT &
 ILLEGAL_VALUE = 1
 
OPERATIONS

	/*Constructs a PINException.*/
	C_PINException(reason) =
	PRE
		/*the reason for the exception*/
		reason : JSHORT
	THEN
		skip
	END;

/*---------------------------------------------------------------------*/ 
	/* Throws the JCRE-owned instance of PINException with the specified reason. */
	throwIt_4 (reason) =
	/* throws: PINException (always)*/
	PRE
		/*the reason for the exception*/
		reason : JSHORT
	THEN
		skip
	END
 
END
