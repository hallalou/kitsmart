/* ISO7816
 * Author: simone
 * Creation date: 23/04/11
 *
 * Extraído do LibSmart
 *
 */

/* Machine that declares ISO7816 contants, according to
   ISO7816 class of Java Card API version 2.2.2.  
*/
MACHINE ISO7816

SEES
	JShort,
	JByte
	
CONSTANTS
	/*Response status : No Error = (short)0x9000*/
	SW_NO_ERROR,
    /*Response status : Response bytes remaining = 0x6100*/
	SW_BYTES_REMAINING_00,
	/*Response status : Wrong length = 0x6700*/
	SW_WRONG_LENGTH,
    /*Response status : Security condition not satisfied = 0x6982*/
	SW_SECURITY_STATUS_NOT_SATISFIED,
	/*Response status : File invalid = 0x6983*/
	SW_FILE_INVALID,
	/*Response status : Data invalid = 0x6984*/
	SW_DATA_INVALID,
	/*Response status : Conditions of use not satisfied = 0x6985*/
	SW_CONDITIONS_NOT_SATISFIED,
	/*Response status : Command not allowed (no current EF) = 0x6986*/
	SW_COMMAND_NOT_ALLOWED,
    /*Response status : Applet selection failed = 0x6999*/
	SW_APPLET_SELECT_FAILED,
	/*Response status : Wrong data = 0x6A80*/
	SW_WRONG_DATA,
	/*Response status : Function not supported = 0x6A81*/
	SW_FUNC_NOT_SUPPORTED,
 	/*Response status : File not found = 0x6A82*/
	SW_FILE_NOT_FOUND,
	/*Response status : Record not found = 0x6A83*/
	SW_RECORD_NOT_FOUND,
    /*Response status : Incorrect parameters (P1,P2) = 0x6A86*/
	SW_INCORRECT_P1P2,
    /*Response status : Incorrect parameters (P1,P2) = 0x6B00*/
	SW_WRONG_P1P2,
    /*Response status : Correct Expected Length (Le) = 0x6C00*/
	SW_CORRECT_LENGTH_00,
	/*Response status : INS value not supported = 0x6D00*/          
	SW_INS_NOT_SUPPORTED,
	/*Response status : CLA value not supported = 0x6E00*/
	SW_CLA_NOT_SUPPORTED,
    /*Response status : No precise diagnosis = 0x6F00*/
	SW_UNKNOWN,
    /*Response status : Not enough memory space in the file = 0x6A84*/
	SW_FILE_FULL,
	/*Response status : Card does not support the operation on the specified logical channel = 0x6881*/
	SW_LOGICAL_CHANNEL_NOT_SUPPORTED,
	/*Response status : Card does not support secure messaging = 0x6882*/
	SW_SECURE_MESSAGING_NOT_SUPPORTED,
	/*Response status : Warning, card state unchanged = 0x6200*/
	SW_WARNING_STATE_UNCHANGED,
	/*Response status : Last command in chain expected = 0x6883*/
	SW_LAST_COMMAND_EXPECTED,
	/*Response status : Command chaining not supported = 0x6884*/
	SW_COMMAND_CHAINING_NOT_SUPPORTED,
  	/*APDU header offset : CLA = 0*/
	OFFSET_CLA,
    /*APDU header offset : INS = 1*/
	OFFSET_INS,
	/*APDU header offset : P1 = 2*/
	OFFSET_P1,
	/*APDU header offset : P2 = 3*/
	OFFSET_P2,
	/*APDU header offset : LC = 4*/
	OFFSET_LC,
	/*APDU command data offset : CDATA = 5*/
	OFFSET_CDATA,
	/*APDU command data offset with extended length input data : EXT_CDATA = 7*/ 
	OFFSET_EXT_CDATA,
	/*APDU command CLA : ISO 7816 = 0x00*/
	CLA_ISO7816,
	/*APDU command INS : SELECT = 0xA4*/          
	INS_SELECT,
	/*APDU command INS : EXTERNAL AUTHENTICATE = 0x82*/
	INS_EXTERNAL_AUTHENTICATE	
	
	  
