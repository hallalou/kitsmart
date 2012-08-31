/* ConstructedBERTLV
 *
 * The ConstructedBERTLV class encapsulates a constructed BER TLV structure.
 *
 * Author: simone
 * Creation date: 01/09/11
 */
MACHINE
    ConstructedBERTLV

SEES
	javacardxFrameworkTlvClasses,
	JShort, 
	JByte

/*This class extends javacardx.framework.tlv.BERTLV */
EXTENDS 
	BERTlv

OPERATIONS
	C_ConstructedBERTLV(numTLVs) = 
	PRE
		/* numTLVs - is the number of contained TLVs to allocate */
		/* TLVException.INVALID_PARAM if numTLVs parameter is negative or larger than the 
		maximum capacity supported by the implementation */
		numTLVs : JSHORT &
		numTLVs >= 0 
		
	THEN
		skip
	END;

/*--------------------------------------------------------------------------------------*/
	/*This operation uses the tag _1 because it is also declared is BERTLV */
	resultSize <-- init_1(bArray, bOff, bLen) =
	/* throws: NullPointerException, ArrayIndexOutOfBoundsException,
			TLVException */
	PRE
		/* bArray - input byte array */
		/* NullPointerException if 'bArray' is null */
		bArray : seq(JBYTE) & 
		
		/* bOff - offset within byte array containing the tlv data */
		/*ArrayIndexOutOfBoundsException if 'bOff' is negative*/
		bOff : JSHORT &
		bOff >= 0 &
		
		/* bLen - byte length of input data */
		/* ArrayIndexOutOfBoundsException if 'bLen' is negative */
		/* ArrayIndexOutOfBoundsException if 'bOff+bLen' is greater than the length of 
		the 'bArray' */
		bLen : JSHORT &
		bLen >= 0 &
		sum_short(bOff, bLen) <= size(bArray)

		/* ArrayIndexOutOfBoundsException if accessing the input array would cause access 
		of data outside array bounds */
		/* TLVException.ILLEGAL_SIZE if the required capacity is not available and the 
		implementation does not support automatic expansion. */
		/* TLVException.MALFORMED_TLV if the input data is not a well-formed constructed 
		BER TLV structure */
		
	THEN
		ANY anyResultSize
		WHERE (anyResultSize : JSHORT) & (anyResultSize >= 0)
		THEN resultSize := anyResultSize
		END
	END;
/*--------------------------------------------------------------------------------------*/
	resultSize <-- init_2(tag, aTLV) = 
	/* throws: NullPointerException, ArrayIndexOutOfBoundsException,
			TLVException */
	PRE
		/* tag - a BERTag object */
		tag : CONSTRUCTED_BERTAG &
		
		/* aTLV - to use to initialize as the value of this TLV */
		aTLV : BERTLV 

		/* NullPointerException if 'aTLV' is null*/
		/* TLVException.INSUFFICIENT_STORAGE if the required capacity is not available and 
		the implementation does not support automatic expansion */
		/* TLVException.INVALID_PARAM if aTLV is this or this TLV object is contained in 
		any of the constructed TLV objects in the hierarchy of the aTLV object */
		
	THEN
		ANY constructedbertlv_ResultSize
		WHERE (constructedbertlv_ResultSize : JSHORT) &
		(constructedbertlv_ResultSize >= 0)
		THEN resultSize := constructedbertlv_ResultSize
		END
	END;

/*--------------------------------------------------------------------------------------*/
	resultSize <-- init_3(tag, vArray, vOff, vLen) = 
	/* throws: NullPointerException, ArrayIndexOutOfBoundsException,
			TLVException */
	PRE
		/* tag - a BERTag object */
		tag : CONSTRUCTED_BERTAG & 
		
		/* vArray - the byte array containing vLen bytes of TLV Value */
		/*NullPointerException if 'vArray' is null*/
		vArray : seq1(JBYTE) & 
		
		/* vOff - offset within the vArray byte array where data begins */
		/* ArrayIndexOutOfBoundsException if 'vOff' is negative */
		vOff : JSHORT &
		vOff >= 0 & 
		
		/* vLen - byte length of the value data in vArray */
		/* ArrayIndexOutOfBoundsException if 'vLen' is negative */
		vLen : JSHORT &
		vLen >= 0 & 
		/* ArrayIndexOutOfBoundsException if 'vOff+vLen' is greater than the length of 
		the 'vArray' */
		sum_short(vOff, vLen) <= size(vArray) 

		/* NullPointerException if 'tag' is null */
		/* ArrayIndexOutOfBoundsException if accessing the input array would cause access 
		of data outside array bounds */
		/* TLVException.INSUFFICIENT_STORAGE or if the required capacity is not available 
		and the implementation does not support automatic expansion */
		
	THEN
		ANY constructedbertlv_ResultSize
		WHERE (constructedbertlv_ResultSize : JSHORT) &
		(constructedbertlv_ResultSize >= 0)
		THEN resultSize := constructedbertlv_ResultSize
		END
	END;

