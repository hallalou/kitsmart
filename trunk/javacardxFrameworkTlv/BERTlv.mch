/* BERTlv
 *
 * The abstract BERTLV class encapsulates a BER TLV structure.
 *
 * Author: simone
 * Creation date: 01/09/11
 */
MACHINE
    BERTlv

SEES
	javacardxFrameworkTlvClasses,
	JShort, 
	JByte

/*This class extends java.lang.Object */
EXTENDS
	Object

OPERATIONS
	resultSize <-- init(bArray, bOff, bLen) = 
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
	result <-- getInstance(bArray, bOff, bLen) = 
	/* throws: NullPointerException, ArrayIndexOutOfBoundsException,
			TLVException */
	PRE
		/* bArray - input byte array */
		/*NullPointerException if 'bArray' is null*/
		bArray : seq1(JBYTE) & 
		
		/* bOff - offset within byte array containing the tlv data */
		/*ArrayIndexOutOfBoundsException if 'bOff' is negative*/ 
		bOff : JSHORT &
		bOff >= 0 & 
		
		/* bLen - byte length of input data */
		/*ArrayIndexOutOfBoundsException if 'bLen' is negative*/
		bLen : JSHORT &
		bLen >= 0 & 
		
		/* ArrayIndexOutOfBoundsException if 'bOff+bLen' is greater than the length of 
		the 'bArray' */
		sum_short(bOff, bLen) <= size(bArray) 

		/* ArrayIndexOutOfBoundsException - if accessing the input array would cause access 
		of data outside array bounds */
		/* TLVException.ILLEGAL_SIZE if the TLV structure requested is larger than the 
		supported maximum size */
		/* TLVException.MALFORMED_TLV if the input data is not a well-formed BER TLV */
		
	THEN
		ANY bertlv_Result
		WHERE (bertlv_Result : BERTLV)
		THEN result := bertlv_Result
		END
	END;

/*--------------------------------------------------------------------------------------*/
	result <-- toBytes(outBuf, bOff) =
	/* throws: NullPointerException, ArrayIndexOutOfBoundsException,
			TLVException */
	PRE
		/* outBuf - output byte array */
		/*NullPointerException if 'outBuf' is null*/
		/*TLVException.TLV_SIZE_GREATER_THAN_32767 if the size of the BER TLV is > 32767*/
		outBuf : seq1(JBYTE) &		
		size(outBuf) <= 32767 & 
		
		/* bOff - offset within byte array output data begins */
		bOff : JSHORT &
		bOff >= 0 /*ArrayIndexOutOfBoundsException if 'bOff' is negative*/

		/* ArrayIndexOutOfBoundsException if accessing the output array would cause access 
		of data outside array bounds */
		/* TLVException.EMPTY_TLV if the BERTLV object is empty */
		
	THEN
		ANY bertlv_Result
		WHERE (bertlv_Result : JSHORT) & (bertlv_Result >= 0)
		THEN result := bertlv_Result
		END
	END;

/*--------------------------------------------------------------------------------------*/
	result <-- getTag_1 = 
	/* throws: TLVException */
		ANY bertlv_Result
		WHERE (bertlv_Result : BERTAG)
		THEN result := bertlv_Result
		END;

		/* TLVException.EMPTY_TLV if the BERTLV object is empty. */

/*--------------------------------------------------------------------------------------*/
	result <-- getLength_1 = 
		/* TLVException.TLV_LENGTH_GREATER_THAN_32767 if the value of the Length component 
		is > 32767 */
		/* TLVException.EMPTY_TLV if the BERTLV object is empty */
		
		ANY bertlv_Result
		WHERE (bertlv_Result : JSHORT) & 
		(bertlv_Result >= 0 & bertlv_Result <= 32767)
		THEN result := bertlv_Result
		END;		

