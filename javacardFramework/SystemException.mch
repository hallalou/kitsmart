/* SystemException
 * Author: simone
 * Creation date: 05/06/11
 */
MACHINE
    SystemException
    
/*This class extends javacard.framework.CardRuntimeException */
EXTENDS
    CardRuntimeException
    
SEES
 JShort,
 JByte

CONSTANTS
 ILLEGAL_VALUE,
 NO_TRANSIENT_SPACE,
 ILLEGAL_TRANSIENT,
 ILLEGAL_AID,
 NO_RESOURCE,
 ILLEGAL_USE

PROPERTIES
 ILLEGAL_VALUE : JSHORT &
 ILLEGAL_VALUE = 1 &
 NO_TRANSIENT_SPACE : JSHORT & 
 NO_TRANSIENT_SPACE = 2 &
 ILLEGAL_TRANSIENT : JSHORT &
 ILLEGAL_TRANSIENT = 3 &
 ILLEGAL_AID : JSHORT &
 ILLEGAL_AID = 4 &
 NO_RESOURCE : JSHORT &
 NO_RESOURCE = 5 &
 ILLEGAL_USE : JSHORT &
 ILLEGAL_USE = 6
 
/*This operation is inherited from CardRuntimeException*/
/*OPERATIONS
	throwIt(reason) = 
	PRE
		reason : JSHORT
	THEN
		skip
	END*/
END
