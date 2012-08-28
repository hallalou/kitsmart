/* Service
 * 
 * This is the base interface for the service framework on the Java Card platform. 
 * A Service is an object that is able to perform partial or complete processing on 
 * a set of incoming commands encapsulated in an APDU. 
 *
 * Author: simone
 * Creation date: 27/08/11
 */
MACHINE
    Service

SEES
	javacardFrameworkClasses


/* This operations are also declared in the machine BasicService, the tags '_1' are used to 
avoid conflict */

OPERATIONS
	
	result <-- processDataIn_1(apdu) =
	PRE
		/* apdu - the APDU object containing the command being processed */
		apdu : APDU
	THEN
		CHOICE
			result := TRUE
		OR
			result := FALSE
		END
	END;

/*----------------------------------------------------------------------------------------*/
	result <-- processCommand_1(apdu) =
	PRE
		/* apdu - the APDU object containing the command being processed */
		apdu : APDU
	THEN
		CHOICE
			result := TRUE
		OR
			result := FALSE
		END
	END;

/*----------------------------------------------------------------------------------------*/
	result <-- processDataOut_1(apdu) =
	PRE
		/* apdu - the APDU object containing the command being processed */
		apdu : APDU
	THEN
		CHOICE
			result := TRUE
		OR
			result := FALSE
		END
	END
END
