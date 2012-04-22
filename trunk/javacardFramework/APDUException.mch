/* APDUException - represents an APDU related exception. The APDU class throws  
 * JCRE-owned instances of APDU Exception. 
 * Author: simone
 * Creation date: 05/06/11
 */
MACHINE
    APDUException
    
/* This class extends javacard.framework.CardRuntimeException */
EXTENDS
	CardRuntimeException
   
SEES
	JShort

CONSTANTS
	ILLEGAL_USE, /* NOTE: also in SystemException */
	BUFFER_BOUNDS,
	BAD_LENGTH,
	IO_ERROR,
	NO_T0_GETRESPONSE,
	T1_IFD_ABORT,
	NO_T0_REISSUE	
	
PROPERTIES

	/*the method should not be invoked based on the current state of the APDU*/
	ILLEGAL_USE : JSHORT &
	ILLEGAL_USE = 1 &
	
	/*used by the APDU.sendBytes() method to indicate that the sum of buffer 
	offset parameter and the byte length parameter exceeds the APDU buffer size*/
	BUFFER_BOUNDS : JSHORT &
	BUFFER_BOUNDS = 2 &
 
	/*used by the APDU.setOutgoingLength() method to indicate len is negative, 
	or greater than 256 and the currently selected applet does not implement 
	the javacardx.apdu.ExtendedLength interface, or if non BLOCK CHAINED data 
	transfer is requested and len is greater than (IFSD-2), where IFSD is the 
	Outgoing Block Size. The -2 accounts for the status bytes in T=1*/
	BAD_LENGTH : JSHORT &
	BAD_LENGTH = 3 &
 
	/* an unrecoverable error occurred in the I/O transmission layer*/
	IO_ERROR : JSHORT &
	IO_ERROR = 4 &
 
	/* during T=0 protocol, the CAD did not return a GET RESPONSE command in 
	response to a <61xx> response status to send additional data. 
	The outgoing transfer has been aborted. No more data or status can be 
	sent to the CAD in this Applet.process() method*/
	NO_T0_GETRESPONSE : JSHORT &
	NO_T0_GETRESPONSE = 170 &
 
	/* during T=1 protocol, the CAD returned an ABORT S-Block command and aborted 
	the data transfer. The incoming or outgoing transfer has been aborted. 
	No more data can be received from the CAD. 
	No more data or status can be sent to the CAD in this Applet.process() method*/
	T1_IFD_ABORT : JSHORT &
	T1_IFD_ABORT = 171 &
 
	/*during T=0 protocol, the CAD did not reissue the same APDU command with the 
	corrected length in response to a <6Cxx> response status to request command 
	reissue with the specified length. The outgoing transfer has been aborted. 
	No more data or status can be sent to the CAD in this Applet.process() method*/
	NO_T0_REISSUE : JSHORT &
	NO_T0_REISSUE = 172
	
OPERATIONS

	/*Constructs an APDUException*/
	C_APDUException(reason) =
	PRE
		/*the reason for the exception.*/
		reason : JSHORT
	THEN
		skip
	END;

/*---------------------------------------------------------------------*/
	/* Throws the JCRE-owned instance of APDUException with the 
	specified reason. */
	throwIt_2 (reason) =
	/* throws: APDUException (always)*/
	PRE
		/*the reason for the exception*/
		reason : JSHORT
	THEN
		skip
	END
	
END
