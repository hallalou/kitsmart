/* AID
 * Author: simone
 * Creation date: 05/06/11
 *
 * This class encapsulates the Application Identifier (AID) associated with 
 * an applet. An AID is defined in ISO 7816-5 to be a sequence of bytes 
 * between 5 and 16 bytes in length.
 *
 */
MACHINE
    AID
    
/*This class extends Object (java.lang.Object)*/
EXTENDS
    Object  

SEES
    JBoolean,
    JByte,
    JShort,
    ObjectSet

OPERATIONS
    
    C_AID(bArray, offset, length) = 
    /* throws: SystemException,      
       NullPointerException, 
       ArrayIndexOutOfBoundsException,         
       SecurityException 
       */
       PRE
			/* bArray: the byte array containing the AID bytes */
			/* NullPointerException if 'bArray' is null*/
            bArray : seq1(JBYTE) &
            
            /* offset: the start of AID bytes in bArray */
            /* ArrayIndexOutOfBoundsException if 'offset' is negative */
			offset : JSHORT &		
			offset >= 0 &
		
			/* length - the length of the AID bytes in bArray */
			/* ArrayIndexOutOfBoundsException if 'length' is negative */
			/* SystemException if 'length' < 5 or 'length' > 16
			with reason code: SystemException.ILLEGAL_VALUE */
           	length : JBYTE &
			length >= 5 & 
			length <= 16 & 
		
		/*ATENTION different types of variables, offset and length*/
		/* ArrayIndexOutOfBoundsException if 
		   'offset+length' is greater than the length of 'bArray' */
			(offset + length) <= size(bArray) 

		/* SecurityException if 'bArray' is not accessible in the 
		   caller's context*/
	THEN
		skip
	END;

/*-------------------------------------------------------------------------*/
	bytes <-- getBytes(dest, offset) = 
	/*  throws: NullPointerException,
		ArrayIndexOutOfBoundsException,
		SecurityException
		*/
		PRE
			/* dest: byte array to copy the AID bytes */
			/* NullPointerException if the 'dest' parameter is null */
			dest : seq1(JBYTE) &
			
			/* offset: within dest where the AID bytes begin */
			/* ArrayIndexOutOfBoundsException if the 'offset' parameter is negative */
			offset : JSHORT &
			offset >= 0 
			
		/*SecurityException if the 'dest' array is not accessible in the 
		caller's context*/
	THEN
		bytes := size(dest)
		
		/*ArrayIndexOutOfBoundsException if 'offset+length of AID bytes' is greater than the length of the dest array*/
	END;

/*-------------------------------------------------------------------------*/
  /* !! equals_1 overides Object.equals !! */
  /* Compares the AID bytes in this AID instance to the AID bytes in anObject. 	The result is true if and only if the argument is not null and is an AID 	object that encapsulates the same AID bytes as this object. With the    
      current modeling we don't have this information. Here, we only model the
      two possible return values.
  */
	result <-- equals_1(anObject) = 
	/* throws: SecurityException */
	PRE	
		/* anObject: the object to compare this AID against */
		anObject : OBJECT
		
		/* SecurityException if anObject object is not accessible in the 
		caller's context */
	THEN
		CHOICE
			result := TRUE
		OR
			result := FALSE
		END
	END;

/*-------------------------------------------------------------------------*/
	result <-- equals_2(bArray, offset, length) = 
	/* 	throws: ArrayIndexOutOfBoundsException,
		SecurityException
		*/
	PRE
		/* bArray: containing the AID bytes */
		bArray : seq(JBYTE) &
		
		/* offset: within bArray to begin */
		/* ArrayIndexOutOfBoundsException if the 'offset' parameter is negative */
		offset : JSHORT &
		offset >= 0 & 
		
		/* length: of AID bytes in bArray */
		/* ArrayIndexOutOfBoundsException if the 'length' parameter is negative */
        length : JBYTE &
		length >= 0 & 
		
		/* ArrayIndexOutOfBoundsException if 'offset+length' is greater than 
		the length of the 'bArray' parameter*/
		/*ATENTION different types of variables, offset and length*/
		(offset + length) <= size(bArray)

		/*SecurityException if the 'bArray' array is not accessible in the 
		caller's context*/
	THEN
		CHOICE
			result := TRUE
		OR
			result := FALSE
		END
	END;