/*--------------------------------------------------------------------------------------*/
	result <-- size_1 = /*size is a reserved word*/
	/* throws: TLVException */
		/* TLVException.TLV_SIZE_GREATER_THAN_32767 if the size of TLV structure is > 32767 */
		/* TLVException.EMPTY_TLV if the BERTLV object is empty */
		
		ANY bertlv_Result
		WHERE (bertlv_Result : JSHORT) & 
		(bertlv_Result >= 0 & bertlv_Result <= 32767)
		THEN result := bertlv_Result
		END;

/*--------------------------------------------------------------------------------------*/
	result <-- verifyFormat(berTlvArray, bOff, bLen) = 
	PRE
		/* berTlvArray - input byte array */
		/*NullPointerException if 'berTlvArray' is null*/
		berTlvArray : seq1(JBYTE) & 
		
		/* bOff - offset within byte array containing first byte */
		/*ArrayIndexOutOfBoundsException if 'bOff' is negative*/
		bOff : JSHORT &
		bOff >= 0 & 
		
		/* bLen - byte length of input BER TLV data */
		/*ArrayIndexOutOfBoundsException if 'bLen' is negative*/
		/*ArrayIndexOutOfBoundsException if 'bOff+bLen' is greater than the length of the 
		'berTlvArray'*/
		bLen : JSHORT &
		bLen >= 0 & 
		sum_short(bOff, bLen) <= size(berTlvArray) 

		/* ArrayIndexOutOfBoundsException if accessing the input array would cause access 
		of data outside array bounds */
		
	THEN
		CHOICE
			result := TRUE
		OR
			result := FALSE
		END
	END;

/*--------------------------------------------------------------------------------------*/
	resultSize <-- getTag_2(berTLVArray, bTLVOff, berTagArray, bTagOff) = 
	/* throws: NullPointerException, ArrayIndexOutOfBoundsException,
			TLVException */
	PRE
		/* berTLVArray - input byte array */
		/* NullPointerException if 'berTLVArray' is null */
		berTLVArray : seq1(JBYTE) & 
		
		/* bTLVOff - offset within byte array containing the tlv data */
		/* ArrayIndexOutOfBoundsException if 'bTLVOff' is negative */
		bTLVOff : JSHORT &
		bTLVOff >= 0 & 
		
		/* berTagArray - output Tag byte array */
		/* NullPointerException if 'berTagArray' is null */
		/* TLVException.ILLEGAL_SIZE if the size of the Tag component is > 32767. */
		berTagArray : seq1(JBYTE) & 
		size(berTagArray) <= 32767 &
		
		/* bTagOff - offset within byte array where output begins */
		/*ArrayIndexOutOfBoundsException if 'bTagOff' is negative*/
		bTagOff : JSHORT &
		bTagOff >= 0 

		/* ArrayIndexOutOfBoundsException if accessing the input or output array would 
		cause access of data outside array bounds */
		
	THEN
		ANY bertlv_ResultSize
		WHERE (bertlv_ResultSize : JSHORT) &
		(bertlv_ResultSize >= 0)
		THEN resultSize := bertlv_ResultSize
		END
	END;

/*--------------------------------------------------------------------------------------*/
	result <-- getLength_2(berTLVArray, bOff) = 
	/* throws: NullPointerException, ArrayIndexOutOfBoundsException,
			TLVException */
	PRE
		/* berTLVArray - input byte array */
		/* NullPointerException if 'berTLVArray' is null */
		/* TLVException.TLV_LENGTH_GREATER_THAN_32767 if the length element(L) > 32767 */
		berTLVArray : seq1(JBYTE) & 
		size(berTLVArray) <= 32767 &
		
		/* bOff - offset within byte array containing the tlv data */
		/*ArrayIndexOutOfBoundsException if 'bOff' is negative*/
		bOff : JSHORT &
		bOff >= 0 

		/* ArrayIndexOutOfBoundsException if accessing the input array would cause access 
		of data outside array bounds */
		/* TLVException.MALFORMED_TLV if the input data is not a well-formed BER TLV */
		
	THEN
		ANY bertlv_Result
		WHERE (bertlv_Result : JSHORT) & (bertlv_Result >= 0)
		THEN result := bertlv_Result
		END
	END
END
