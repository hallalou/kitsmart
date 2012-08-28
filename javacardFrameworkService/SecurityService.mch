/* SecurityService
 *
 * ServiceException represents a service framework-related exception.
 *
 * Author: simone
 * Creation date: 27/08/11
 */
MACHINE
    SecurityService

/*This class extends javacard.framework.service.Service */
EXTENDS
	Service

SEES
	javacardFrameworkServiceClasses,
	JByte,
	JShort

CONSTANTS
	PROPERTY_INPUT_CONFIDENTIALITY,
	PROPERTY_INPUT_INTEGRITY,
	PROPERTY_OUTPUT_CONFIDENTIALITY,
	PROPERTY_OUTPUT_INTEGRITY,
	PRINCIPAL_CARDHOLDER,
	PRINCIPAL_CARD_ISSUER,
	PRINCIPAL_APP_PROVIDER

PROPERTIES
	PROPERTY_INPUT_CONFIDENTIALITY : JBYTE &
	PROPERTY_INPUT_CONFIDENTIALITY = 1 &
 
	PROPERTY_INPUT_INTEGRITY : JBYTE &
	PROPERTY_INPUT_INTEGRITY = 2 &
 
	PROPERTY_OUTPUT_CONFIDENTIALITY : JBYTE &
	PROPERTY_OUTPUT_CONFIDENTIALITY = 4 &
 
	PROPERTY_OUTPUT_INTEGRITY : JBYTE &
	PROPERTY_OUTPUT_INTEGRITY = 8 &
 
	PRINCIPAL_CARDHOLDER : JSHORT &
	PRINCIPAL_CARDHOLDER = 1 &
 
	PRINCIPAL_CARD_ISSUER : JSHORT &
	PRINCIPAL_CARD_ISSUER = 2 &
 
	PRINCIPAL_APP_PROVIDER : JSHORT &
	PRINCIPAL_APP_PROVIDER = 3

OPERATIONS
	result <-- isAuthenticated(principal) = 
	/* throws: ServiceException */
	PRE
		/* principal - an identifier of the principal that needs to be authenticated */
		principal : JSHORT

		/* ServiceException.ILLEGAL_PARAM if the specified principal is unknown */
		
	THEN
		CHOICE
			result := TRUE
		OR
			result := FALSE
		END
	END;

/*---------------------------------------------------------------------------------------*/
	result <-- isChannelSecure(properties) = 
	/* throws: ServiceException */
	PRE
		/* properties - the required properties */
		properties : JBYTE

		/* ServiceException.ILLEGAL_PARAM if the specified property is unknown */
	THEN
		CHOICE
			result := TRUE
		OR
			result := FALSE
		END
	END;

/*---------------------------------------------------------------------------------------*/
	result <-- isCommandSecure(properties) =
	PRE
		/* properties - the required properties */
		properties : JBYTE

		/* ServiceException.ILLEGAL_PARAM if the specified property is unknown */
	THEN
		CHOICE
			result := TRUE
		OR
			result := FALSE
		END
	END
END
