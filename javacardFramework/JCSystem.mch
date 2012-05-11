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
	
	/*used to return sequences*/
	MAKEARRAYBOOL,
	MAKEARRAYBYTE,
	MAKEARRAYSHORT,
	MAKEARRAYOBJECT

PROPERTIES
    
      MEMORY_TYPE_PERSISTENT : JBYTE &
	MEMORY_TYPE_PERSISTENT = 0 &
	
	MEMORY_TYPE_TRANSIENT_RESET : JBYTE &
	MEMORY_TYPE_TRANSIENT_RESET = 1 &
	
	MEMORY_TYPE_TRANSIENT_DESELECT : JBYTE &
	MEMORY_TYPE_TRANSIENT_DESELECT = 2 &
	
	NOT_A_TRANSIENT_OBJECT : JBYTE &
	NOT_A_TRANSIENT_OBJECT = 0 &
	
	CLEAR_ON_RESET : JBYTE &
	CLEAR_ON_RESET = 1 &
	
	CLEAR_ON_DESELECT : JBYTE &
	CLEAR_ON_DESELECT = 2 &

	MAKEARRAYBOOL : seq(JBOOLEAN) &
	MAKEARRAYBYTE : seq(JBYTE) &
	MAKEARRAYSHORT : seq(JSHORT) &
	MAKEARRAYOBJECT : seq(/*OBJECT*/JSHORT)

OPERATIONS
    
    /* Aborts the atomic transaction. 
    The contents of the commit buffer are discarded. */
	abortTransaction = 
	/* throws: TransactionException */
	/* TransactionException.NOT_IN_PROGRESS if a transaction is not in progress.*/
	BEGIN
	    skip
	END;

/*-------------------------------------------------------------------------------*/
	/* Begins an atomic transaction. */
	beginTransaction = 
	/* throws: TransactionException */
	/* TransactionException.IN_PROGRESS if a transaction is already in progress*/
	BEGIN
	    skip
	END;

/*-------------------------------------------------------------------------------*/	
	/* Commits an atomic transaction. 
	   The contents of commit buffer are atomically committed. */
	commitTransaction = 
	/* throws: TransactionException */
	/* TransactionException.NOT_IN_PROGRESS if a transaction is not in progress */
	BEGIN
	    skip
	END;

/*-------------------------------------------------------------------------------*/	
	/* Returns the JCRE-owned instance of the AID object associated with 
	   the current applet context, or null if the Applet.register() method 
	   has not yet been invoked. */
	aid <-- getAID =
	BEGIN
		aid :: AID
	END;

/*-------------------------------------------------------------------------------*/	
	/* Called by a client applet to get a server applet?s shareable 
	   interface object. */
	result <-- getAppletShareableInterfaceObject(serverAID, parameter) = 
	/* throws: SecurityException */ 
	PRE
		/*  the AID of the server applet */
		serverAID : AID &
		/* optional parameter data */
		parameter : JBYTE

		/* SecurityException - if the server applet is not multiselectable 			and is currently active on another logical channel */
	THEN
		result :: SHAREABLE
	END;
	
/*-------------------------------------------------------------------------------*/	
	/* called to obtain the logical channel number assigned to the 
	   currently selected applet instance. */
	channel <-- getAssignedChannel = 
	BEGIN
		channel : ((channel : JBYTE) & (channel : 0 .. 19))
	END;

/*-------------------------------------------------------------------------------*/
	/* Obtains the amount of memory of the speci?ed type that is 
	   available to the applet. */
	memory <-- getAvailableMemory(memoryType) = 
	/* throws: SystemException */	
	PRE
	    /* the type of memory being queried */
	    /* SystemException.ILLEGAL_VALUE if memoryType is not a valid 	
	       memory type. */
		memoryType : JBYTE &
	    (memoryType = MEMORY_TYPE_PERSISTENT or
		memoryType = MEMORY_TYPE_TRANSIENT_RESET or
		memoryType = MEMORY_TYPE_TRANSIENT_DESELECT)
	THEN
		memory :: JSHORT
	END;

