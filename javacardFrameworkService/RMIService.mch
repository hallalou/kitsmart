/* RMIService
 *
 * An implementation of a service that is used to process Java Card platform RMI requests 
 * for remotely accessible objects.
 *
 * Author: simone
 * Creation date: 27/08/11
 */
MACHINE
    RMIService

/* This class extends javacard.framework.service.BasicService and 
implements javacard.framework.service.RemoteService */
EXTENDS
	basicservice.BasicService, /* renamed to avoid conflit */
	remoteservice.RemoteService

SEES
	javacardRmiClasses,
	javacardFrameworkClasses,
	ApduSetsAndConstants,
	JShort,
	JByte

CONSTANTS
	DEFAULT_RMI_INVOKE_INSTRUCTION

PROPERTIES
	DEFAULT_RMI_INVOKE_INSTRUCTION : JBYTE &
	DEFAULT_RMI_INVOKE_INSTRUCTION = 56

CONCRETE_VARIABLES
	state

INVARIANT
	state : JBYTE

INITIALISATION
    state := STATE_INITIAL
	
OPERATIONS
	C_RMIService(initialObject) = 
	/* throws: NullPointerException */
	PRE
		/* initialObject - the remotely accessible initial object */
		initialObject : REMOTE

		/* NullPointerException - if the 'initialObject' parameter is null */
		
	THEN
		skip
	END;

/*----------------------------------------------------------------------------------------*/
	setInvokeInstructionByte(ins) = 
	PRE
		/* ins - the instruction byte */
		ins : JBYTE
	THEN
		skip
	END;

/*----------------------------------------------------------------------------------------*/
/* This operation is also declared in the machine BasicService, the tags '_3' are used to 
avoid conflict */
	result <-- processCommand_3(apdu) = 
	/* throws: ServiceException,
		TransactionException */
	PRE
		/* apdu - the APDU object containing the command being processed. */
		apdu : APDU &

		/*ServiceException.CANNOT_ACCESS_IN_COMMAND if this is a Java Card platform RMI 
		access command and the APDU object is not in STATE_INITIAL or in STATE_FULL_INCOMING */
		(state = STATE_INITIAL or
		state = STATE_FULL_INCOMING)		
		
    	/* ServiceException.REMOTE_OBJECT_NOT_EXPORTED if the remote method returned a 
		remote object which has not been exported */
		
		/*TransactionException.IN_PROGRESS if this is a Java Card platform RMI INVOKE command 
		and the remote method returned a remote object which has been exported within a 
		transaction which is still in progress or if this is an applet SELECT command and 
		the response information in the APDU buffer includes an initial reference object 
		which has been exported within a transaction which is still in progress */
		
		/*SecurityException:
    	-if this is a Java Card platform RMI INVOKE command and a firewall security violation 
		occurred while trying to simulate an INVOKEVIRTUAL bytecode on the remote object.
		-if internal storage in CLEAR_ON_DESELECT transient space is accessed when the 
		currently active context is not the context of the currently selected applet.
    	-if this is a Java Card platform RMI INVOKE command and the invoked remote method 
		returns an object or throws an exception object which is not accessible in the 
		context of the currently selected applet */
		
	THEN
		CHOICE
			result := TRUE
		OR
			result := FALSE
		END
	END
END
