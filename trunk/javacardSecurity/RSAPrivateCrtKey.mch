/* RSAPrivateCrtKey
 *
 * The RSAPrivateCrtKey interface is used to sign data using the RSA algorithm in its 
 * Chinese Remainder Theorem form.
 *
 * Author: simone
 * Creation date: 07/04/11
 */
MACHINE
    RSAPrivateCrtKey

SEES
	JShort,
	JByte

/*This class extends javacard.security.PrivateKey */
EXTENDS
	PrivateKey

OPERATIONS
	setP(buffer, offset, length)= 
	/* throws: CryptoException */
	PRE
		/* buffer - the input buffer */
		buffer : seq(JBYTE) &
		
		/* offset - the offset into the input buffer at which the parameter value begins */
		offset : JSHORT	&
		offset >= 0 &
		
		/* length - the length of the parameter */
		length : JSHORT &
		length >= 0

		/* CryptoException if the input parameter data length is inconsistent with the 
		implementation or if input data decryption is required and fails */
		
	THEN
		skip
	END;

/*------------------------------------------------------------------------------------------*/
	setQ(buffer, offset, length)= 
	/* throws: CryptoException */
	PRE
		/* buffer - the input buffer */
		buffer : seq(JBYTE) &
		
		/* offset - the offset into the input buffer at which the parameter value begins */
		offset : JSHORT	&
		offset >= 0 &
		
		/* length - the length of the parameter */
		length : JSHORT &
		length >= 0

		/* CryptoException if the input parameter data length is inconsistent with the 
		implementation or if input data decryption is required and fails */
		
	THEN
		skip
	END;

/*------------------------------------------------------------------------------------------*/
	setDP1(buffer, offset, length)= 
	/* throws: CryptoException */
	PRE
		/* buffer - the input buffer */
		buffer : seq(JBYTE) &
		
		/* offset - the offset into the input buffer at which the parameter value begins */
		offset : JSHORT	&
		offset >= 0 &
		
		/* length - the length of the parameter */
		length : JSHORT &
		length >= 0

		/* CryptoException if the input parameter data length is inconsistent with the 
		implementation or if input data decryption is required and fails */
		
	THEN
		skip
	END;

/*------------------------------------------------------------------------------------------*/
	setDQ1(buffer, offset, length)= 
	/* throws: CryptoException */
	PRE
		/* buffer - the input buffer */
		buffer : seq(JBYTE) &
		
		/* offset - the offset into the input buffer at which the parameter value begins */
		offset : JSHORT	&
		offset >= 0 &
		
		/* length - the length of the parameter */
		length : JSHORT &
		length >= 0

		/* CryptoException if the input parameter data length is inconsistent with the 
		implementation or if input data decryption is required and fails */
		
	THEN
		skip
	END;

/*------------------------------------------------------------------------------------------*/
	setPQ(buffer, offset, length)= 
	/* throws: CryptoException */
	PRE
		/* buffer - the input buffer */
		buffer : seq(JBYTE) &
		
		/* offset - the offset into the input buffer at which the parameter value begins */
		offset : JSHORT	&
		offset >= 0 &
		
		/* length - the length of the parameter */
		length : JSHORT &
		length >= 0

		/* CryptoException if the input parameter data length is inconsistent with the 
		implementation or if input data decryption is required and fails */
		
	THEN
		skip
	END;

/*------------------------------------------------------------------------------------------*/
	valueP <-- getP(buffer, offset)=
	PRE
		/* buffer - the output buffer */
		buffer : seq(JBYTE) &
		
		/* offset - the offset into the output buffer at which the parameter value begins */
		offset : JSHORT	&
		offset >= 0	

		/* CryptoException if the value of P parameter has not been successfully initialized 
		since the time the initialized state of the key was set to false. */
		 
	THEN
		ANY rsaprivatecrtkey_valueP
		WHERE ((rsaprivatecrtkey_valueP : JSHORT) &
		(rsaprivatecrtkey_valueP >= 0))
		THEN valueP := rsaprivatecrtkey_valueP
		END
	END;

/*------------------------------------------------------------------------------------------*/
	valueQ <-- getQ(buffer, offset)=
	PRE
		/* buffer - the output buffer */
		buffer : seq(JBYTE) &
		
		/* offset - the offset into the output buffer at which the parameter value begins */
		offset : JSHORT	&
		offset >= 0	

		/* CryptoException if the value of Q parameter has not been successfully initialized 
		since the time the initialized state of the key was set to false. */
		
	THEN
		ANY rsaprivatecrtkey_valueQ
		WHERE ((rsaprivatecrtkey_valueQ : JSHORT) &
		(rsaprivatecrtkey_valueQ >= 0))
		THEN valueQ := rsaprivatecrtkey_valueQ
		END
	END;

/*------------------------------------------------------------------------------------------*/
	valueDP1 <-- getDP1(buffer, offset)=
	PRE
		/* buffer - the output buffer */
		buffer : seq(JBYTE) &
		
		/* offset - the offset into the output buffer at which the parameter value begins */
		offset : JSHORT	&
		offset >= 0	

		/* CryptoException if the value of DP1 parameter has not been successfully initialized 
		since the time the initialized state of the key was set to false. */
		
	THEN
		ANY rsaprivatecrtkey_valueDP1
		WHERE ((rsaprivatecrtkey_valueDP1 : JSHORT) &
		(rsaprivatecrtkey_valueDP1 >= 0))
		THEN valueDP1 := rsaprivatecrtkey_valueDP1
		END
	END;

/*------------------------------------------------------------------------------------------*/
	valueDQ1 <-- getDQ1(buffer, offset)=
	PRE
		/* buffer - the output buffer*/
		buffer : seq(JBYTE) &
		
		/* offset - the offset into the output buffer at which the parameter value begins */
		offset : JSHORT	&
		offset >= 0	

		/*CryptoException if the value of DQ1 parameter has not been successfully initialized 
		 since the time the initialized state of the key was set to false. */
		 
	THEN
		ANY rsaprivatecrtkey_valueDQ1
		WHERE ((rsaprivatecrtkey_valueDQ1 : JSHORT) &
		(rsaprivatecrtkey_valueDQ1 >= 0))
		THEN valueDQ1 := rsaprivatecrtkey_valueDQ1
		END
	END;

/*------------------------------------------------------------------------------------------*/
	valuePQ <-- getPQ(buffer, offset)=
	PRE
		/* buffer - the output buffer */
		buffer : seq(JBYTE) &
		
		/* offset - the offset into the output buffer at which the parameter value begins */
		offset : JSHORT	&
		offset >= 0	

		/* CryptoException if the value of PQ parameter has not been successfully initialized 
		since the time the initialized state of the key was set to false. */
		
	THEN
		ANY rsaprivatecrtkey_valuePQ
		WHERE ((rsaprivatecrtkey_valuePQ : JSHORT) &
		(rsaprivatecrtkey_valuePQ >= 0))
		THEN valuePQ := rsaprivatecrtkey_valuePQ
		END
	END
END
