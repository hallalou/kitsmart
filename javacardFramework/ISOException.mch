/* ISOException
 * Author: simone
 * Creation date: 05/06/11
 */
MACHINE
    ISOException
    
/*This class extends javacard.framework.CardRuntimeException */
EXTENDS
    CardRuntimeException
    
/*This operation is inherited from CardRuntimeException*/
/*SEES
 JShort,
 JByte

OPERATIONS
	throwIt(sw) = 
	PRE
		sw : JSHORT
	THEN
		skip
	END*/
END
