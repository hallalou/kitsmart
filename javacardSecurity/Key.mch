/* Key
 *
 * The Key interface is the base interface for all keys.
 *
 * Author: simone
 * Creation date: 17/03/11
 */
MACHINE
    Key

SEES
	JShort,
	JByte,
	JBoolean,
	KeyBuilder

VARIABLES
	inicialState

INVARIANT
	inicialState : JBOOLEAN

INITIALISATION
	inicialState := FALSE

OPERATIONS
	state <-- isInitialized =
		CHOICE 
			state := TRUE
		OR
			state := FALSE
		END;

/*------------------------------------------------------------------------------------------*/
 	clearKey = 
		inicialState := FALSE;

/*------------------------------------------------------------------------------------------*/
	type <-- getType =
		ANY anyType 
		WHERE ((anyType : JBYTE) & 
		(anyType = TYPE_AES or 
		anyType = TYPE_AES_TRANSIENT_DESELECT or 
		anyType = TYPE_AES_TRANSIENT_RESET or
		anyType = TYPE_DES or 
		anyType = TYPE_DES_TRANSIENT_DESELECT or
		anyType = TYPE_DES_TRANSIENT_RESET or 
		anyType = TYPE_DSA_PRIVATE or
		anyType = TYPE_DSA_PUBLIC or 
		anyType = TYPE_EC_F2M_PRIVATE or
		anyType = TYPE_EC_F2M_PUBLIC or 
		anyType = TYPE_EC_FP_PRIVATE or
		anyType = TYPE_EC_FP_PUBLIC or 
		anyType = TYPE_RSA_CRT_PRIVATE or
		anyType = TYPE_RSA_PRIVATE or 
		anyType = TYPE_RSA_PUBLIC))
		THEN type := anyType
		END;

/*------------------------------------------------------------------------------------------*/
	valueSize <-- getSize =
		ANY key_valueSize
		WHERE ((key_valueSize : JSHORT) & (key_valueSize >= 0))
		THEN valueSize := key_valueSize
		END
END
