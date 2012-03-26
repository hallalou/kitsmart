/* UserException
 * Author: simone
 * Creation date: 05/06/11
 */
MACHINE
    UserException
    

/*This class extends javacard.framework.CardException */
EXTENDS
    CardException
    
    
/*This operation is inherited from CardException*/
/*SEES
 JShort,
 JByte

OPERATIONS
	throwIt(reason) = 
	PRE
		reason : JSHORT
	THEN
		skip
	END*/
END
