/** Apdu - Model of javacard.framework.APDU class
 *
 * Authors: Kátia Moraes, Bruno Gomes, Simone Oliveira
 *
 * Versão 1 - struct apenas para o retorno do APDU completo (this)
 *
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
	 	
	/* Returns the logical channel number associated with the current 			APDU command based on the CLA byte.  With the    
      current modeling we don't have this information. Here, we only model the
      20 possible return values.*/ 	
	CLA <-- getCLAChannel = 
	/* throws: SecurityException*/
		BEGIN
		CLA :: cast_byte(0) .. cast_byte(19)
		END;

	 	
	blocksize <-- getInBlockSize = 
		ANY apdu_anyBlocksize
		WHERE (apdu_anyBlocksize : JSHORT) &
	     	  (apdu_anyBlocksize >= 0)
		THEN blocksize := apdu_anyBlocksize
		END;

	blocksize <-- getOutBlockSize = 
		ANY apdu_anyBlocksize
		WHERE (apdu_anyBlocksize : JSHORT) &
		(apdu_anyBlocksize >= 0)
		THEN blocksize := apdu_anyBlocksize
		END;

	protocol <-- getProtocol = 
		BEGIN
		CHOICE
			protocol := PROTOCOL_TO
		OR
			protocol := PROTOCOL_T1 
		END
	END;

	NAD <-- getNAD = 
		BEGIN
			NAD := 0 
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

	result <-- receiveBytes(bOff) = /*APDUException*/
   	PRE
       		bOff : JSHORT &
       		bOff >= 0 & 
       		bOff < BUFFER_LENGTH & 
       		state = STATE_PARTIAL_INCOMING
       		/*APDUException if setIncomingAndReceive() not called or 
       		if setOutgoing() or setOutgoingNoChaining() previously invoked*/
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
		/*ALTERAÇÃO DO any FEITA AQUI*/
		result : (result : JSHORT & 
            	  result >=0 &
            	  result <= (buffer)(OFFSET_LC)  &
           		  sum_short(result,bOff) <= BUFFER_LENGTH)        	
		/*ANY apdu_result 
        	WHERE 
       		apdu_result : JSHORT & 
       		apdu_result >= 0  & 
       		apdu_result <= buffer(OFFSET_LC) & 
       		sum_short(apdu_result,bOff) <= BUFFER_LENGTH*/
  			/*THEN */
			/*result :: JSHORT*/
    		/*END*/
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

   	result <-- getCurrentState = 
	BEGIN
	    result := state
	END;
	
	apdu <-- getCurrentAPDU = /*SecurityException*/
	/*SecurityException if the current context is not the 
	context of the currently selected applet instance or this 
	method was not called, directly or indirectly, from the 
	applet's process method (called directly by the Java Card 
	runtime environment), or the method is called during applet 
	installation or deletion*/
	BEGIN
		apdu := buffer/*rec (buffer : buffer, state : state, lc : lc, le : le, lr : lr, null : FALSE)*/
	END;
	
	apdu <-- getCurrentAPDUBuffer = /*SecurityException*/
	/*SecurityException if the current context is not the context 
	of the currently selected applet instance or this method was not 
	called, directly or indirectly, from the applet's process 
	method (called directly by the Java Card runtime environment), 
	or the method is called during applet installation or deletion*/
	BEGIN
		apdu := buffer
	END;


	waitExtension = /*APDUException*/
	/*APDUException.ILLEGAL_USE if setOutgoingNoChaining() 
	previously invoked*/
    /*APDUException.IO_ERROR on I/O error*/
	BEGIN
		skip
	END;

	result <-- isCommandChainingCLA = 
	BEGIN
		CHOICE
			result := TRUE
		OR
			result := FALSE
		END
	END;

	result <-- isSecureMessagingCLA = 
	BEGIN
		CHOICE
			result := TRUE
		OR
			result := FALSE
		END
	END;

	result <-- isISOInterindustryCLA = 
	BEGIN
		CHOICE
			result := TRUE
		OR
			result := FALSE
		END
	END;

	length <-- getIncomingLength = 
	/*APDUException.ILLEGAL_USE if setIncomingAndReceive() 
	not called or if setOutgoing() or 
	setOutgoingNoChaining() previously invoked*/
	BEGIN
		CHOICE
			length := lc
		OR
			length := 0
		END
	END;

	cdata <-- getOffsetCdata = /*APDUException*/
	/*APDUException.ILLEGAL_USE if setIncomingAndReceive() not called or if setOutgoing() or setOutgoingNoChaining() previously invoked*/
	BEGIN
		CHOICE
			cdata := cast_byte(5) /*when Lc is 1 byte*/
		OR
			cdata := cast_byte(7) /*when Lc is 3 bytes*/
		END
	END
END
