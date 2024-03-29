/* JCSystem
 * Author: simone
 * Creation date: 07/06/11
 *
 * The JCSystem class includes a collection of methods to control applet execution, 
 * resource management, atomic transaction management, object deletion mechanism and 
 * inter-applet object sharing in the Java Card environment.
 */
MACHINE
    JCSystem
    
/*ATENTION This class extends Object (java.lang.Object)*/
EXTENDS
	Object
    
SEES
	javacardFrameworkClasses,
	javaLangClasses,
	JShort,
	JByte,
	JBoolean

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
	MAKEARRAYOBJECT : seq(OBJECT)

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
	/* Commits an atomic transaction. The contents of commit buffer are atomically committed. */
	
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
		/* serverAID - the AID of the server applet */
		serverAID : AID &
		/* parameter - optional parameter data */
		parameter : JBYTE

		/* SecurityException - if the server applet is not multiselectable
		and is currently active on another logical channel */
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
	    /* memoryType - the type of memory being queried */
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
    /* Checks if the specified object is transient. */
	
	result <-- isTransient(theObj) = 
	PRE
		/* theObj - the object being queried */
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
	/* Creates a transient boolean array with the specified array length. */
	
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
	/* Creates a transient byte array with the specified array length. */
	
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
	/* Creates a transient short array with the specified array length. */
	
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
	/* Creates a transient array of Object with the specified array length. */
	
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
	/* Returns the current major and minor version of the Java Card API. */
	
	version <-- getVersion =
	BEGIN
		version :: JSHORT	
	END;

/*-------------------------------------------------------------------------------*/		
	/* Returns the Java Card runtime environment-owned instance of the AID object */
	
	aid <-- lookupAID(buffer, offset, length) = 
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
			aid := MAKEARRAYBYTE
		OR
			/*Assigns a empty sequence to the variable AID*/
			aid := []
		END
	END;

/*-------------------------------------------------------------------------------*/
	/* Returns the current transaction nesting depth level */
	
	result <-- getTransactionDepth = 
		CHOICE
			result := 1
		OR
			result := 0
		END;

/*-------------------------------------------------------------------------------*/		
	/* Returns the number of bytes left in the commit buffer. */
	
	numBytes <-- getUnusedCommitCapacity = 
		ANY jcsystem_numBytes
		WHERE (jcsystem_numBytes : JSHORT) &
		(jcsystem_numBytes <= 32767)
		THEN numBytes := jcsystem_numBytes
		END;

/*-------------------------------------------------------------------------------*/
	/* Obtains the Java Card runtime environment-owned instance of the AID object 
		associated with the previously active applet context. */
	
	aid <-- getPreviousContextAID = 
		CHOICE
			/*Assigns a byte array to the variable AID*/
			aid := MAKEARRAYBYTE
		OR
			/*Assigns a empty sequence to the variable AID*/
			aid := []
		END;

/*-------------------------------------------------------------------------------*/
	/* This method is used to determine if the implementation for the Java Card 
		platform supports the object deletion mechanism. */
	
	result <-- isObjectDeletionSupported = 
		CHOICE
			result := TRUE
		OR
			result := FALSE
		END;

/*-------------------------------------------------------------------------------*/		
	/* This method is invoked by the applet to trigger the object deletion service 
		of the Java Card runtime environment. */
	
	requestObjectDeletion = 
	/* throws: SystemException*/
	/*SystemException.ILLEGAL_USE if the object deletion mechanism is not implemented*/
		skip;

/*-------------------------------------------------------------------------------*/
	/* This method is used to determine if the specified applet is active on the card. */
	
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
