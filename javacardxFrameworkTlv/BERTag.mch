/* BERTag
 *
 * The abstract BERTag class encapsulates a BER TLV tag.
 *
 * Author: simone
 * Creation date: 01/09/11
 */
MACHINE
    BERTag

SEES
	javacardxFrameworkTlvClasses,
	JByte, 
	JShort, 
	JBoolean

/*This class extends java.lang.Object */
EXTENDS
	Object

CONCRETE_CONSTANTS
	BER_TAG_CLASS_MASK_APPLICATION,
   	BER_TAG_CLASS_MASK_CONTEXT_SPECIFIC,
	BER_TAG_CLASS_MASK_PRIVATE,
	BER_TAG_CLASS_MASK_UNIVERSAL,
	BER_TAG_TYPE_CONSTRUCTED,
	BER_TAG_TYPE_PRIMITIVE

PROPERTIES
	BER_TAG_CLASS_MASK_APPLICATION : JBYTE &
    BER_TAG_CLASS_MASK_APPLICATION = 1 &
	
	BER_TAG_CLASS_MASK_CONTEXT_SPECIFIC : JBYTE &
	BER_TAG_CLASS_MASK_CONTEXT_SPECIFIC = 2 &
	
	BER_TAG_CLASS_MASK_PRIVATE : JBYTE &
	BER_TAG_CLASS_MASK_PRIVATE = 3 &
	
	BER_TAG_CLASS_MASK_UNIVERSAL : JBYTE &
	BER_TAG_CLASS_MASK_UNIVERSAL = 0 &
	
	BER_TAG_TYPE_CONSTRUCTED : JBOOLEAN & 
	BER_TAG_TYPE_CONSTRUCTED = TRUE &
	
	BER_TAG_TYPE_PRIMITIVE : JBOOLEAN &
	BER_TAG_TYPE_PRIMITIVE = FALSE

OPERATIONS
	
	init_1 (bArray, bOff) = 
	/* throws: TLVException */
	PRE
		/* bArray - the byte array containing the binary representation */
		/* NullPointerException if 'bArray' is null */
		bArray : seq1(JBYTE) & 
		
		/* bOff - the offset within bArray where the tag binary begins */
		/* ArrayIndexOutOfBoundsException if accessing the input array would cause access 
		of data outside array bounds, or if the array offset parameter is negative */	
		bOff : JSHORT &
		bOff >= 0 
	
		/* TLVException.ILLEGAL_SIZE if the tag number requested is larger than the 
		supported maximum size */
		/* TLVException.MALFORMED_TAG if tag representation in the byte array is malformed 
		or is a primitive array tag */ 
		
	THEN 
		skip
	END;

/*--------------------------------------------------------------------------------------*/
	res <-- getInstance(bArray, bOff) = 
	PRE
		/* bArray - the byte array containing the binary representation */
		/* NullPointerException if 'bArray' is null */
		bArray : seq1(JBYTE) & 
		
		/* bOff - the offset within bArray where the tag binary begins */
		/*ArrayIndexOutOfBoundsException if accessing the input array would cause access 
		of data outside array bounds, or if the array offset parameter is negative */
		bOff : JSHORT &
		bOff >= 0  
		
		/* TLVException.ILLEGAL_SIZE if the tag number requested is larger than the 
		supported maximum size */
        /* TLVException.MALFORMED_TAG if tag representation in the byte array is 
		malformed. */
		
	THEN
		ANY 
			bertag_value
		WHERE	
			bertag_value : BERTAG
		THEN 
			res := bertag_value
		END 
	END;

/*--------------------------------------------------------------------------------------*/
	res <-- size_1 = /* reserved word size */
	/* TLVException.TAG_SIZE_GREATER_THAN_127 if the size of the BER Tag is > 127 */
    /* TLVException.EMPTY_TAG if the BER Tag is empty */
	BEGIN
		ANY 
			bertag_size
		WHERE	
			(bertag_size : JBYTE & 
			bertag_size >= 0 & 
			bertag_size <= 127)
		THEN 
			res := bertag_size
		END 
	END;

