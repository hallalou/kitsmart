/* Dispatcher
 *
 * A Dispatcher is used to build an application by aggregating several services.
 *
 * Author: simone
 * Creation date: 27/08/11
 */
MACHINE
    Dispatcher

/*This class extends java.lang.Object */
EXTENDS
	Object

SEES
	javacardFrameworkClasses,
	javacardFrameworkServiceClasses,
	JShort, 
	JByte	

CONSTANTS
	PROCESS_NONE,
	PROCESS_INPUT_DATA,
	PROCESS_COMMAND,
	PROCESS_OUTPUT_DATA

PROPERTIES
	PROCESS_NONE : JBYTE &
	PROCESS_NONE = 0 &
	
	PROCESS_INPUT_DATA : JBYTE &
	PROCESS_INPUT_DATA = 1 &
	
	PROCESS_COMMAND : JBYTE &
	PROCESS_COMMAND = 2 &
	
	PROCESS_OUTPUT_DATA : JBYTE &
	PROCESS_OUTPUT_DATA = 3

OPERATIONS
	C_Dispatcher(maxServices) = 
	/* throws: ServiceException */
	PRE
		/* maxServices - the maximum number of services that can be registered to this dispatcher */
		/* ServiceException.ILLEGAL_PARAM if the 'maxServices' parameter is negative */
		maxServices : JSHORT &
		maxServices >= 0
		
	THEN
		skip
	END;

/*-------------------------------------------------------------------------------------------*/
	addService(service, phase) = 
	/* throws: ServiceException */
	PRE
		/* service - the Service to be added to the dispatcher */
		service : SERVICE &
		
		/* phase - the processing phase associated with this service */
		phase : JBYTE 
		
		/* ServiceException.ILLEGAL_PARAM if the phase parameter is undefined or 
		if the service parameter is null. */
		/* ServiceException.DISPATCH_TABLE_FULL if the maximum number of registered 
		services is exceeded */
		
	THEN
		skip
	END;

/*-------------------------------------------------------------------------------------------*/
	removeService(service, phase) = 
	/* throws: ServiceException */
	PRE
		/* service - the Service to be deleted from the dispatcher */
		service : SERVICE &
		
		/* phase - the processing phase associated with this service */
		phase : JBYTE 
		
		/* ServiceException.ILLEGAL_PARAM if the phase parameter is unknown or 
		if the service parameter is null. */
		
	THEN
		skip
	END;

/*-------------------------------------------------------------------------------------------*/
	/* ATENTION to this method, it has the same name of its own class */
	result <-- dispatch_1(command, phase) = 
	/* throws: ServiceException */
	PRE
		/* command - the APDU object containing the command to be processed */
		command : APDU &
		
		/* phase - the processing phase to perform first */
		/* ServiceException.ILLEGAL_PARAM if the phase parameter is PROCESS_NONE or 
		an undefined value. */
		phase : JBYTE &
		phase /= PROCESS_NONE
				
	THEN
		/* this method returns an exception 'Exception' that occurred during the processing 
		of the command, or null if the command could not be processed. Here it is returned a
		short for lack of ways to return a object exception */
		result :: JSHORT
	END;

/*-------------------------------------------------------------------------------------------*/
	process(command) =
	/* throws: ISOException */
	PRE
		/* command - the APDU object containing command to be processed */
		command : APDU
		
		/* ISOException - with the response bytes per ISO 7816-4 */
		
	THEN
		skip
	END
END