/*-------------------------------------------------------------------------------*/
	/* Returns the total number of bytes in the commit buffer. */
	numBytes <-- getMaxCommitCapacity = 
	BEGIN
	    numBytes : ((numBytes : JSHORT) & 
	    (numBytes >= 0) & (numBytes <= 32767))
	END;
	
/*-------------------------------------------------------------------------------*/	
    result <-- isTransient(theObj) = 
	PRE
		theObj : OBJECT
	THEN
		CHOICE
			result := NOT_A_TRANSIENT_OBJECT
		OR
			result := CLEAR_ON_RESET
		OR
			result := CLEAR_ON_DESELECT
		END
	END;

/*-------------------------------------------------------------------------------*/
	arrayBool <-- makeTransienteBooleanArray(length, event) = 
	/* throws: NegativeArraySizeException,
		SystemException */
	PRE
		/* length - the length of the boolean array */
		/*NegativeArraySizeException if the 'length' parameter is negative*/
		length : JSHORT &		
		length >= 0 & 
		
		/*event - the CLEAR_ON... event which causes the array elements to be 
		cleared */
		/*SystemException.ILLEGAL_VALUE if 'event' is not a valid event code*/
		event : JBYTE &		
		(event = CLEAR_ON_RESET or
		event = CLEAR_ON_DESELECT) 

		/*SystemException.NO_TRANSIENT_SPACE if sufficient transient space is 
		not available*/
		/*SystemException.ILLEGAL_TRANSIENT if the current applet context is not 
		the currently selected applet context and CLEAR_ON_DESELECT is specified*/
	THEN
		/*ATENTION in how the array was returned */
		ANY jcsystem_arrayBool
		WHERE (jcsystem_arrayBool : MAKEARRAYBOOL)
		THEN arrayBool := jcsystem_arrayBool
		END
	END;

/*-------------------------------------------------------------------------------*/
	arrayByte <-- makeTransientByteArray(length, event) = 
	/* throws: NegativeArraySizeException,
		SystemException */
	PRE
		/* length - the length of the byte array */
		/* NegativeArraySizeException if the 'length' parameter is negative */
		length : JSHORT &		
		length >= 0 & 
		
		/* event - the CLEAR_ON... event which causes the array elements to be 
		cleared */
		/*SystemException.ILLEGAL_VALUE if 'event' is not a valid event code*/
		event : JBYTE &		
		(event = CLEAR_ON_RESET or
		event = CLEAR_ON_DESELECT) 

		/*SystemException.NO_TRANSIENT_SPACE if sufficient transient space is not 
		available*/
		/*SystemException.ILLEGAL_TRANSIENT if the current applet context is not 
		the currently selected applet context and CLEAR_ON_DESELECT is specified*/
	THEN
		/*ATENTION in how the array was returned */
		ANY jcsystem_arrayByte
		WHERE (jcsystem_arrayByte : MAKEARRAYBYTE)
		THEN arrayByte := jcsystem_arrayByte
		END
	END;

/*-------------------------------------------------------------------------------*/
	arrayShort <-- makeTransientShortArray(length, event) = 
	/* throws: NegativeArraySizeException,
		SystemException */
	PRE
		/* length - the length of the short array */
		/*NegativeArraySizeException if the 'length' parameter is negative */
		length : JSHORT &		
		length >= 0 &
		
		/* event - the CLEAR_ON... event which causes the array elements to be 
		cleared */
		/*SystemException.ILLEGAL_VALUE if 'event' is not a valid event code*/
		event : JBYTE &		
		(event = CLEAR_ON_RESET or
		event = CLEAR_ON_DESELECT) 

		/*SystemException.NO_TRANSIENT_SPACE if sufficient transient space is not 
		available*/
		/*SystemException.ILLEGAL_TRANSIENT if the current applet context is not 
		the currently selected applet context and CLEAR_ON_DESELECT is specified*/
	THEN
		/*ATENTION in how the array was returned */
		ANY jcsystem_arrayShort
		WHERE (jcsystem_arrayShort : MAKEARRAYSHORT)
		THEN arrayShort := jcsystem_arrayShort
		END
	END;

