/* PrimitiveBERTag
 * Author: simone
 * Creation date: 01/09/11
 */
MACHINE
    PrimitiveBERTag

SEES
	JByte, 
	JShort

/*This class extends javacardx.framework.tlv.BERTag */
EXTENDS 
	BERTag

OPERATIONS
	/* init_1 defined in BERTag */
	init_2(tagClass, tagNumber) = 
	/* throws: TLVException */
	PRE
		/* tagClass - encodes the tag class. Valid codes listed in BERTAG_CLASS_* constants. */
		tagClass : JBYTE &
		(tagClass = BER_TAG_CLASS_MASK_UNIVERSAL or
		tagClass = BER_TAG_CLASS_MASK_APPLICATION or
		tagClass = BER_TAG_CLASS_MASK_CONTEXT_SPECIFIC or
		tagClass = BER_TAG_CLASS_MASK_PRIVATE) &
		
		/* tagNumber - is the tag number. */
		/* TLVException.INVALID_PARAM if the tag number parameter is negative */
		tagNumber : JSHORT &
		tagNumber >= 0
		 
		/* TLVException.ILLEGAL_SIZE if the tag number requested is larger than the 
		supported maximum size */
		/* TLVException.INVALID_PARAM if tag class parameter is invalid */
		
	THEN
		skip
	END;

/*--------------------------------------------------------------------------------------*/	
	init_3 (bArray, bOff) = 
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
	END
END