/*--------------------------------------------------------------------------------------*/
	resultSize <-- append_1(aTLV) = 
	/* throws: NullPointerException, ArrayIndexOutOfBoundsException,
			TLVException */
	PRE
		/* aTLV - a BER TLV object */
		aTLV : BERTLV 

		/* NullPointerException if 'aTLV' is null */
		/* TLVException.INSUFFICIENT_STORAGE if the required capacity is not available and 
		the implementation does not support automatic expansion */
    	/*TLVException.INVALID_PARAM if aTLV is this or this TLV object is contained in any 
		of the constructed TLV objects in the hierarchy of the aTLV object */
		
	THEN
		ANY constructedbertlv_ResultSize
		WHERE (constructedbertlv_ResultSize : JSHORT) &
		(constructedbertlv_ResultSize >= 0)
		THEN resultSize := constructedbertlv_ResultSize
		END
	END;

/*--------------------------------------------------------------------------------------*/
	resultSize <-- delete(aTLV, occurrenceNum) = 
	/* throws: NullPointerException, ArrayIndexOutOfBoundsException,
			TLVException */
	PRE
		/* aTLV - the BER TLV object to delete from this */
		aTLV : BERTLV & 
		
		/* occurrenceNum - specifies which occurrence of aTLV within this BER TLV to use */
		/*TLVException.INVALID_PARAM if occurrenceNum is 0 or negative. */
		occurrenceNum : JSHORT &
		occurrenceNum > 0 
		
		/* NullPointerException if 'aTLV' is null */
		/* TLVException.INVALID_PARAM if the specified BER TLV object parameter is not an 
		element of this or occurs less than occurrenceNum times in this */
		
	THEN
		ANY constructedbertlv_ResultSize
		WHERE (constructedbertlv_ResultSize : JSHORT) &
		(constructedbertlv_ResultSize >= 0)
		THEN resultSize := constructedbertlv_ResultSize
		END
	END;

/*--------------------------------------------------------------------------------------*/
	result <-- find_1(tag) = 
	PRE
		/*ATENTION tag's type is BERTag*/
		tag : JSHORT
	THEN
		result :: BERTLV	
	END;

/*--------------------------------------------------------------------------------------*/
	result <-- findNext_1(tag, aTLV, occurrenceNum) = 
	/* throws: NullPointerException, TLVException */
	PRE
		/* tag - the BERTag to be found */
		tag : BERTAG & 
		
		/* aTLV - tlv object contained within this BER TLV following which the search begins */
		aTLV : BERTLV & 
		
		/* occurrenceNum - specifies which occurrence of aTLV within this BER TLV to use */
		/* TLVException.INVALID_PARAM if 'occurrenceNum' is 0 or negative */
		occurrenceNum : JSHORT &
		occurrenceNum > 0 

		/* TLVException.INVALID_PARAM if the specified BER TLV object parameter is not an 
		element of this or occurs less than occurrenceNum times in this */
		
	THEN
		result :: BERTLV		
	END;

