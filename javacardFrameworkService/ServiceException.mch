/* ServiceException
 * Author: simone
 * Creation date: 27/08/11
 */
MACHINE
    ServiceException

/*This class extends javacard.framework.CardRuntimeException */
EXTENDS
	CardRuntimeException

SEES
	JShort

CONSTANTS
 ILLEGAL_PARAM,
 DISPATCH_TABLE_FULL,
 COMMAND_DATA_TOO_LONG,
 CANNOT_ACCESS_IN_COMMAND,
 CANNOT_ACCESS_OUT_COMMAND,
 COMMAND_IS_FINISHED,
 REMOTE_OBJECT_NOT_EXPORTED

PROPERTIES
 ILLEGAL_PARAM : JSHORT &
 /*ILLEGAL_PARAM = 1 &*/
 DISPATCH_TABLE_FULL : JSHORT &
 /*DISPATCH_TABLE_FULL = 2 &*/
 COMMAND_DATA_TOO_LONG : JSHORT &
 /*COMMAND_DATA_TOO_LONG = 3 &*/
 CANNOT_ACCESS_IN_COMMAND : JSHORT &
 /*CANNOT_ACCESS_IN_COMMAND = 4 &*/
 CANNOT_ACCESS_OUT_COMMAND : JSHORT &
 /*CANNOT_ACCESS_OUT_COMMAND = 5 &*/
 COMMAND_IS_FINISHED : JSHORT &
 /*COMMAND_IS_FINISHED = 6 &*/
 REMOTE_OBJECT_NOT_EXPORTED : JSHORT
 /*REMOTE_OBJECT_NOT_EXPORTED = 7*/

/*This method is inherited from CardRuntimeException*/
/*OPERATIONS
	throwIt(reason) =
	PRE
		reason : JSHORT
	THEN
		skip
	END*/
END
