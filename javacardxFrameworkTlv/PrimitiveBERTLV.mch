/* PrimitiveBERTLV
 * Author: simone
 * Creation date: 01/09/11
 */
MACHINE
    PrimitiveBERTLV

SEES
	javacardxFrameworkTlvClasses,
	JShort, 
	JByte

/*This class extends javacardx.framework.tlv.BERTLV */
EXTENDS 
	BERTlv

OPERATIONS
	C_PrimitiveBERTLV(numValueBytes) =
	PRE
		numValueBytes : JSHORT
	THEN
		skip
	END;

/*--------------------------------------------------------------------------------------*/
	/*This method is also declared in BERTLV*/
	resultSize <-- init_1(bArray, bOff, bLen) = 
	/* throws: NullPointerException, ArrayIndexOutOfBoundsException,
			TLVException */
	PRE
		/* bArray - input byte array */
		/* NullPointerException if 'bArray' is null */
		bArray : seq1(JBYTE) & 
		
		/* bOff - offset within byte array containing the TLV data */
		/* ArrayIndexOutOfBoundsException if 'bOff' is negative */ 
		bOff : JSHORT &
		bOff >= 0 & 
		
		/* bLen - byte length of input data */
		/* ArrayIndexOutOfBoundsException if 'bLen' is negative */
		bLen : JSHORT &
		bLen >= 0 & 
		
		/* ArrayIndexOutOfBoundsException if 'bOff+bLen' is greater than the length of 
		the 'bArray' */
		sum_short(bOff, bLen) <= size(bArray) 

		/* ArrayIndexOutOfBoundsException if accessing the input array would cause access 
		of data outside array bounds */
		/* TLVException.INSUFFICIENT_STORAGE if the required capacity is not available and 
		the implementation does not support automatic expansion */
        /* TLVException.MALFORMED_TLV if the input data is not a well-formed BER TLV or the 
		input data represents a primitive BER TLV structure and this is a ConstructedBERTLV 
		object or the input data represents a constructed BER TLV structure and this is a 
		PrimiitveBERTLV object */
		
	THEN
		ANY bertlv_ResultSize
		WHERE (bertlv_ResultSize : JSHORT) & 
		(bertlv_ResultSize >= 0)
		THEN resultSize := bertlv_ResultSize
		END
	END;

/*--------------------------------------------------------------------------------------*/
	resultSize <-- init_2(tag, vArray, vOff, vLen) = 
	/* throws: NullPointerException, ArrayIndexOutOfBoundsException,
			TLVException */
	PRE
		/* tag - a BERTag object */
		tag : PRIMITIVE_BERTAG & 
		
		/* vArray - the byte array containing length bytes of TLV value */
		/*NullPointerException if 'vArray' is null*/
		vArray : seq1(JBYTE) & 
		
		/* vOff - offset within the vArray byte array where data begins */
		/* ArrayIndexOutOfBoundsException if the array offset parameter is negative */
		vOff : JSHORT &
		vOff >= 0 & 
		
		/* vLen - byte length of the value data in vArray */
		/* ArrayIndexOutOfBoundsException if the array length parameter is negative */
		vLen : JSHORT &
		vLen >= 0 & 
		/* ArrayIndexOutOfBoundsException if 'vOff+vLen' is greater than the length 
		of the 'vArray' */
		sum_short(vOff, vLen) <= size(vArray) 

		/* NullPointerException if 'tag' is null */
		/* TLVException.INSUFFICIENT_STORAGE if the required capacity is not available and 
		the implementation does not support automatic expansion */
		
	THEN
		ANY primitivebertlv_ResultSize
		WHERE (primitivebertlv_ResultSize : JSHORT) &
		(primitivebertlv_ResultSize >= 0)
		THEN resultSize := primitivebertlv_ResultSize
		END
	END;

