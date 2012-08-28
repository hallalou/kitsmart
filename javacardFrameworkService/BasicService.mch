/* BasicService
 *
 * This class should be used as the base class for implementing services. 
 * It provides a default implementation for the methods defined in the Service interface, 
 * and defines a set of helper methods that manage the APDU buffer to enable co-operation 
 * among different Services.
 * 
 * Author: simone
 * Creation date: 27/08/11
 */
MACHINE
    BasicService

/*This class extends java.lang.Object and implements javacard.framework.service.Service */
EXTENDS
	Object,
	Service

SEES
	javacardFrameworkClasses,
	ApduSetsAndConstants,
	JByte,
	JShort

CONCRETE_VARIABLES
	state

INVARIANT
	state : JBYTE

INITIALISATION
    state := STATE_INITIAL

/* The 3 first operations are also declared in the machine Service, the tags '_2' are used to 
avoid conflict */
OPERATIONS

	result <-- processDataIn_2(apdu) =
	PRE
		/* apdu - the APDU object containing the command being processed */
		apdu : APDU
	
	THEN
		result := FALSE
	END;

/*----------------------------------------------------------------------------------------*/
	result <-- processCommand_2(apdu) =
	PRE
		/* apdu - the APDU object containing the command being processed */
		apdu : APDU
	
	THEN
		result := FALSE
	END;

/*----------------------------------------------------------------------------------------*/
	result <-- processDataOut_2(apdu) =
	PRE
		/* apdu - the APDU object containing the command being processed */
		apdu : APDU
	
	THEN
		result := FALSE
	END;

/*----------------------------------------------------------------------------------------*/
	length <-- receiveInData(apdu) = 
	/* throws: ServiceException */
	PRE
		/* apdu - the APDU object containing the apdu being processed */
		apdu : APDU &
		
		/* ServiceException.CANNOT_ACCESS_IN_COMMAND if the APDU object is not in 
		STATE_INITIAL or in STATE_FULL_INCOMING */
		(state = STATE_INITIAL or
		state = STATE_FULL_INCOMING) 
		
		/* ServiceException.COMMAND_DATA_TOO_LONG if the input data does not fit in the 
		APDU buffer starting at offset 5 */
		
	THEN
		ANY anyLength
		WHERE (anyLength : JSHORT) & (anyLength >= 0)
		THEN length := anyLength
		END
	END;

/*----------------------------------------------------------------------------------------*/
	setProcessed(apdu) = 
	/* throws: ServiceException */
	PRE
		/* apdu - the APDU object containing the command being processed */
		apdu : APDU &
		
		/* ServiceException.CANNOT_ACCESS_OUT_COMMAND if the APDU object is not accessible 
		(APDU object in STATE_ERROR_.. ) */
		(state /= STATE_ERROR_NO_T0_GETRESPONSE &
		state /= STATE_ERROR_T1_IFD_ABORT &
		state /= STATE_ERROR_IO &
		state /= STATE_ERROR_NO_T0_REISSUE)
		
	THEN
		skip
	END;

/*----------------------------------------------------------------------------------------*/
	result <-- isProcessed(apdu) =
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
	setOutputLength(apdu, length) = 
	/* throws: ServiceException */
	PRE
		/* apdu - the APDU object containing the command being processed */
		apdu : APDU &
		
		/* length - the number of bytes in the response to the command */
		/* ServiceException.ILLEGAL_PARAM  if the 'length' parameter is greater than 256 */
		length : JSHORT &
		length >= 0 &
		length <= 256 

		/* ServiceException.ILLEGAL_PARAM or if the outgoing response will not fit within 
		the APDU Buffer */
	
	THEN
		skip
	END;

/*----------------------------------------------------------------------------------------*/
	numBytes <-- getOutputLength(apdu)= 
	/* throws: ServiceException */
	PRE
		/* apdu - the APDU object containing the command being processed */
		apdu : APDU

		/* ServiceException.CANNOT_ACCESS_OUT_COMMAND if the command is not processed or 
		if the APDU object is not accessible (APDU object in STATE_ERROR_.. ) */
	
	THEN
		ANY anyNumBytes
		WHERE (anyNumBytes : JSHORT) & 
		    (anyNumBytes : cast_short(0) .. cast_short(256))
		THEN numBytes := anyNumBytes
		END
	END;

