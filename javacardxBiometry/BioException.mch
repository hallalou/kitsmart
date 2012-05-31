/* BioException
 * Author: simone
 * Creation date: 31/08/11
 */
MACHINE
    BioException

SEES
	JShort

/*This class extends javacard.framework.CardRuntimeException */
EXTENDS
	CardRuntimeException

CONSTANTS
 ILLEGAL_VALUE,
 INVALID_DATA,
 NO_SUCH_BIO_TEMPLATE,
 NO_TEMPLATES_ENROLLED,
 ILLEGAL_USE

PROPERTIES
 ILLEGAL_VALUE : JSHORT &
 /*ILLEGAL_VALUE = 1 &*/
 INVALID_DATA : JSHORT &
 /*INVALID_DATA = 2 &*/
 NO_SUCH_BIO_TEMPLATE : JSHORT &
 /*NO_SUCH_BIO_TEMPLATE = 3 &*/
 NO_TEMPLATES_ENROLLED : JSHORT &
 /*NO_TEMPLATES_ENROLLED = 4 &*/
 ILLEGAL_USE : JSHORT
 /*ILLEGAL_USE = 5 &*/

/* This operations is inherited from CardRuntimeException
OPERATIONS
	throwIt(reason) =
	PRE
		reason : JSHORT
	THEN
		skip
	END
*/
END
