/* ISOException - encapsulates an ISO 7816-4 response status word as its
 * reason code. The APDU class throws JCRE-owned instances of ISOException.
 * Author: simone
 * Creation date: 05/06/11
 * Not modeled in the current stateless model: the ?eld "reason" and the class 
 * constructor.   */
 
MACHINE
    ISOException
    
/*This class extends javacard.framework.CardRuntimeException */
EXTENDS
    CardRuntimeException
    
SEES
    JShort
    
OPERATIONS

	/*Constructs an ISOException instance with the specified status word.*/
	C_ISOException(sw) =
	PRE
		/*the ISO 7816-4 defined status word*/
		sw : JSHORT
	THEN
		skip
	END;

/*---------------------------------------------------------------------*/ 
	/* Throws the JCRE-owned instance of the ISOException class 
	with the specified status word. */
	throwIt_3 (sw) =
	/* throws: ISOException (always)*/
	PRE
		/*ISO 7816-4 defined status word*/
		sw : JSHORT
	THEN
		skip
	END
	
END
