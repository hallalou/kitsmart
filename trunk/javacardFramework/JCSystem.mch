/* JCSystem
 * Author: simone
 * Creation date: 07/06/11
 *
 * Extraído em parte de LibsBSmart
 */
MACHINE
    JCSystem
    
/*ATENTION This class extends Object (java.lang.Object)*/
EXTENDS
	Object
    
SEES
 JShort,
 JByte,
 JBoolean,
 Shareable,
 Classes

CONSTANTS
 MEMORY_TYPE_PERSISTENT,
 MEMORY_TYPE_TRANSIENT_RESET,
 MEMORY_TYPE_TRANSIENT_DESELECT,
 NOT_A_TRANSIENT_OBJECT,
 CLEAR_ON_RESET,
 CLEAR_ON_DESELECT,

 MAKEARRAYBOOL,
 MAKEARRAYBYTE,
 MAKEARRAYSHORT,
 MAKEARRAYOBJECT

PROPERTIES
 MEMORY_TYPE_PERSISTENT : JBYTE &
 /*MEMORY_TYPE_PERSISTENT = 0 &*/
 MEMORY_TYPE_TRANSIENT_RESET : JBYTE &
 /*MEMORY_TYPE_TRANSIENT_RESET = 1 &*/
 MEMORY_TYPE_TRANSIENT_DESELECT : JBYTE &
 /*MEMORY_TYPE_TRANSIENT_DESELECT = 2 &*/
 NOT_A_TRANSIENT_OBJECT : JBYTE &
 /*NOT_A_TRANSIENT_OBJECT = 0 &*/
 CLEAR_ON_RESET : JBYTE &
 /*CLEAR_ON_RESET = 1 &*/
 CLEAR_ON_DESELECT : JBYTE &
 /*CLEAR_ON_DESELECT = 2*/

 MAKEARRAYBOOL : seq(JBOOLEAN) &
 MAKEARRAYBYTE : seq(JBYTE) &
 MAKEARRAYSHORT : seq(JSHORT) &
 MAKEARRAYOBJECT : seq(/*OBJECT*/JSHORT)

CONCRETE_VARIABLES
	transDepth
	
INVARIANT
	transDepth : JBYTE &
	(transDepth = 0 or transDepth = 1)
	
INITIALISATION
	transDepth := 0