/*-------------------------------------------------------------------------------*/
	arrayObject <-- makeTransientObjectArray(length, event) = 
	/* throws: NegativeArraySizeException,
		SystemException */
	PRE
		/* length - the length of the Object array */
		/*NegativeArraySizeException if the 'length' parameter is negative */
		length : JSHORT &		
		length >= 0 &
		
		/* event - the CLEAR_ON... event which causes the array elements to be 
		cleared */
		/*SystemException.ILLEGAL_VALUE if event is not a valid event code*/
		event : JBYTE &		
		(event = CLEAR_ON_RESET or
		event = CLEAR_ON_DESELECT) 

		/*SystemException.NO_TRANSIENT_SPACE if sufficient transient space is not 
		available*/
		/*SystemException.ILLEGAL_TRANSIENT if the current applet context is not 
		the currently selected applet context and CLEAR_ON_DESELECT is specified*/
	THEN
		/*ATENTION in how the array was returned */
		ANY jcsystem_arrayObject
		WHERE (jcsystem_arrayObject : MAKEARRAYOBJECT)
		THEN arrayObject := jcsystem_arrayObject
		END
	END;

/*-------------------------------------------------------------------------------*/
	version <-- getVersion =
	BEGIN
		version :: JSHORT	
	END;

/*-------------------------------------------------------------------------------*/		
	AID <-- lookupAID(buffer, offset, length) = 
	PRE
		/* buffer - byte array containing the AID bytes */
		/*A VM exception is thrown if 'buffer' is null, 
		or if 'offset' or 'length' are out of range*/
		buffer : seq1(JBYTE) &
		
		/* offset - offset within buffer where AID bytes begin */
		offset : JSHORT &
		offset >= 0 &
		
		/* length - length of AID bytes in buffer */
		length : JBYTE &
		length > 0
	THEN
		CHOICE
			/*Assigns a byte array to the variable AID*/
			AID := MAKEARRAYBYTE
		OR
			/*Assigns a empty sequence to the variable AID*/
			AID := []
		END
	END;

/*-------------------------------------------------------------------------------*/
	result <-- getTransactionDepth = 
		CHOICE
			result := 1
		OR
			result := 0
		END;

/*-------------------------------------------------------------------------------*/		
	numBytes <-- getUnusedCommitCapacity = 
		ANY jcsystem_numBytes
		WHERE (jcsystem_numBytes : JSHORT) &
		(jcsystem_numBytes <= 32767)
		THEN numBytes := jcsystem_numBytes
		END;

/*-------------------------------------------------------------------------------*/
	AID <-- getPreviousContextAID = 
		CHOICE
			/*Assigns a byte array to the variable AID*/
			AID := MAKEARRAYBYTE
		OR
			/*Assigns a empty sequence to the variable AID*/
			AID := []
		END;

/*-------------------------------------------------------------------------------*/
	result <-- isObjectDeletionSupported = 
		CHOICE
			result := TRUE
		OR
			result := FALSE
		END;

/*-------------------------------------------------------------------------------*/		
	requestObjectDeletion = 
	/* throws: SystemException*/
	/*SystemException.ILLEGAL_USE if the object deletion mechanism is not implemented*/
		skip;

/*-------------------------------------------------------------------------------*/
	result <-- isAppletActive(theApplet) = 
	PRE
		theApplet : seq(AID)
	THEN
		CHOICE
			result := TRUE
		OR
			result := FALSE
		END
	END
END