/*----------------------------------------------------------------------------------------*/
	setStatusWord(apdu, sw) = 
	PRE
		/* apdu - the APDU object containing the command being processed */
		apdu : APDU &
		
		/* sw - the status word response for this command */
		sw : JSHORT
	
	THEN
		skip
	END;

/*----------------------------------------------------------------------------------------*/
	status <-- getStatusWord(apdu) = 
	/* throws: ServiceException */
	PRE
		/* apdu - the APDU object containing the command being processed */
		apdu : APDU
		
		/* ServiceException.CANNOT_ACCESS_OUT_COMMAND if the command is not processed or 
		if the APDU object is not accessible (APDU object in STATE_ERROR_.. ) */
	
	THEN
		status :: JSHORT
	END;

/*----------------------------------------------------------------------------------------*/
	result <-- fail(apdu, sw) = 
	/* throws: ServiceException */
	PRE
		/* apdu - the APDU object containing the command being processed */
		apdu : APDU &
		
		/* sw - the status word response for this command */
		sw : JSHORT

		/* ServiceException.CANNOT_ACCESS_OUT_COMMAND if the APDU object is not accessible 
		(APDU object in STATE_ERROR_.. ) */
	
	THEN
		result := TRUE
	END;

/*----------------------------------------------------------------------------------------*/
	result <-- succeed(apdu) = 
	/* throws: ServiceException */
	PRE
		/* apdu - the APDU object containing the command being processed. */
		apdu : APDU

		/* ServiceException.CANNOT_ACCESS_OUT_COMMAND if the APDU object is not accessible 
		(APDU object in STATE_ERROR_.. ) */
	
	THEN
		result := TRUE
	END;

/*----------------------------------------------------------------------------------------*/
	result <-- succeedWithStatusWord(apdu, sw) = 
	/* throws: ServiceException */
	PRE
		/* apdu - the APDU object containing the command being processed */
		apdu : APDU &
		
		/* sw - the status word to be returned for this command */
		sw : JSHORT

		/* ServiceException.CANNOT_ACCESS_OUT_COMMAND if the APDU object is not accessible 
		(APDU object in STATE_ERROR_.. ) */
	
	THEN
		result := TRUE
	END;

/*----------------------------------------------------------------------------------------*/
	CLA <-- getCLA(apdu) =
	PRE
		/* apdu - the APDU object containing the command being processed */
		apdu : APDU
		
	THEN
		CLA :: JBYTE
	END;

/*----------------------------------------------------------------------------------------*/
	INS <-- getINS(apdu) =
	PRE
		/* apdu - the APDU object containing the command being processed */
		apdu : APDU
		
	THEN
		INS :: JBYTE
	END;

/*----------------------------------------------------------------------------------------*/
	P1 <-- getP1(apdu) = 
	/* throws: ServiceException */
	PRE
		/* apdu - the APDU object containing the command being processed */
		apdu : APDU &

		/* ServiceException.CANNOT_ACCESS_IN_COMMAND if the APDU object is not in 
		STATE_INITIAL or in STATE_FULL_INCOMING */
		(state = STATE_INITIAL or
		state = STATE_FULL_INCOMING) 
		
	THEN
		P1 :: JBYTE
	END;

/*----------------------------------------------------------------------------------------*/
	P2 <-- getP2(apdu) = 
	/* throws: ServiceException */
	PRE
		/* apdu - the APDU object containing the command being processed */
		apdu : APDU &

		/* ServiceException.CANNOT_ACCESS_IN_COMMAND if the APDU object is not in 
		STATE_INITIAL or in STATE_FULL_INCOMING */
		(state = STATE_INITIAL or
		state = STATE_FULL_INCOMING) 
		
	THEN
		P2 :: JBYTE
	END;

/*----------------------------------------------------------------------------------------*/
	result <-- selectingApplet =
		CHOICE
			result := TRUE
		OR
			result := FALSE
		END
END