OPERATIONS
	result <-- isTransient(theObj) = 
	PRE
		/*theObj's type is Object*/
		theObj : JSHORT/*OBJECT*/
	THEN
		CHOICE
			result := NOT_A_TRANSIENT_OBJECT
		OR
			result := CLEAR_ON_RESET
		OR
			result := CLEAR_ON_DESELECT
		END
	END;

	arrayBool <-- makeTransienteBooleanArray(length, event) = /*NegativeArraySizeException, SystemException*/
	PRE
		length : JSHORT &
		length >= 0 & /*NegativeArraySizeException if the 'length' parameter is negative*/
		event : JBYTE &
		(event = CLEAR_ON_RESET or
		event = CLEAR_ON_DESELECT) /*SystemException.ILLEGAL_VALUE if 'event' is not a valid event code*/

		/*SystemException.NO_TRANSIENT_SPACE if sufficient transient space is not available*/
		/*SystemException.ILLEGAL_TRANSIENT if the current applet context is not the currently selected applet context and CLEAR_ON_DESELECT is specified*/
	THEN
		/*ATENTION in how the array was returned */
		ANY jcsystem_arrayBool
		WHERE (jcsystem_arrayBool : MAKEARRAYBOOL) /*& (size(anyArrayBool) = length)*/
		THEN arrayBool := jcsystem_arrayBool
		END
	END;

	arrayByte <-- makeTransientByteArray(length, event) = /*NegativeArraySizeException, SystemException*/
	PRE
		length : JSHORT &
		length >= 0 & /*NegativeArraySizeException if the 'length' parameter is negative*/
		event : JBYTE &
		(event = CLEAR_ON_RESET or
		event = CLEAR_ON_DESELECT) /*SystemException.ILLEGAL_VALUE if 'event' is not a valid event code*/

		/*SystemException.NO_TRANSIENT_SPACE if sufficient transient space is not available*/
		/*SystemException.ILLEGAL_TRANSIENT if the current applet context is not the currently selected applet context and CLEAR_ON_DESELECT is specified*/
	THEN
		/*ATENTION in how the array was returned */
		ANY jcsystem_arrayByte
		WHERE (jcsystem_arrayByte : MAKEARRAYBYTE) /*& (size(anyArrayByte) = length)*/
		THEN arrayByte := jcsystem_arrayByte
		END
	END;

	arrayShort <-- makeTransientShortArray(length, event) = /*NegativeArraySizeException, SystemException*/
	PRE
		length : JSHORT &
		length >= 0 & /*NegativeArraySizeException if the 'length' parameter is negative */
		event : JBYTE &
		(event = CLEAR_ON_RESET or
		event = CLEAR_ON_DESELECT) /*SystemException.ILLEGAL_VALUE if 'event' is not a valid event code*/

		/*SystemException.NO_TRANSIENT_SPACE if sufficient transient space is not available*/
		/*SystemException.ILLEGAL_TRANSIENT if the current applet context is not the currently selected applet context and CLEAR_ON_DESELECT is specified*/
	THEN
		/*ATENTION in how the array was returned */
		ANY jcsystem_arrayShort
		WHERE (jcsystem_arrayShort : MAKEARRAYSHORT) /*& (size(anyArrayShort) = length)*/
		THEN arrayShort := jcsystem_arrayShort
		END
	END;

	arrayObject <-- makeTransientObjectArray(length, event) = /*NegativeArraySizeException, SystemException*/
	PRE
		length : JSHORT &
		length >= 0 & /*NegativeArraySizeException if the 'length' parameter is negative */
		event : JBYTE &
		(event = CLEAR_ON_RESET or
		event = CLEAR_ON_DESELECT) /*SystemException.ILLEGAL_VALUE if event is not a valid event code*/

		/*SystemException.NO_TRANSIENT_SPACE if sufficient transient space is not available*/
		/*SystemException.ILLEGAL_TRANSIENT if the current applet context is not the currently selected applet context and CLEAR_ON_DESELECT is specified*/
	THEN
		/*ATENTION in how the array was returned */
		/* the type is object, but was made as a short*/
		ANY jcsystem_arrayObject
		WHERE (jcsystem_arrayObject : MAKEARRAYOBJECT) /*& (size(anyArrayObject) = length)*/
		THEN arrayObject := jcsystem_arrayObject
		END
	END;

	version <-- getVersion =
	BEGIN
		version :: JSHORT	
	END;

	AID <-- getAID =
	BEGIN
		/*Assigns a byte array to the variable AID or null*/
		CHOICE
		    AID := MAKEARRAYBYTE
		OR
		    AID := []
		END
	END;
		
	AID <-- lookupAID(buffer, offset, length) = 
	PRE
		buffer : seq1(JBYTE) &
		offset : JSHORT &
		offset >= 0 &
		length : JBYTE &
		length > 0 /*A VM exception is thrown if 'buffer' is null, or if 'offset' or 'length' are out of range*/
	THEN
		CHOICE
			/*Assigns a byte array to the variable AID*/
			AID := MAKEARRAYBYTE
		OR
			/*Assigns a empty sequence to the variable AID*/
			AID := []
		END
	END;

	beginTransaction = /*TransactionException*/
	/*TransactionException.IN_PROGRESS if a transaction is already in progress*/
	PRE
		transDepth = 0	
	THEN
		transDepth := 1
	END;

	abortTransaction = /*TransactionException*/
	/*TransactionException.NOT_IN_PROGRESS if a transaction is not in progress.*/
	PRE
		transDepth = 1
	THEN
		transDepth := 0
	END;
	
	commitTransaction = /*TransactionException*/
	/*TransactionException.NOT_IN_PROGRESS if a transaction is not in progress*/
	PRE
		transDepth = 1
	THEN
		transDepth := 0
	END;

	result <-- getTransactionDepth = 
		CHOICE
			result := 1
		OR
			result := 0
		END;
	
	numBytes <-- getUnusedCommitCapacity = 
		ANY jcsystem_numBytes
		WHERE (jcsystem_numBytes : JSHORT) &
		(jcsystem_numBytes <= 32767)
		THEN numBytes := jcsystem_numBytes
		END;

	numBytes <-- getMaxCommitCapacity = 
		ANY jcsystem_numBytes
		WHERE (jcsystem_numBytes : JSHORT) &
		(jcsystem_numBytes <= 32767)
		THEN numBytes := jcsystem_numBytes
		END;

	AID <-- getPreviousContextAID = 
		CHOICE
			/*Assigns a byte array to the variable AID*/
			AID := MAKEARRAYBYTE
		OR
			/*Assigns a empty sequence to the variable AID*/
			AID := []
		END;

	memory <-- getAvailableMemory(memoryType) = /*SystemException*/	
	PRE
		memoryType : JBYTE &
		(memoryType = MEMORY_TYPE_PERSISTENT or
		memoryType = MEMORY_TYPE_TRANSIENT_RESET or
		memoryType = MEMORY_TYPE_TRANSIENT_DESELECT) /*SystemException.ILLEGAL_VALUE if memoryType is not a valid memory type. */
	THEN
		memory :: JSHORT
	END;

	result <-- getAppletShareableInterfaceObject(serverAID, parameter) = 
	PRE
		/*serverAID's type is AID*/
		serverAID : seq(JBYTE) &
		parameter : JBYTE

		/*SecurityException - if the server applet is not multiselectable and is currently active on another logical channel */
	THEN
		CHOICE
				result := rec(object : SHAREABLEobject , null : FALSE)
			OR
				ANY vv WHERE vv : CLASSES
				THEN
					result := rec(object : vv, null : TRUE)
				END 
			END
		/*END*/
	END;

	result <-- isObjectDeletionSupported = 
		CHOICE
			result := TRUE
		OR
			result := FALSE
		END;
	
	requestObjectDeletion = /*SystemException*/
	/*SystemException.ILLEGAL_USE if the object deletion mechanism is not implemented*/
		skip;

	channel <-- getAssignedChannel = 
		ANY jcsystem_channel
		WHERE (jcsystem_channel : JBYTE) &
		(jcsystem_channel : 0 .. 19)
		THEN channel := jcsystem_channel
		END;

	result <-- isAppletActive(theApplet) = 
	PRE
		/*theApplet's type is AID, AID can returns bytes or bool*/
		theApplet : seq(JBYTE)
	THEN
		CHOICE
			result := TRUE
		OR
			result := FALSE
		END
	END
END
