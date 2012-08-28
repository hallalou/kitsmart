/* ECKey
 *
 * The ECKey interface is the base interface for the EC algorithm's private and 
 * public key implementations.
 *
 * Author: simone
 * Creation date: 07/04/11
 */
MACHINE
    ECKey

SEES
	JShort,
	JByte 

OPERATIONS
	/* The 3 first operations are taged with _1, _2 and _3 because they have the same name. */	
	setFieldFP_1(buffer, offset, length)= 
	/* throws: CryptoException */
	PRE
		/* buffer - the input buffer */
		buffer : seq(JBYTE) &
		
		/* offset - the offset into the input buffer at which the parameter value begins */
		offset : JSHORT	&
		offset >= 0 &
		
		/* length - the byte length of the parameter value */
		length : JSHORT &
		length >= 0

		/* CryptoException.ILLEGAL_VALUE if the input parameter data is inconsistent with 
		the key length or if input data decryption is required and fails. */
		/* CryptoException.NO_SUCH_ALGORITHM if the key is neither of type TYPE_EC_FP_PUBLIC 
		nor TYPE_EC_FP_PRIVATE. */
		
	THEN
		skip
	END;

/*------------------------------------------------------------------------------------------*/
	setFieldF2M_2(ee)= 
	/* throws: CryptoException */
	PRE
		/* e - the value of the intermediate exponent of the trinomial */
		/* CryptoException if the input parameter e is not such that 0 < e < n */
		ee : JSHORT &
		ee > 0

		/* CryptoException.NO_SUCH_ALGORITHM if the key is neither of type 
		TYPE_EC_F2M_PUBLIC nor TYPE_EC_F2M_PRIVATE. */
		
	THEN
		skip
	END;

/*------------------------------------------------------------------------------------------*/
	setFieldF2M_3(e1, e2, e3)= 
	/* throws: CryptoException */
	PRE
		/* CryptoException if the input parameters ei where ei = {e1, e2, e3} are not such 
		that for all ei, n > ei > 0 */
		/* e1 - the value of the first of the intermediate exponents of the pentanomial */
		e1 : JSHORT &
		e1 > 0 &
		
		/* e2 - the value of the second of the intermediate exponent of the pentanomial */
		e2 : JSHORT &
		e2 > 0 &
		
		/* e3 - the value of the third of the intermediate exponents */
		e3 : JSHORT &
		e3 > 0 
				
	THEN
		skip
	END;

/*------------------------------------------------------------------------------------------*/
	setA(buffer, offset, length)= 
	/* throws: CryptoException */
	PRE
		/* buffer - the input buffer */
		buffer : seq(JBYTE) &
		
		/* offset - the offset into the input buffer at which the coefficient value begins */
		offset : JSHORT	&
		offset >= 0 &
		
		/* length - the byte length of the coefficient value */
		length : JSHORT &
		length >= 0

		/* CryptoException if the input parameter data is inconsistent with the key length or 
		if input data decryption is required and fails */
		
	THEN
		skip
	END;

/*------------------------------------------------------------------------------------------*/
	setB(buffer, offset, length)= 
	/* throws: CryptoException */
	PRE
		/* buffer - the input buffer */
		buffer : seq(JBYTE) &
		
		/* offset - the offset into the input buffer at which the coefficient value begins */
		offset : JSHORT	&
		offset >= 0 &
		
		/* length - the byte length of the coefficient value */
		length : JSHORT &
		length >= 0

		/* CryptoException if the input parameter data is inconsistent with the key length or 
		if input data decryption is required and fails */
		
	THEN
		skip
	END;

/*------------------------------------------------------------------------------------------*/
	setG(buffer, offset, length)= 
	/* throws: CryptoException */
	PRE
		/* buffer - the input buffer */
		buffer : seq(JBYTE) &
		
		/* offset - the offset into the input buffer at which the point specification begins */
		offset : JSHORT	&
		offset >= 0 &
		
		/* length - the byte length of the point specification */
		length : JSHORT &
		length >= 0

		/* CryptoException if the input parameter data format is incorrect, or if the input 
		parameter data is inconsistent with the key length, or if input data decryption is 
		required and fails */
		
	THEN
		skip
	END;

