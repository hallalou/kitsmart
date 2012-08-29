/* ExternalException
 *
 * ExternalException represents an external subsystem related exception.
 *
 * Author: simone
 * Creation date: 31/08/11
 */
MACHINE
    ExternalException

SEES
	JByte,
	JShort

CONSTANTS
	NO_SUCH_SUBSYSTEM,
	INVALID_PARAM,
	INTERNAL_ERROR

PROPERTIES
	NO_SUCH_SUBSYSTEM : JSHORT &
	NO_SUCH_SUBSYSTEM = 1 &
	
	INVALID_PARAM : JSHORT &
	INVALID_PARAM = 2 &
	
	INTERNAL_ERROR : JSHORT &
	INTERNAL_ERROR = 3

OPERATIONS
	throwIt(reason) =
	PRE
		reason : JSHORT
	THEN
		skip
	END
END