/*--------------------------------------------------------------------------------------*/
	resultSize <-- appendValue_1(vArray, vOff, vLen) = 
	/* throws: NullPointerException, ArrayIndexOutOfBoundsException,
			TLVException */
	PRE
		/* vArray - the byte array containing length bytes of TLV value */
		/* NullPointerException if 'vArray' is null */
		vArray : seq1(JBYTE) & 
		
		/* vOff - offset within the vArray byte array where data begins */
		/* ArrayIndexOutOfBoundsException if the array offset parameter is negative */
		vOff : JSHORT &
		vOff >= 0 & 
		
		/* vLen - the byte length of the value in the input vArray */
		/* ArrayIndexOutOfBoundsException if the array length parameter is negative */
		vLen : JSHORT &
		vLen >= 0 & 
		/* ArrayIndexOutOfBoundsException if 'vOff+vLen' is greater than the length 
		of the 'vArray' */
		sum_short(vOff, vLen) <= size(vArray) 

		/* TLVException.INSUFFICIENT_STORAGE if the required capacity is not available and 
		the implementation does not support automatic expansion */
		/* TLVException.EMPTY_TLV if this PrimitiveBERTLV object is empty */
		
	THEN
		ANY primitivebertlv_ResultSize
		WHERE (primitivebertlv_ResultSize : JSHORT) &
		(primitivebertlv_ResultSize >= 0)
		THEN resultSize := primitivebertlv_ResultSize
		END
	END;

/*--------------------------------------------------------------------------------------*/
	resultSize <-- replaceValue(vArray, vOff, vLen) = 
	/* throws: NullPointerException, ArrayIndexOutOfBoundsException,
			TLVException */
	PRE
		/* vArray - the byte array containing length bytes of TLV value */
		/* NullPointerException if 'vArray' is null */
		vArray : seq1(JBYTE) & 
		
		/* vOff - offset within the vArray byte array where data begins */
		/* ArrayIndexOutOfBoundsException if the array offset parameter is negative */
		vOff : JSHORT &
		vOff >= 0 & 
		
		/* vLen - the byte length of the value in the input vArray */
		/* ArrayIndexOutOfBoundsException if the array length parameter is negative */
		vLen : JSHORT &
		vLen >= 0 & 
		/* ArrayIndexOutOfBoundsException if 'vOff+vLen' is greater than the length 
		of the 'vArray' */
		sum_short(vOff, vLen) <= size(vArray) 

		/* TLVException.INSUFFICIENT_STORAGE if the required capacity is not available and 
		the implementation does not support automatic expansion */
		/* TLVException.EMPTY_TLV if this PrimitiveBERTLV object is empty */
	
	THEN
		ANY primitivebertlv_ResultSize
		WHERE (primitivebertlv_ResultSize : JSHORT) &
		(primitivebertlv_ResultSize >= 0)
		THEN resultSize := primitivebertlv_ResultSize
		END
	END;

/*--------------------------------------------------------------------------------------*/
	result <-- getValue(tlvValue, vOff) = 
	/* throws: NullPointerException, ArrayIndexOutOfBoundsException,
			TLVException */
	PRE
		/* tlvValue - the output byte array */
		/* NullPointerException if 'tlvValeu' is null */
		/* TLVException.TLV_SIZE_GREATER_THAN_32767 if the size of the Primitive BER TLV 
		is > 32767 */
		tlvValue : seq1(JBYTE) & 
		size(tlvValue) <= 32767 & 

		/* tOff - offset within the tlvValue byte array where output data begins */
		/* ArrayIndexOutOfBoundsException if the array offset parameter is negative */
		vOff : JSHORT &
		vOff >= 0 

		/* TLVException.EMPTY_TLV if this PrimitiveBERTLV object is empty */
	
	THEN
		ANY primitivebertlv_Result
		WHERE (primitivebertlv_Result : JSHORT) &
		(primitivebertlv_Result >= 0)
		THEN result := primitivebertlv_Result
		END
	END;

/*--------------------------------------------------------------------------------------*/
	result <-- getValueOffset(berTlvValue, bTLVOff) = 
	/* throws: NullPointerException, ArrayIndexOutOfBoundsException,
			TLVException */
	PRE
		/* berTLVArray - input byte array */
		/* NullPointerException if 'berTlvValue' is null */
		/* TLVException.TLV_SIZE_GREATER_THAN_32767 if the size of the Primitive BER TLV 
		is > 32767 */
		berTlvValue : seq1(JBYTE) & 
		size(berTlvValue) <= 32767 & 
		
		/* bTLVOff - offset within byte array containing the TLV data */
		/* ArrayIndexOutOfBoundsException if the array offset parameter is negative */
		bTLVOff : JSHORT &
		bTLVOff >= 0 

		/* TLVException.MALFORMED_TLV if the TLV representation in the input byte array is 
		not a well-formed primitive BER TLV structure */
		
	THEN
		ANY primitivebertlv_Result
		WHERE (primitivebertlv_Result : JSHORT) &
		(primitivebertlv_Result >= 0)
		THEN result := primitivebertlv_Result
		END
	END;

