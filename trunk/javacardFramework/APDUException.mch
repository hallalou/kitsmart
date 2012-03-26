/* APDUException
 * Author: simone
 * Creation date: 05/06/11
 */
MACHINE
    APDUException
    
/*ATENTION This class extends CardRuntimeException (javacard.framework.CardRuntimeException)*/
EXTENDS
	CardRuntimeException
   
SEES
 JShort,
 JByte


CONSTANTS
 ILLEGAL_USE,
 BUFFER_BOUNDS,
 BAD_LENGTH,
 IO_ERROR,
 NO_T0_GETRESPONSE,
 T1_IFD_ABORT,
 NO_T0_REISSUE	
	
PROPERTIES
 ILLEGAL_USE : JSHORT &
 /*ILLEGAL_USE = 1 &*/
 BUFFER_BOUNDS : JSHORT &
 /*BUFFER_BOUNDS = 2 &*/
 BAD_LENGTH : JSHORT &
 /*BAD_LENGTH = 3 &*/
 IO_ERROR : JSHORT &
 /*IO_ERROR = 4 &*/
 NO_T0_GETRESPONSE : JSHORT &
 /*NO_T0_GETRESPONSE = 170 &*/
 T1_IFD_ABORT : JSHORT &
 /*T1_IFD_ABORT = 171 &*/
 NO_T0_REISSUE : JSHORT
 /*NO_T0_REISSUE = 172*/
 
 
/*This operation is inherited from CardRuntimeException*/
/*OPERATIONS
	throwIt(reason) = 
	PRE
		reason : JSHORT
	THEN
		skip
	END*/
END
