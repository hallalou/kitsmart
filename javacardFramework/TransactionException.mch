/* TransactionException
 * Author: simone
 * Creation date: 05/06/11
 */
MACHINE
    TransactionException
    
/*This class extends javacard.framework.CardRuntimeException */
EXTENDS
    CardRuntimeException
    
SEES
 JShort,
 JByte

CONSTANTS
 IN_PROGRESS,
 NOT_IN_PROGRESS,
 BUFFER_FULL,
 INTERNAL_FAILURE

PROPERTIES
 IN_PROGRESS : JSHORT &
 IN_PROGRESS = 1 &
 NOT_IN_PROGRESS : JSHORT & 
 NOT_IN_PROGRESS = 2 &
 BUFFER_FULL : JSHORT &
 BUFFER_FULL = 3 &
 INTERNAL_FAILURE : JSHORT &
 INTERNAL_FAILURE = 4
 

/*This operation is inherited from CardRuntimeException*/
/*OPERATIONS
	throwIt(reason) =
	PRE
		reason : JSHORT
	THEN
		skip
	END*/
END