/*--------------------------------------------------------------------------------------*/
	result <-- toBytes_2(berTagArray, berTagOff, valueArray, vOff, vLen, outBuf, bOff) = 
	/* throws: NullPointerException, ArrayIndexOutOfBoundsException,
			TLVException */
	PRE	
		/* berTagArray - input byte array */
		/* NullPointerException if 'berTagArray' is null */
		/* TLVException.TLV_SIZE_GREATER_THAN_32767 if the size of the resulting 
		Primitive BER TLV is > 32767 */
		berTagArray : seq1(JBYTE) & 
		size(berTagArray) <= 32767 & 
		
		/* berTagOff - offset within byte array containing first byte of tag */
		/* ArrayIndexOutOfBoundsException if 'berTagOff' is negative */
		berTagOff : JSHORT &
		berTagOff >= 0 & 
		
		/* valueArray - input byte array containing primitive value */
		/* NullPointerException if 'valueArray' is null */
		valueArray : seq1(JBYTE) & 
		
		/* vOff - offset within byte array containing the first byte of value */
		/* ArrayIndexOutOfBoundsException if 'vOff' is negative */
		vOff : JSHORT &
		vOff >= 0 & 
		
		/* vLen - length in bytes of the value component of the TLV */
		/* ArrayIndexOutOfBoundsException if 'vLen' is negative */
		vLen : JSHORT &
		vLen >= 0 & 
		/* ArrayIndexOutOfBoundsException if 'vOff+vLen' is greater than the length 
		of the 'valueArray' */
		sum_short(vOff, vLen) <= size(valueArray) & 
		
		/* outBuf - output byte array */
		outBuf : seq1(JBYTE) & /*NullPointerException if 'outBuf' is null*/
		
		/* bOff - offset within byte array output data begins */
		bOff : JSHORT &
		bOff >= 0 /*ArrayIndexOutOfBoundsException if 'bOff' is negative*/

		/* ArrayIndexOutOfBoundsException - if accessing the input or output arrays would 
		cause access of data outside array bounds */
		/* TLVException.MALFORMED_TAG if the tag representation in the byte array is not 
		a well-formed constructed array tag */
		
	THEN
		ANY primitivebertlv_Result
		WHERE (primitivebertlv_Result : JSHORT) &
		(primitivebertlv_Result >= 0)
		THEN result := primitivebertlv_Result
		END
	END;

/*--------------------------------------------------------------------------------------*/
	resultSize <-- appendValue_2(berTLVArray, bTLVOff, vArray, vOff, vLen) = 
	/* throws: NullPointerException, ArrayIndexOutOfBoundsException,
			TLVException */
	PRE
		/* berTLVArray - input byte array */
		/* NullPointerException if 'berTLVArray' is null */
		berTLVArray : seq1(JBYTE) & 
		size(berTLVArray) <= 32767 & /*TLVException.TLV_SIZE_GREATER_THAN_32767 if the size of the resulting Primitive BER TLV is > 32767*/
		
		/* bTLVOff - offset within byte array containing the TLV data */
		/* ArrayIndexOutOfBoundsException if 'berTagOff' is negative */
		bTLVOff : JSHORT &
		bTLVOff >= 0 & 
		
		/* vArray - the byte array containing value to be appended */
		/* NullPointerException if 'vArray' is null */
		vArray : seq1(JBYTE) & 
		
		/* vOff - offset within the vArray byte array where the data begins */
		/* ArrayIndexOutOfBoundsException if 'vOff' is negative */
		vOff : JSHORT &
		vOff >= 0 & 
		
		/* vLen - the byte length of the value in the input vArray */
		/* ArrayIndexOutOfBoundsException if 'vLen' is negative */
		vLen : JSHORT &
		vLen >= 0 & 
		/* ArrayIndexOutOfBoundsException if 'vOff+vLen' is greater than the length 
		of the 'vArray' */
		sum_short(vOff, vLen) <= size(vArray) 
		
		/* ArrayIndexOutOfBoundsException - if accessing the input arrays would cause 
		access of data outside array bounds */
		/* TLVException.MALFORMED_TLV if the TLV representation in the input byte array 
		is not a well-formed primitive BER TLV structure */
		
	THEN
		ANY primitivebertlv_ResultSize
		WHERE (primitivebertlv_ResultSize : JSHORT) &
		(primitivebertlv_ResultSize >= 0)
		THEN resultSize := primitivebertlv_ResultSize
		END
	END
END
