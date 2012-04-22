/* UserException
 * Author: simone
 * Creation date: 05/06/11
 */
MACHINE
    UserException
    

/*This class extends javacard.framework.CardException */
EXTENDS
    CardException
    
SEES
    JShort
	
OPERATIONS

	/*Constructs a UserException with the specified reason.*/
	C_UserException(reason) =
	PRE
		/*the reason for the exception*/
		reason : JSHORT
	THEN
		skip
	END;

/*--------------------------------------------------------------------------*/
	/*Throws the JCRE-owned instance of UserException with 
	the specified reason.*/
	throwIt_2(reason) = 
	/* throws: UserException (always)*/
	PRE
		/*the reason for the exception*/
		reason : JSHORT
	THEN
		skip
	END
    
END
