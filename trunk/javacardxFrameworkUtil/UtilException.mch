/* UtilException
 * Author: simone
 * Creation date: 02/09/11
 */
MACHINE
    UtilException

SEES
	JShort

/*This class extends javacard.framework.CardRuntimeException */
EXTENDS 
	CardRuntimeException

CONSTANTS
	ILLEGAL_VALUE,
	TYPE_MISMATCHED

PROPERTIES
	ILLEGAL_VALUE : JSHORT &
	ILLEGAL_VALUE = 1 &
	TYPE_MISMATCHED : JSHORT &
	TYPE_MISMATCHED = 2

/* This method is inherited from CardRuntimeException */
OPERATIONS
	throwIt_2(reason) = 
	PRE
		/* reason - the reason for the exception */
		reason : JSHORT
	THEN
		skip
	END
END
