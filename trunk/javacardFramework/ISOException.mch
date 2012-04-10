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
    
END