/*--------------------------------------------------------------------------------------*/
	resultSize <-- append_2(berTLVInArray, bTLVInOff, berTLVOutArray, bTLVOutOff) = 
	/* throws: NullPointerException, ArrayIndexOutOfBoundsException,
			TLVException */
	PRE
		/* berTLVInArray - input byte array */
		/* NullPointerException if 'berTLVInArray' is null */
		berTLVInArray : seq1(JBYTE) & 
        
		/* bTLVInOff - offset within byte array containing the tlv data */
		/* ArrayIndexOutOfBoundsException if 'bTLVInOff' is negative */
		bTLVInOff : JSHORT &
		bTLVInOff >= 0 & 
        
		/* berTLVOutArray - output TLV byte array */
		/* NullPointerException if berTLVOutArray is null */
		berTLVOutArray : seq1(JBYTE) &
		
		/* bTLVOutOff - offset within byte array where output begins */
		/* ArrayIndexOutOfBoundsException if 'bTLVOutOff' is negative */
        bTLVOutOff : JSHORT &
		bTLVOutOff >= 0 

		/* ArrayIndexOutOfBoundsException if accessing the input or output array would 
		cause access of data outside array bounds */
		/* TLVException.MALFORMED_TLV if the TLV representation in the input byte array is 
		not a well-formed constructed BER TLV. */
		
	THEN
		ANY constructedbertlv_ResultSize
		WHERE (constructedbertlv_ResultSize : JSHORT) &
		(constructedbertlv_ResultSize >= 0)
		THEN resultSize := constructedbertlv_ResultSize
		END
	END;

/*--------------------------------------------------------------------------------------*/
	result <-- find_2(berTLVArray, bTLVOff, berTagArray, bTagOff) = 
	/* throws: NullPointerException, ArrayIndexOutOfBoundsException,
			TLVException */
	PRE
		/* berTLVArray - input byte array */
		/*NullPointerException if 'berTLVArray' is null */
		berTLVArray : seq1(JBYTE) & 
		
		/* bTLVOff - offset within byte array containing the tlv data */
		/*ArrayIndexOutOfBoundsException if 'bTLVOff' is negative*/
		bTLVOff : JSHORT &
		bTLVOff >= 0 & 
		
		/* berTagArray - byte array containing the Tag to be searched */		
		berTagArray : seq(JBYTE) &
		
		/* bTagOff - offset within berTagArray byte array where tag data begins */
		/*ArrayIndexOutOfBoundsException if 'bTagOff' is negative*/
		bTagOff : JSHORT &
		bTagOff >= 0 

		/* ArrayIndexOutOfBoundsException if accessing the input arrays would cause access 
		of data outside array bounds */
		/* TLVException.MALFORMED_TLV if the TLV representation in the specified byte array 
		is not a well-formed constructed BER TLV structure */
		/* TLVException.MALFORMED_TAG if tag representation in the specified byte array is 
		is not a well-formed BER Tag structure */
		
	THEN
		CHOICE
			result : (result : JSHORT & result >=0)
		OR
			result := cast_short(-1)
		END
	END;

/*--------------------------------------------------------------------------------------*/
	result <-- findNext_2(berTLVArray, bTLVOff, startOffset, berTagArray, bTagOff) = 
	/* throws: NullPointerException, ArrayIndexOutOfBoundsException,
			TLVException */
	PRE
		/* berTLVArray - input byte array */
		/* NullPointerException if 'berTLVArray' is null */
		berTLVArray : seq1(JBYTE) & 
	
		/* bTLVOff - offset within byte array containing the TLV data */
		/* ArrayIndexOutOfBoundsException if 'bTLVOff' is negative */
		bTLVOff : JSHORT & 
		bTLVOff >= 0 &
		
		/* startOffset - offset within the input berTLVArray to begin the search */
		/* ArrayIndexOutOfBoundsException if 'startOffset' is negative */
		startOffset : JSHORT & 
		startOffset >= 0 &
		
		/* berTagArray - byte array containing the Tag to be searched */
		berTagArray : seq(JBYTE) &
		
		/* bTagOff - offset within berTagArray byte array where tag data begins */
		/* ArrayIndexOutOfBoundsException if 'bTagOff' is negative */
		bTagOff : JSHORT & 
		bTagOff >= 0 

		/* ArrayIndexOutOfBoundsException if accessing the input arrays would cause access 
		of data outside array bounds */
		/* TLVException.MALFORMED_TLV if the TLV representation in the specified byte array 
		is not a well-formed constructed BER TLV structure */
		/* TLVException.MALFORMED_TAG if the tag representation in the specified byte array 
		is not a well-formed BER Tag structure. */
		/* TLVException.INVALID_PARAM if the berTLVArray array does not contain a top level 
		contained TLV element at the specified startOffset offset */
		
	THEN
		CHOICE
			result : (result : JSHORT & result >=0)
		OR
			result := cast_short(-1)
		END
	END
END
