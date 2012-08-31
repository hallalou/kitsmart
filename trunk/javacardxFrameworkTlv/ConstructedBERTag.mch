/* ConstructedBERTag
 *
 * he ConstructedBERTag class encapsulates a constructed BER TLV tag.
 *
 * Author: bruno
 * Creation date: 02/09/11
 */
MACHINE
    ConstructedBERTag

SEES
	JByte, 
	JShort

/*This class extends javacardx.framework.tlv.BERTag */
EXTENDS 
	BERTag

OPERATIONS

	/* this operations uses the tag _1 because the operation init was also declared in 
	BERTag */
	init_2 (tagClass, tagNumber) = 
	/* throws: TLVException */
	PRE
		/* tagClass - encodes the tag class. Valid codes listed in BER_TAG_CLASS_* constants. */
		tagClass  : JBYTE &
		(tagClass = BER_TAG_CLASS_MASK_APPLICATION or
		tagClass = BER_TAG_CLASS_MASK_CONTEXT_SPECIFIC or 
		tagClass = BER_TAG_CLASS_MASK_PRIVATE or
		tagClass = BER_TAG_CLASS_MASK_UNIVERSAL) &
		
		/* tagNumber - is the tag number. */
		/* TLVException.INVALID_PARAM if tag class parameter is invalid or if the tag 
		number parameter is negative. */
		tagNumber : JSHORT &		
		tagNumber >= 0
		
		/* TLVException.ILLEGAL_SIZE if the tag number requested is larger than the 
		supported maximum size */
		
	THEN 
		skip
	END

END
