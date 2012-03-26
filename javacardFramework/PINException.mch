/* PINException
 * Author: simone
 * Creation date: 05/06/11
 */
MACHINE
    PINException
    
/* This class extends javacard.framework.CardRuntimeException */
EXTENDS
    CardRuntimeException
    
SEES
 JShort,
 JByte

CONSTANTS
 ILLEGAL_VALUE

PROPERTIES
 ILLEGAL_VALUE : JSHORT &
 ILLEGAL_VALUE = 1
 
 
/*This operation is inherited from CardRuntimeException*/
/*OPERATIONS
	throwIt(reason) =
	PRE
		reason : JSHORT
	THEN
		skip
	END*/
END