PROPERTIES
	CLA_ISO7816 : JBYTE &
	CLA_ISO7816 = 0 &
	INS_EXTERNAL_AUTHENTICATE : JBYTE &
	INS_EXTERNAL_AUTHENTICATE = -126 &
	INS_SELECT : JBYTE &
	INS_SELECT = -92 &
	OFFSET_CDATA : JBYTE &
	OFFSET_CDATA = 5 &
	OFFSET_CLA : JBYTE &
	OFFSET_CLA = 0 &
	OFFSET_EXT_CDATA : JBYTE &
	OFFSET_EXT_CDATA = 7 &
	OFFSET_INS : JBYTE &
	OFFSET_INS = 1 &
	OFFSET_LC : JBYTE &
	OFFSET_LC = 4 &
	OFFSET_P1 : JBYTE &
	OFFSET_P1 = 2 &
	OFFSET_P2 : JBYTE &
	OFFSET_P2 = 3 &
	SW_APPLET_SELECT_FAILED : JSHORT &
	SW_APPLET_SELECT_FAILED = 27033 &
	SW_BYTES_REMAINING_00 : JSHORT &
	SW_BYTES_REMAINING_00 = 24832 &
	SW_CLA_NOT_SUPPORTED : JSHORT &
	SW_CLA_NOT_SUPPORTED = 28160 &
	SW_COMMAND_CHAINING_NOT_SUPPORTED : JSHORT &
	SW_COMMAND_CHAINING_NOT_SUPPORTED = 26756 &
	SW_COMMAND_NOT_ALLOWED : JSHORT &
	SW_COMMAND_NOT_ALLOWED = 27014 &
	SW_CONDITIONS_NOT_SATISFIED : JSHORT &
	SW_CONDITIONS_NOT_SATISFIED = 27013 &
	SW_CORRECT_LENGTH_00 : JSHORT &
	SW_CORRECT_LENGTH_00 = 27648 &
	SW_DATA_INVALID : JSHORT &
	SW_DATA_INVALID = 27012 &
	SW_FILE_FULL : JSHORT &
	SW_FILE_FULL = 27012 &
	SW_FILE_INVALID : JSHORT &
	SW_FILE_INVALID = 27011 &
	SW_FILE_NOT_FOUND : JSHORT &
	SW_FILE_NOT_FOUND = 27266 &
	SW_FUNC_NOT_SUPPORTED : JSHORT &
	SW_FUNC_NOT_SUPPORTED = 27265 &
	SW_INCORRECT_P1P2 : JSHORT &
	SW_INCORRECT_P1P2 = 27270 &
	SW_INS_NOT_SUPPORTED : JSHORT &
	SW_INS_NOT_SUPPORTED = 27904 &
	SW_LAST_COMMAND_EXPECTED : JSHORT &
	SW_LAST_COMMAND_EXPECTED = 26755 &
	SW_LOGICAL_CHANNEL_NOT_SUPPORTED : JSHORT &
	SW_LOGICAL_CHANNEL_NOT_SUPPORTED = 26753 &
	SW_NO_ERROR : JSHORT &
	SW_NO_ERROR = -28672 &
	SW_RECORD_NOT_FOUND : JSHORT &
	SW_RECORD_NOT_FOUND = 27267 &
	SW_SECURE_MESSAGING_NOT_SUPPORTED : JSHORT &
	SW_SECURE_MESSAGING_NOT_SUPPORTED = 26754 &
	SW_SECURITY_STATUS_NOT_SATISFIED : JSHORT &
	SW_SECURITY_STATUS_NOT_SATISFIED = 27010 &
	SW_UNKNOWN : JSHORT &
	SW_UNKNOWN = 28416 &
	SW_WARNING_STATE_UNCHANGED : JSHORT &
	SW_WARNING_STATE_UNCHANGED = 25088 &
	SW_WRONG_DATA : JSHORT &
	SW_WRONG_DATA = 27264 &
	SW_WRONG_LENGTH : JSHORT &
	SW_WRONG_LENGTH = 26368 &
	SW_WRONG_P1P2 : JSHORT &
	SW_WRONG_P1P2 = 27392
END
