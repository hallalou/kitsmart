/* SystemException - represents a JCSystem class related exception. 
 * It is also thrown by the javacard.framework.Applet.register() methods 
 * and by the AID class constructor. 
 * Author: simone
 * Creation date: 05/06/11
 * Not modeled in the current stateless model: the ?eld "reason" and the class 
 * constructor.   */

MACHINE
    SystemException
    
/*This class extends javacard.framework.CardRuntimeException */
EXTENDS
    CardRuntimeException
    
SEES
	JShort

CONSTANTS
    
	ILLEGAL_VALUE, 	/* NOTE: also in PINException */
	NO_TRANSIENT_SPACE,
	ILLEGAL_TRANSIENT,
	ILLEGAL_AID, 
	NO_RESOURCE,
	ILLEGAL_USE 	/* NOTE: also in APDUException */

PROPERTIES
    
	/* one or more input parameters is out of allowed bounds */
	ILLEGAL_VALUE : JSHORT &
	ILLEGAL_VALUE = 1 &
 
	/* no room is available in volatile memory for the requested object */  
	NO_TRANSIENT_SPACE : JSHORT & 
	NO_TRANSIENT_SPACE = 2 &
 
	/* the request to create a transient object is not allowed in the current
    applet context */
	ILLEGAL_TRANSIENT : JSHORT &
	ILLEGAL_TRANSIENT = 3 &
 
	/* input AID parameter is not a legal AID value */
	ILLEGAL_AID : JSHORT &
	ILLEGAL_AID = 4 &
 
	/* there is insuf?cient resource in the Card for the request */
	NO_RESOURCE : JSHORT &
	NO_RESOURCE = 5 &
 
	/* the requested function is not allowed */
	ILLEGAL_USE : JSHORT &
	ILLEGAL_USE = 6
	
OPERATIONS

	/*Constructs a SystemException.*/
	C_SystemException(reason) =
	PRE
		/*the reason for the exception*/
		reason : JSHORT
	THEN
		skip
	END;

/*---------------------------------------------------------------------*/ 
	/*Throws the JCRE-owned instance of SystemException with the specified reason.*/
	throwIt_5 (reason) =
	/* throws: SystemException (always)*/
	PRE
		/*the reason for the exception*/
		reason : JSHORT
	THEN
		skip
	END
 
END