/*--------------------------------------------------------------------------------------*/
	res <-- toBytes_1(outBuf, bOffset) = 
	/* throws: TLVException */
	PRE 
		/* outBuf - the byteArray where the BER tag is written */
		/* NullPointerException if 'bArray' is null */
		outBuf : seq1(JBYTE) & 
		
		/* bOffset - offset within outBuf where BER tag value starts */
		/* ArrayIndexOutOfBoundsException - if accessing the output array would cause 
		access of data outside array bounds, or if the array offset parameter is negative */
		bOffset : JSHORT & 
		bOffset >= 0
		
		/* TLVException.EMPTY_TAG if the BER Tag is empty. */
		
	THEN 
		ANY 
			bertag_size
		WHERE	
			bertag_size : JSHORT & 
			bertag_size >= 0
		THEN 
			res := bertag_size
		END 
	END;

/*--------------------------------------------------------------------------------------*/
	res <-- tagNumber_1 = 
	/* TLVException.TAG_NUMBER_GREATER_THAN_32767 if the tag number is > 32767. */
    /* TLVException.EMPTY_TAG if the BER Tag is empty. */
	ANY
		bertag_tagnum
	WHERE 
		bertag_tagnum : JSHORT & 
		bertag_tagnum >= 0 & 
		bertag_tagnum <= 32767
	THEN 
		res := bertag_tagnum
	END; 

/*--------------------------------------------------------------------------------------*/
	res <-- isConstructed_1 =  
	/* throws: TLVException */
	
	/* TLVException.EMPTY_TAG if the BER Tag is empty. */
		CHOICE 
			res := TRUE
		OR 
			res := FALSE
		END;

/*--------------------------------------------------------------------------------------*/
	res <-- tagClass_1 = 
	/* throws: TLVException */
	/* TLVException.EMPTY_TAG if the BER Tag is empty. */
	CHOICE 
		res := 	BER_TAG_CLASS_MASK_APPLICATION
	OR 
		res := BER_TAG_CLASS_MASK_CONTEXT_SPECIFIC
	OR 
		res := BER_TAG_CLASS_MASK_PRIVATE
	OR
		res := BER_TAG_CLASS_MASK_UNIVERSAL
	END;

/*--------------------------------------------------------------------------------------*/
/* ATENTION This method is inherited from Object */
	res <-- equals_1(otherTag) = 
	PRE
		otherTag : BERTAG
	THEN 
		CHOICE 
			res := TRUE
		OR
			res := FALSE
		END
	END;

/*--------------------------------------------------------------------------------------*/
	res <-- toBytes_2(tagClass, isConstructed, tagNumber, outArray, bOff) =
	PRE
		/* tagClass - encodes the tag class. Valid codes are the BER_TAG_CLASS_MASK_* constants */
		tagClass : JSHORT & 
    	(tagClass = BER_TAG_CLASS_MASK_APPLICATION or 
   	 	tagClass = BER_TAG_CLASS_MASK_CONTEXT_SPECIFIC or 
     	tagClass = BER_TAG_CLASS_MASK_PRIVATE or
	 	tagClass = BER_TAG_CLASS_MASK_UNIVERSAL) & 
		
		/* isConstructed - true if the tag is constructed, false if primitive */
		isConstructed : JBOOLEAN & 
		
		/* tagNumber - is the tag number. */
		/* TLVException.INVALID_PARAM if tagClass parameter is invalid or if the tagNumber 
		parameter is negative. */ 
		tagNumber : JSHORT & 
    	tagNumber >= 0 & 
    	
		/* outArray - output byte array */
		/* NullPointerException - if outArray is null */
		outArray : seq1(JBYTE) & 
		
		/* bOff - offset within byte array containing first byte */
		/* ArrayIndexOutOfBoundsException - if accessing the output array would cause access 
		of data outside array bounds, or if the array offset parameter is negative */
		bOff : JSHORT & 
		bOff >= 0 
		
	/* TLVException.ILLEGAL_SIZE if the tag size is larger than the supported 
	maximum size or 32767 */
	THEN 
		ANY 
			bertag_out_size
		WHERE	
			bertag_out_size : JSHORT &          
			bertag_out_size < 32767
		THEN 
			res := bertag_out_size
		END 
	END;
	
/*--------------------------------------------------------------------------------------*/
	res <-- size_2(berTagArray, bOff) = /* reserved word size */
	/* throws: TLVException */
	PRE
		/* berTagArray - input byte array containing the BER Tag representation */
		/* NullPointerException - if berTagArray is null */
		berTagArray : seq1(JBYTE) & 
		/* TLVException.TAG_SIZE_GREATER_THAN_127 if the size of the BER Tag is > 127 */
		size (berTagArray) <= 127 &	
		size(berTagArray): dom(cast_byte) &
		
		/* bOff - offset within byte array containing first byte */
		/* ArrayIndexOutOfBoundsException - if accessing the input array would cause access 
		of data outside array bounds, or if the array offset parameter is negative */
		bOff   : JSHORT &
		bOff >= 0 
		
		/* TLVException.ILLEGAL_SIZE if the size of the BER Tag is greater than the 
		maximum Tag size supported. */
        /* TLVException.MALFORMED_TAG if tag representation in the byte array is 
		malformed. */
		
	THEN 
		res := cast_byte(size(berTagArray))
	END;

