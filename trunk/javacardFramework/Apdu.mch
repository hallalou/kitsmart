/** Apdu - Model of javacard.framework.APDU class
 *
 * Authors: Katia Moraes, Bruno Gomes, Simone Oliveira, Anamaria
 *
 * NOTE: In the current model, usually only the interface of the operation is 	 * modeled.
 */
MACHINE
    Apdu
    
/* This class extends Object (java.lang.Object)*/
EXTENDS
	Object

SEES
 JShort,
 JByte,
 ApduSetsAndConstants,
 ISO7816
 
DEFINITIONS
    /* Some auxiliary names (not part of the API specification) */
    
    /* set of available APDU states */
     APDU_STATE == { 
     	STATE_INITIAL,
 	STATE_PARTIAL_INCOMING,
 	STATE_FULL_INCOMING,
 	STATE_OUTGOING,
 	STATE_OUTGOING_LENGTH_KNOWN,	
 	STATE_PARTIAL_OUTGOING,
 	STATE_FULL_OUTGOING,
 	STATE_ERROR_NO_T0_GETRESPONSE,
 	STATE_ERROR_T1_IFD_ABORT,
 	STATE_ERROR_IO,
 	STATE_ERROR_NO_T0_REISSUE };

	/* APDU buffers */
	BUFFER == {s | s : seq(JBYTE) & size(s) >= 5 & size(s) <133 };
	
	BUFFER_LENGTH == 133   
 

CONCRETE_VARIABLES
 	/* The current state of data processing */
	state,
	/* The APDU buffer */
    	buffer,
 	/* The length of the incoming data field of the command */
	lc,
	/* The expected length of the response (if any) */
	le,
	/* The real effective length of the response (if any) */
 	lr
    

INVARIANT
    	state : APDU_STATE & 
   	buffer : seq(JBYTE)  &
   	size(buffer) >= 0 & 
   	size(buffer) <= BUFFER_LENGTH &
   	lc : JSHORT &
   	lr : JSHORT &
   	le : JSHORT & 
   	le >= 0 &
   	le <= 256

INITIALISATION
	buffer := [0, 0, 0, 0, 0, 0, 0, 0] ||
    state := STATE_INITIAL ||
    lc, le, lr := 0, 0, 0 
    
