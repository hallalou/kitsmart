/* Apdu - Model of javacard.framework.APDU class
 *
 * Authors: Kátia Moraes, Bruno Gomes, Simone Oliveira
 */
MACHINE
    Apdu_v2
    
/*ATENTION This class extends Object (java.lang.Object)*/
EXTENDS
	Object

SEES
 JShort,
 JByte,
 ApduSetsAndConstants,
 ISO7816
        /*
CONCRETE_CONSTANTS
    BUFFER_INDEX,
    BUFFER_HEADER_LENGTH,
    BUFFER_LENGTH,
    buffer
    
PROPERTIES 
    //BUFFER_INDEX : JBYTE &
    BUFFER_INDEX = 0 .. 132 &
    BUFFER_HEADER_LENGTH : JBYTE &
    BUFFER_HEADER_LENGTH = 5 &
    BUFFER_LENGTH : JBYTE &
    BUFFER_LENGTH >= 1 & 
    BUFFER_LENGTH <= 133 &
    buffer : seq(JBYTE) &
	size(buffer) >= 0 & 
	size(buffer) <= BUFFER_LENGTH
	*/
/*	
PROPERTIES
    OFFSET_LC : dom(buffer) &
 	OFFSET_CDATA : dom(buffer) & 
 	OFFSET_CLA : dom(this'buffer) &
 	OFFSET_EXT_CDATA : dom(buffer) &
 	OFFSET_INS : dom(buffer) &
 	OFFSET_LC : dom(buffer) &
 	OFFSET_P1 : dom(buffer) &
 	OFFSET_P2 : dom(buffer) 
 */
CONCRETE_VARIABLES
    this/*, */
 /* The current state of data processing */
	/*state, */
 /* The APDU buffer array 
 buffer, */
 /* The length of the incoming data field of the command */
	/*Lc,*/
 /* The expected length of the response (if any) */
	/*Le,*/
 /* The real effective length og the response (if any) */
 	/*Lr*/
    