/*--------------------------------------------------------------------------------------*/
	res <-- tagNumber_2(berTagArray, bOff) = /*throws TLVException*/
	PRE
		/* berTagArray - input byte array */
		/* NullPointerException - if berTagArray is null */
		/* TLVException.TAG_SIZE_GREATER_THAN_127 if the size of the BER Tag is > 127 */
		berTagArray : seq1(JBYTE) & 
		(size(berTagArray) <= 127) &	
		
		/* bOff - offset within byte array containing first byte */
		/*ArrayIndexOutOfBoundsException - if accessing the input array would cause access 
		of data outside array bounds, or if the array offset parameter is negative */
		bOff   : JSHORT &	
		bOff >= 0 
		
		/* TLVException.ILLEGAL_SIZE if the size of the BER Tag is greater than the maximum 
		Tag size supported */
        /* TLVException.MALFORMED_TAG if tag representation in the byte array is malformed. */
	
	/* TLVException.TAG_NUMBER_GREATER_THAN_32767 if the tag number is > 32767. */
	THEN
		ANY
			bertag_tagnum
		WHERE 
			bertag_tagnum : JSHORT & 
			bertag_tagnum <= 32767
		THEN 
			res := bertag_tagnum
		END
	END;

/*--------------------------------------------------------------------------------------*/
	res <-- isConstructed_2 (berTagArray, bOff) =
	PRE 
		/* berTagArray - input byte array */
		/* NullPointerException - if berTagArray is null */
		berTagArray : seq1(JBYTE) &	
		
		/* bOff - offset within byte array containing first byte */
		/* ArrayIndexOutOfBoundsException - if accessing the input array would cause access 
		of data outside array bounds, or if the array offset parameter is negative */
		bOff   : JSHORT &
		bOff >= 0 
		
		/* TLVException.MALFORMED_TAG if tag representation in the byte array is malformed. */
		
	THEN 
		CHOICE 
			res := TRUE
		OR 
			res := FALSE
		END
	END;
 
/*--------------------------------------------------------------------------------------*/
	res <-- tagClass_2(berTagArray, bOff) =
	/* throws: NullPointerException, ArrayIndexOutOfBoundsException,
			TLVException */
	PRE 
		/* berTagArray - input byte array */
		/* NullPointerException - if berTagArray is null */
		berTagArray : seq1(JBYTE) &
		
		/* bOff - offset within byte array containing first byte */
		/* ArrayIndexOutOfBoundsException - if accessing the input array would cause access 
		of data outside array bounds, or if the array offset parameter is negative */
		bOff   : JSHORT &
		bOff >= 0 
		
		/* TLVException.MALFORMED_TAG if tag representation in the byte array is malformed. */
		
	THEN 
		CHOICE 
			res := 	BER_TAG_CLASS_MASK_APPLICATION
		OR 
			res := BER_TAG_CLASS_MASK_CONTEXT_SPECIFIC
		OR 
			res := BER_TAG_CLASS_MASK_PRIVATE
		OR
			res := BER_TAG_CLASS_MASK_UNIVERSAL
		END
	END; 
  
/*--------------------------------------------------------------------------------------*/
	res <-- verifyFormat(berTagArray, bOff) = 
	/* throws: NullPointerException, ArrayIndexOutOfBoundsException,
			TLVException */
	PRE
	
		/* berTagArray - input byte array */
		/* NullPointerException - if berTagArray is null */
		berTagArray : seq1(JBYTE) &	
		
		/* bOff - offset within byte array containing first byte */
		/* ArrayIndexOutOfBoundsException - if accessing the input array would cause access 
		of data outside array bounds, or if the array offset parameter is negative */
		bOff   : JSHORT &
		bOff >= 0 
		
		/* TLVException.MALFORMED_TAG if tag representation in the byte array is malformed. */
		
	THEN 
		CHOICE 
			res := TRUE
		OR 
			res := FALSE
		END
	END

END
