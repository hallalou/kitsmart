/* CryptoException
 * Author: simone
 * Creation date: 17/03/11
 */
MACHINE
    CryptoException

SEES
	JByte,
	JShort

/*This class extends javacard.framework.CardRuntimeException */
EXTENDS
	CardRuntimeException

CONSTANTS
	ILLEGAL_VALUE,
	UNINITIALIZED_KEY,
	NO_SUCH_ALGORITHM,
	INVALID_INIT,
	ILLEGAL_USE

PROPERTIES
	ILLEGAL_VALUE : JBYTE &	
	ILLEGAL_VALUE = 1 &
	
	UNINITIALIZED_KEY : JBYTE &
	UNINITIALIZED_KEY = 2 &
	
	NO_SUCH_ALGORITHM : JBYTE &
	NO_SUCH_ALGORITHM = 3 &
	
	INVALID_INIT : JBYTE &
	INVALID_INIT = 4 &
	
	ILLEGAL_USE : JBYTE &
	ILLEGAL_USE = 5

/* this method is declared with '_2' because CardRuntimeException also use the same signature*/
OPERATIONS
	throwIt_2(reason) = 
	PRE
		reason : JSHORT
	THEN
		skip
	END
END