INVARIANT
    this : APDU &
    this'le >= 0 &
    this'le <= 256 &
    this'state : JBYTE & 
    this'state : STATE_INITIAL .. STATE_FULL_OUTGOING &
    size(this'buffer) >= 0 & 
 	size(this'buffer) <= BUFFER_LENGTH
/* 	Lc : JSHORT &
 	Le : JSHORT & 
 	Le >= 0 & 
 	Le <= 256 &
 	Lr : JSHORT*/

INITIALISATION
		this := rec (buffer : [], 
        			state : STATE_INITIAL, 
        			lc : 0, 
        			le : 0, 
        			lr : 0,  
        			null : FALSE) /*||
    	thisstate := STATE_INITIAL ||
    	Lc, Le, Lr := 0, 0, 0 */

OPERATIONS
	result <-- getBuffer =
		BEGIN
	    	result := this'buffer
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
		(this'state = STATE_INITIAL or 
		 this'state = STATE_PARTIAL_INCOMING or
		 this'state = STATE_FULL_INCOMING)
		/*APDUException if this method, or setOutgoingNoChaining() method already invoked*/
		/*APDUException I/O error*/
	THEN 
  		this'state := STATE_OUTGOING  ||
		result := this'le
   	END;
	
	result <-- setOutgoingNoChaining = /*APDUException*/
    	PRE
    		(this'state = STATE_INITIAL or 
       		 this'state = STATE_PARTIAL_INCOMING or
       		 this'state = STATE_FULL_INCOMING)

		/*APDUException if this method, or setOutgoing() method already invoked*/
    	/*APDUException I/O error*/
	THEN
   		this'state := STATE_OUTGOING ||
		result := this'le
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
       		this'state = STATE_OUTGOING
       		/*APDUException if setOutgoing() or setOutgoingNoChaining() 
       		not called or if setOutgoingAndSend() already invoked, 
       		or this method already invoked*/
			/*APDUException I/O error*/
    THEN
    	this := rec(this'buffer, STATE_OUTGOING_LENGTH_KNOWN, 
   	            		this'lc, this'le, len, FALSE)
   	END;

	result <-- receiveBytes(bOff) = /*APDUException*/
   	PRE
       		bOff : JSHORT &
       		bOff >= 0 & 
       		bOff < BUFFER_LENGTH & 
       		this'state = STATE_PARTIAL_INCOMING
       		/*APDUException if setIncomingAndReceive() not called or 
       		if setOutgoing() or setOutgoingNoChaining() previously invoked*/
		/*APDUException if not enough buffer space for incoming block size*/
		/*APDUException on I/O error.*/
		/*APDUException if T=1 protocol is in use and the CAD sends 
		in an ABORT S-Block command to abort the data transfer*/
    	THEN
        	CHOICE 
       			this'state := STATE_PARTIAL_INCOMING 
        	OR
       			this'state := STATE_FULL_INCOMING
        	END
        	||
		/*ALTERAÇÃO DO any FEITA AQUI*/
		result : (result : JSHORT & 
            	  result >=0 &
            	  result <= (this'buffer)(OFFSET_LC)  &
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
        		this'state = STATE_INITIAL
    		THEN
        		CHOICE
        			this'state := STATE_PARTIAL_INCOMING
        		OR
            		this'state := STATE_FULL_INCOMING 
        		END
			||
			/*ANY anyResult 
			WHERE 
			anyResult : JSHORT & 
		    	anyResult >= 0  & 
		    	anyResult <= buffer(OFFSET_LC) & 
		    	buffer(OFFSET_LC) + BUFFER_HEADER_LENGTH <= BUFFER_LENGTH 
	   		THEN 
			*/
			result :(result : JSHORT &
				     result >= 0 &
				     result <= (this'buffer)(OFFSET_LC)
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
       		len <= this'lr &
   	   		this'state = STATE_OUTGOING_LENGTH_KNOWN

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
   	        this := rec(this'buffer, STATE_FULL_OUTGOING, 
   	            		this'lc, this'le, subt_short(this'lr, len), FALSE)
			/*this'state := STATE_PARTIAL_OUTGOING*/
   		OR  
			skip/*this'state := STATE_FULL_OUTGOING*/
	    END
		/*	||*/
		/*this'lr := subt_short(this'lr, len)*/
   	END;
    
	sendBytesLong(outData ,bOff ,len) = /*APDUException, SecurityException*/
   	PRE
   		outData : seq(JBYTE) & 
   	   	bOff : JSHORT & 
		bOff >= 0 &
   	    len : JSHORT &
		len >= 0 & 
		len <= this'lr &
		this'state = STATE_OUTGOING_LENGTH_KNOWN 

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
   	        this := rec(this'buffer, STATE_FULL_OUTGOING, 
   	            		this'lc, this'le, subt_short(this'lr, len), FALSE)
			/*this'state := STATE_PARTIAL_OUTGOING*/
   		OR  
			skip/*this'state := STATE_FULL_OUTGOING*/
	    END
		/*	||*/
		/*this'lr := subt_short(this'lr, len)*/
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
	    (this'state = STATE_INITIAL or 
	     this'state = STATE_PARTIAL_INCOMING or
	     this'state = STATE_FULL_INCOMING)

		/*APDUException.IO_ERROR on I/O error*/
	THEN
    	/*Verificar ---> lr == 0*/ 
    	this := rec(this'buffer, STATE_FULL_OUTGOING, this'lc, this'le, 0, FALSE)
/*   	   	this'state := STATE_FULL_OUTGOING ||*/
/*this'lr := 0*/       	
   	END;

   	result <-- getCurrentState = 
	BEGIN
	    result := this'state
	END;
	
	apdu <-- getCurrentAPDU = /*SecurityException*/
	/*SecurityException if the current context is not the 
	context of the currently selected applet instance or this 
	method was not called, directly or indirectly, from the 
	applet's process method (called directly by the Java Card 
	runtime environment), or the method is called during applet 
	installation or deletion*/
	BEGIN
		apdu := this
	END;
	
	apdu <-- getCurrentAPDUBuffer = /*SecurityException*/
	/*SecurityException if the current context is not the context 
	of the currently selected applet instance or this method was not 
	called, directly or indirectly, from the applet's process 
	method (called directly by the Java Card runtime environment), 
	or the method is called during applet installation or deletion*/
	BEGIN
		apdu := this'buffer
	END;

	CLA <-- getCLAChannel = /*SecurityException*/
	BEGIN
		CLA :: cast_byte(0) .. cast_byte(19)
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
			length := this'lc
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