OPERATIONS
    
    /* Returns the APDU buffer byte array */
	result <-- getBuffer =
		BEGIN
	    	result := buffer
	 	END;
	 	
	/* Returns the logical channel number associated with the current 			APDU command based on the CLA byte. */ 	
	CLA <-- getCLAChannel = 
	/* throws: SecurityException*/
		BEGIN
		CLA :: cast_byte(0) .. cast_byte(19)
		END;
		
	/* Provides the reference to APDU object being processed. */	
	apdu <-- getCurrentAPDU = 
	/* throws: SecurityException*/
	BEGIN
	    apdu :: APDU
	/* SecurityException if the current context is not the 
	context of the currently selected applet instance or this 
	method was not called, directly or indirectly, from the 
	applet's process method (called directly by the Java Card 
	runtime environment), or the method is called during applet 
	installation or deletion. */
	END;
	
	/* Returns the APDU buffer of the APDU object being processed */
	apdu <-- getCurrentAPDUBuffer = 
	/* throws: SecurityException*/
	BEGIN
		apdu := buffer
	/* SecurityException if the current context is not the context 
	of the currently selected applet instance or this method was not 
	called, directly or indirectly, from the applet's process 
	method (called directly by the Java Card runtime environment), 
	or the method is called during applet installation or deletion*/
	END;
	
	
	/* Returns the current processing state of the APDU */
   	result <-- getCurrentState = 
	BEGIN
	    result := state
	END;
	
	/* Returns the con?gured incoming block size. */
	blocksize <-- getInBlockSize = 
		ANY apdu_anyBlocksize
		WHERE (apdu_anyBlocksize : JSHORT) &
	     	  (apdu_anyBlocksize >= 0)
		THEN blocksize := apdu_anyBlocksize
		END;
		
	/* Returns the incoming data length(Lc).*/		
	length <-- getIncomingLength = 
	/* throws: APDUException */
	BEGIN
		CHOICE
			length := lc
		OR
			length := 0 /* if no incoming data */ 
		END
	/* APDUException.ILLEGAL_USE if setIncomingAndReceive() not called 
	 or if setOutgoing() or setOutgoingNoChaining() previously invoked */
	END;
	
	/* Returns the Node Address byte (NAD) in T=1 protocol, and 0 in T=0
	protocol.  */
	NAD <-- getNAD = 
		BEGIN
			NAD :: JBYTE 
		END;
		
	/* Returns the offset within the APDU buffer for incoming command data*/
	cdata <-- getOffsetCdata = 
	/*throws: APDUException*/
	BEGIN
		CHOICE
			cdata := cast_byte(5) /*when Lc is 1 byte*/
		OR
			cdata := cast_byte(7) /*when Lc is 3 bytes*/
		END
	/* APDUException.ILLEGAL_USE if setIncomingAndReceive() not called or if 	setOutgoing() or setOutgoingNoChaining() previously invoked*/
	END;
		
	/* Returns the con?gured outgoing block size. */
	blocksize <-- getOutBlockSize = 
		ANY apdu_anyBlocksize
		WHERE (apdu_anyBlocksize : JSHORT) &
		(apdu_anyBlocksize >= 0)
		THEN blocksize := apdu_anyBlocksize
		END;
		
	/*Returns the ISO 7816 transport protocol type, T=1 or T=0 in the low
		nibble and the transport media in the upper nibble in use. */
	protocol <-- getProtocol = 
		CHOICE
			protocol := PROTOCOL_TO
		OR
			protocol := PROTOCOL_T1 
		END;

	/* Returns whether the current APDU command is the ?rst or part of a
	command chain. */
	result <-- isCommandChainingCLA = 
		CHOICE
		    result := TRUE /* this APDU is not the last APDU of a 
		    				command chain */
		OR
		    result := FALSE
		END;
	
	
	/* Returns whether the current APDU command CLA byte corresponds to an
	interindustry command as de?ned in ISO 7816-4:2005 speci?cation. */	
	result <-- isISOInterindustryCLA = 
		CHOICE
			result := TRUE /* interindustry */
		OR
			result := FALSE
		END;
		
	/* Returns true if the encoding of the current APDU command based on the 	CLA byte indicates secure messaging. */
	result <-- isSecureMessagingCLA = 
		CHOICE
			result := TRUE /* secure */
		OR
			result := FALSE
		END;
		
	/* Gets as many data bytes as will ?t without APDU buffer over?ow, at
	the speci?ed offset bOff. Gets all the remaining bytes if they ?t. */		
	result <-- receiveBytes(bOff) = 
	/* throws: APDUException */
	PRE
	    	/* space in the buffer must allow for incoming block size. 
	    	(modeled for size 0, only) */	    
      	bOff : JSHORT &
      	bOff >= 0 & 
      	bOff < BUFFER_LENGTH & 
      	
      	/*APDUException if setIncomingAndReceive() not called or 
       	if setOutgoing() or setOutgoingNoChaining() previously invoked*/      		state = STATE_PARTIAL_INCOMING
 
		/*APDUException if not enough buffer space for incoming block size*/
		/*APDUException on I/O error.*/
		/*APDUException if T=1 protocol is in use and the CAD sends 
		in an ABORT S-Block command to abort the data transfer*/
    	THEN
        	CHOICE 
       			state := STATE_PARTIAL_INCOMING 
        	OR
       			state := STATE_FULL_INCOMING
        	END
        	||
		result : (result : JSHORT & 
            	  result >=0 &
            	  result <= (buffer)(OFFSET_LC)  &
           		  sum_short(result,bOff) <= BUFFER_LENGTH)        	
   	END;
		
		

	result <-- setOutgoing = /*APDUException*/
   	PRE
		(state = STATE_INITIAL or 
		 state = STATE_PARTIAL_INCOMING or
		 state = STATE_FULL_INCOMING)
		/*APDUException if this method, or setOutgoingNoChaining() method already invoked*/
		/*APDUException I/O error*/
	THEN 
  		state := STATE_OUTGOING  ||
		result := le
   	END;
	
	result <-- setOutgoingNoChaining = /*APDUException*/
    	PRE
    		(state = STATE_INITIAL or 
       		 state = STATE_PARTIAL_INCOMING or
       		 state = STATE_FULL_INCOMING)

		/*APDUException if this method, or setOutgoing() method already invoked*/
    	/*APDUException I/O error*/
	THEN
   		state := STATE_OUTGOING ||
		result := le
   	END;

	setOutgoingLength(len) = /*APDUException*/
    	PRE
    	    len : JSHORT &
    	    /*APDUException if 'len' is negative*/
    	    len >= 0 & 
    	    /*APDUException if 'len' is greater than 256 
    	    and the currently selected applet does not implement 
    	    the javacardx.apdu.ExtendedLength interface*/
			len <= 256 & 
       		state = STATE_OUTGOING
       		/*APDUException if setOutgoing() or setOutgoingNoChaining() 
       		not called or if setOutgoingAndSend() already invoked, 
       		or this method already invoked*/
			/*APDUException I/O error*/
    THEN
    	state := STATE_OUTGOING_LENGTH_KNOWN ||
   	    lr := len
   	END;


    	result <-- setIncomingAndReceive = /*APDUException*/
			/*APDUException if setIncomingAndReceive() already invoked 
			  or if setOutgoing() or setOutgoingNoChaining() previously invoked*/
    		/*APDUException on I/O error*/
    		/*APDUException if T=1 protocol is in use and the CAD 
    		sends in an ABORT S-Block command to abort the data transfer*/
    	SELECT
        	state = STATE_INITIAL
    	THEN
        	CHOICE
        		state := STATE_PARTIAL_INCOMING
        	OR
            	state := STATE_FULL_INCOMING 
        	END
			||
		
			result :(result : JSHORT &
				     result >= 0 &
				     result <= buffer(OFFSET_LC)
					)
		    /*END*/
		END;
    
	sendBytes(bOff, len) = /*APDUException*/
   	PRE
       		bOff : JSHORT &
			bOff >= 0 & /*APDUException  if 'bOff' is negative*/
       		len : JSHORT &
       		len >= 0 & /*APDUException  if 'len' is negative */
       		/*APDUException or 'bOff+len' exceeds the buffer size*/
			sum_short(bOff,len) <= BUFFER_LENGTH & 
       		len <= lr &
   	   		state = STATE_OUTGOING_LENGTH_KNOWN

		/*APDUException if setOutgoingLength() not called or 
		setOutgoingAndSend() previously invoked or response byte count 
		exceeded or if APDUException.NO_T0_GETRESPONSE or 
		APDUException.NO_T0_REISSUE or APDUException.T1_IFD_ABORT 
		previously thrown*/
		/*APDUException on I/O error*/
		/*APDUException.NO_T0_GETRESPONSE if T=0 protocol is in 
		use and the CAD does not respond to (ISO7816.SW_BYTES_REMAINING_00+count) 
		response status with GET RESPONSE command on the same origin logical 
		channel number as that of the current APDU command*/
		/*APDUException.NO_T0_REISSUE if T=0 protocol is in use and the 
		CAD does not respond to (ISO7816.SW_CORRECT_LENGTH_00+count) 
		response status by re-issuing same APDU command on the same 
		origin logical channel number as that of the current APDU command 
		with the corrected length*/
		/*APDUException.T1_IFD_ABORT if T=1 protocol is in use and the 
		CAD sends in an ABORT S-Block command to abort the data transfer*/
   	THEN
   	    CHOICE 
			state := STATE_PARTIAL_OUTGOING
   		OR  
			state := STATE_FULL_OUTGOING
	    END
		||
		lr := subt_short(lr, len)
   	END;
    
	sendBytesLong(outData ,bOff ,len) = /*APDUException, SecurityException*/
   	PRE
   		outData : seq(JBYTE) & 
   	   	bOff : JSHORT & 
		bOff >= 0 &
   	    len : JSHORT &
		len >= 0 & 
		len <= lr &
		state = STATE_OUTGOING_LENGTH_KNOWN 

		/*SecurityException if the 'outData' array is not 
		  accessible in the caller's context*/
		/*APDUException.ILLEGAL_USE if setOutgoingLength() not 
		called or setOutgoingAndSend() previously invoked or response 
		byte count exceeded or if APDUException.NO_T0_GETRESPONSE or 
		APDUException.NO_T0_REISSUE or APDUException.NO_T0_REISSUE 
		previously thrown*/
        /*APDUException.IO_ERROR on I/O error*/
        /*APDUException.NO_T0_GETRESPONSE if T=0 protocol 
        is in use and CAD does not respond to 
        (ISO7816.SW_BYTES_REMAINING_00+count)
        response status with GET RESPONSE command on the 
        same origin logical channel number as that of the 
        current APDU command*/
        /*APDUException.T1_IFD_ABORT if T=1 protocol is in use and 
        the CAD sends in an ABORT S-Block command to 
        abort the data transfer*/
	THEN
   	    CHOICE 
   	   		state := STATE_PARTIAL_OUTGOING
   		OR  
			state := STATE_FULL_OUTGOING
	    END
			||
			
			lr := subt_short(lr, len)
    END;
    
	setOutgoingAndSend(bOff ,len) =  /*APDUException*/
	PRE
		bOff : JSHORT &
		bOff >= 0 &
		len : JSHORT &
		/*APDUException if 'len' is negative*/
		len >= 0 & 
		/*APDUException if 'len' is greater than 256 and 
		the currently selected applet does not implement 
		the javacardx.apdu.ExtendedLength interface*/ 
		len <= 256 & 
	    (state = STATE_INITIAL or 
	     state = STATE_PARTIAL_INCOMING or
	     state = STATE_FULL_INCOMING)

		/*APDUException.IO_ERROR on I/O error*/
	THEN
    	/*Verificar ---> lr == 0*/ 	
	   	state := STATE_FULL_OUTGOING ||
       	lr := 0
   	END;
	

	


	waitExtension = /*APDUException*/
	/*APDUException.ILLEGAL_USE if setOutgoingNoChaining() 
	previously invoked*/
    /*APDUException.IO_ERROR on I/O error*/
	BEGIN
		skip
	END



END