/*-------------------------------------------------------------------------*/
	result <-- partialEquals(bArray, offset, length) = 
	/* 	throws: ArrayIndexOutOfBoundsException,
		SecurityException
		*/
	PRE
		/* bArray: containing the partial AID byte sequence */
		bArray : seq(JBYTE) &
		
		/* offset: within bArray to begin */
		/* ArrayIndexOutOfBoundsException if the offset parameter is negative */
		offset : JSHORT &
		offset >= 0 & 
        
		/* length: of partial AID bytes in bArray */
		/* ArrayIndexOutOfBoundsException if the length parameter is negative*/
		length : JBYTE &
		length >= 0 & /*ArrayIndexOutOfBoundsException*/
		
		/* ArrayIndexOutOfBoundsException if offset+length is greater than the 
		length of the bArray parameter */
		/*ATENTION different types of variables, offset and length*/
		(offset + length) <= size(bArray)		

		/*SecurityException if the 'bArray' array is not accessible in the 
		caller's context*/
	THEN
		CHOICE
			result := TRUE
		OR
			result := FALSE
		END
	END;

/*-------------------------------------------------------------------------*/

	/* RIDEquals checks if the RID (National Registered Application provider
 	identi?er) portion of the encapsulated AID bytes within the otherAID 
	object matches that of thisAID object. The ?rst 5 bytes of an AID byte
	sequence is the RID. The result is true if and only if the argument is
	not null and is anAID object that encapsulates the same RID bytes as
	this object. This method does not throw NullPointerException. With the    
    current modeling we don't have this information. Here, we only model the
    two possible return values.
	*/

	result <-- RIDEquals(otherAID) = 
	/* throws: SecurityException*/
	PRE 
		/* otherAID: the AID to compare against */
		/* otherAID's must be an AID Object (not modeled) */
		otherAID : OBJECT 
	THEN
		CHOICE
			result := TRUE
		OR
			result := FALSE
		END
		/* SecurityException if the otherAID object is not accessible in
		the caller?s context*/
	END;

/*-------------------------------------------------------------------------*/
	bytes <-- getPartialBytes(aidOffset, dest, oOffset, oLength) =
	/* throws: NullPointerException,
        ArrayIndexOutOfBoundsException,
        SecurityException
		*/
	PRE
		/* aidOffset: offset within AID array to begin copying bytes */
		/* ArrayIndexOutOfBoundsException if the 'aidOffset' parameter is negative */
		aidOffset : JSHORT & 
		aidOffset >= 0 & 
		
		/* dest: the destination byte array to copy the AID bytes into */
		/* NullPointerException if the 'dest' parameter is null */
		dest : seq1(JBYTE) &

		/* oOffset: offset within dest where the output bytes begin */
		/* ArrayIndexOutOfBoundsException if the 'oOffset' parameter is negative */
		oOffset : JSHORT &
		oOffset >= 0 & 
		
		/* oLength: the length of bytes requested in dest. 
		0 implies a request to copy all remaining AID bytes. */
		oLength : JBYTE &
		oLength >= 0 &
		
		/*ArrayIndexOutOfBoundsException if 'oOffset+oLength' of bytes 
		requested is greater than the length of the 'dest' array*/
		/*ATENTION different types of variables, oOffset and oLength*/
		(oOffset + oLength) <= size(dest)

		/*SecurityException if the 'bArray' array is not accessible in the 
		caller's context*/
	THEN
		ANY aid_bytes
		WHERE (aid_bytes : JBYTE & aid_bytes >= 0)
		THEN bytes := aid_bytes
		END
	END
END