/*------------------------------------------------------------------------------------------*/
	setR(buffer, offset, length)= 
	/* throws: CryptoException */
	PRE
		/* buffer - the input buffer */
		buffer : seq(JBYTE) &
		
		/* offset - the offset into the input buffer at which the order begins */
		offset : JSHORT	&
		offset >= 0 &
		
		/* length - the byte length of the order */
		length : JSHORT &
		length >= 0

		/* CryptoException if the input parameter data is inconsistent with the key length, or 
		if input data decryption is required and fails */
		
	THEN
		skip
	END;

/*------------------------------------------------------------------------------------------*/
	setK(kk)=
	PRE
		/* K - the value of the cofactor */
		kk : JSHORT	
		
	THEN
		skip
	END;

/*------------------------------------------------------------------------------------------*/
	field <-- getField(buffer, offset)= 
	/* throws: CryptoException */
	PRE
		/* buffer - the output buffer */
		buffer : seq(JBYTE) &
		
		/* offset - the offset into the output buffer at which the parameter value is to begin */
		offset : JSHORT	&
		offset >= 0
		
		/* CryptoException if the field specification parameter value of the key has not been 
		successfully initialized since the time the initialized state of the key was set to false.*/
		
	THEN
		ANY eckey_field
		WHERE (eckey_field : JSHORT)
		THEN field := eckey_field
		END
	END;

/*------------------------------------------------------------------------------------------*/
	valueA <-- getA(buffer, offset)= 
	/* throws: CryptoException */
	PRE
		/* buffer - the output buffer */
		buffer : seq(JBYTE) &
		
		/* offset - the offset into the output buffer at which the coefficient value is to begin */
		offset : JSHORT	&
		offset >= 0

		/* CryptoException if the coefficient of the curve of the key has not been successfully 
		initialized since the time the initialized state of the key was set to false. */
		
	THEN
		ANY eckey_valueA 
		WHERE (eckey_valueA : JSHORT)
		THEN valueA := eckey_valueA
		END
	END;

/*------------------------------------------------------------------------------------------*/
	valueB <-- getB(buffer, offset)= 
	/* throws: CryptoException */
	PRE
		/* buffer - the output buffer */
		buffer : seq(JBYTE) &
		
		/* offset - the offset into the output buffer at which the coefficient value is to begin */
		offset : JSHORT	&
		offset >= 0
			
		/* CryptoException if the second coefficient of the curve of the key has not been 
		successfully initialized since the time the initialized state of the key was set to false. */
		
	THEN
		ANY eckey_valueB
		WHERE (eckey_valueB : JSHORT)
		THEN valueB := eckey_valueB
		END
	END;

/*------------------------------------------------------------------------------------------*/
	valueG <-- getG(buffer, offset)= 
	/* throws: CryptoException */
	PRE
		/* buffer - the output buffer */
		buffer : seq(JBYTE) &
		
		/* offset - the offset into the output buffer at which the point specification data is to begin */
		offset : JSHORT	&
		offset >= 0	
	
		/* CryptoException if the fixed point of the curve of the key has not been successfully 
		initialized since the time the initialized state of the key was set to false. */
		
	THEN
		ANY eckey_valueG 
		WHERE (eckey_valueG : JSHORT)
		THEN valueG := eckey_valueG
		END
	END;

/*------------------------------------------------------------------------------------------*/
	valueR <-- getR(buffer, offset)= 
	/* throws: CryptoException */
	PRE
		/* buffer - the output buffer */
		buffer : seq(JBYTE) &
		
		/* offset - the offset into the input buffer at which the order begins */
		offset : JSHORT	&
		offset >= 0	
	
		/* CryptoException if the order of the fixed point G of the curve of the key has not 
		been successfully initializedsince the time the initialized state of the key was set to false. */
		
	THEN
		ANY eckey_valueR 
		WHERE (eckey_valueR : JSHORT)
		THEN valueR := eckey_valueR
		END
	END;

/*------------------------------------------------------------------------------------------*/
	valueK <-- getK = 
	/* throws: CryptoException */

		/* CryptoException if the cofactor of the order of the fixed point G of the curve of the 
		key has not been successfully initialized since the time the initialized state of the key 
		was set to false. */
		
		ANY eckey_valueK 
		WHERE (eckey_valueK : JSHORT)
		THEN valueK := eckey_valueK
	END
END
