/* AID
 * Author: simone
 * Creation date: 05/06/11
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
		/* SystemException if 'length' < 5 or 'length' > 16*/
		/* reason code: SystemException.ILLEGAL_VALUE */
           	length : JBYTE &
		length >= 5 & 
		length <= 16 & 
		
		/* ATENTION different types of variables       */
		/* ArrayIndexOutOfBoundsException if 
		   'offset+length' is greater than the length of 'bArray' */
		(offset + length) <= size(bArray) 

		/* SecurityException if 'bArray' is not accessible in the 
		   caller's context*/
	THEN
		skip
	END;

/*-------------------------------------------------------------------------*/
	bytes <-- getBytes(dest, offset) = /*NullPointerException, ArrayIndexOutOfBoundsException, SecurityException*/
	PRE
		dest : seq1(JBYTE) & /*NullPointerException if the 'dest' parameter is null*/
		offset : JSHORT &
		offset >= 0 /*ArrayIndexOutOfBoundsException if the 'offset' parameter is negative*/
		           	
		/*SecurityException if the 'dest' array is not accessible in the caller's context*/
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
		anObject : OBJECT
	THEN
		CHOICE
			result := TRUE
		OR
			result := FALSE
		END
	END;

/*-------------------------------------------------------------------------*/
	result <-- equals_2(bArray, offset, length) = /*ArrayIndexOutOfBoundsException, SecurityException*/
	PRE
		bArray : seq(JBYTE) &
		offset : JSHORT &
		offset >= 0 & /*ArrayIndexOutOfBoundsException if the 'offset' parameter is negative*/
           	length : JBYTE &
		length >= 0 & /*ArrayIndexOutOfBoundsException if the 'length' parameter is negative*/
		(offset + length) <= size(bArray) /*ATENTION different types of variables*/ /*ArrayIndexOutOfBoundsException if 'offset+length' is greater than the length of the 'bArray' parameter*/

		/*SecurityException if the 'bArray' array is not accessible in the caller's context*/
	THEN
		CHOICE
			result := TRUE
		OR
			result := FALSE
		END
	END;

/*-------------------------------------------------------------------------*/
	result <-- partialEquals(bArray, offset, length) = /*ArrayIndexOutOfBoundsException, SecurityException*/
	PRE
		bArray : seq(JBYTE) &
		offset : JSHORT &
		offset >= 0 & /*ArrayIndexOutOfBoundsException*/
           	length : JBYTE &
		length >= 0 & /*ArrayIndexOutOfBoundsException*/
		(offset + length) <= size(bArray) /*ArrayIndexOutOfBoundsException if 'offset+length' is greater than the length of the 'bArray' parameter*/

		/*SecurityException if the 'bArray' array is not accessible in the caller's context*/
	THEN
		CHOICE
			result := TRUE
		OR
			result := FALSE
		END
	END;

/*-------------------------------------------------------------------------*/
	result <-- RIDEquals(otherAID) = /*SecurityException*/
	PRE
		/*otherAID's type is AID*/
		otherAID : seq(JBYTE) &
		size(otherAID) >= 5 &
		size(otherAID) <= 16
	THEN
		CHOICE
			result := TRUE
		OR
			result := FALSE
		END
	END;

/*-------------------------------------------------------------------------*/
	bytes <-- getPartialBytes(aidOffset, dest, oOffset, oLength) =
	PRE
		aidOffset : JSHORT & 
		aidOffset >= 0 & /*ArrayIndexOutOfBoundsException if the 'aidOffset' parameter is negative*/
		dest : seq1(JBYTE) & /*NullPointerException if the 'dest' parameter is null*/
		oOffset : JSHORT &
		oOffset >= 0 & /*ArrayIndexOutOfBoundsException if the 'oOffset' parameter is negative*/
		oLength : JBYTE &
		oLength >= 0 &
		(oOffset + oLength) <= size(dest) /*ArrayIndexOutOfBoundsException if 'oOffset+oLength'(ATENTION) of bytes requested is greater than the length of the 'dest' array*/

		/*SecurityException if the 'bArray' array is not accessible in the caller's context*/
	THEN
		ANY aid_bytes
		WHERE (aid_bytes : JBYTE & aid_bytes >= 0)
		THEN bytes := aid_bytes
		END
	END
END
