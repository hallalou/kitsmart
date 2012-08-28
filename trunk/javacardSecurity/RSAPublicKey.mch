/* RSAPublicKey
 *
 * The RSAPublicKey is used to verify signatures on signed data using the RSA algorithm.
 *
 * Author: simone
 * Creation date: 07/04/11
 */
MACHINE
    RSAPublicKey

SEES
	JShort,
	JByte

/*This class extends javacard.security.PublicKey */
EXTENDS
	PublicKey

OPERATIONS
	setModulus(buffer, offset, length)= 
	/* throws: CryptoException */
	PRE
		/* buffer - the input buffer */
		buffer : seq(JBYTE) &
		
		/* offset - the offset into the input buffer at which the modulus value begins */
		offset : JSHORT	&
		offset >= 0 &
		
		/* length - the byte length of the modulus */
		length : JSHORT &
		length >= 0

		/* CryptoException if the input modulus data length is inconsistent with the 
		implementation or if input data decryption is required and fails */
		
	THEN
		skip
	END;

/*------------------------------------------------------------------------------------------*/
	setExponent(buffer, offset, length)= 
	/* throws: CryptoException */
	PRE
		/* buffer - the input buffer */
		buffer : seq(JBYTE) &
		
		/* offset - the offset into the input buffer at which the exponent value begins */
		offset : JSHORT	&
		offset >= 0 &
		
		/* length - the byte length of the exponent */
		length : JSHORT &
		length >= 0

		/* CryptoException if the input exponent data length is inconsistent with the 
		implementation or if input data decryption is required and fails or if the 
		implementation does not support the specified exponent length */
		
	THEN
		skip
	END;

/*------------------------------------------------------------------------------------------*/
	modulus <-- getModulus(buffer, offset)=
	PRE
		/* buffer - the output buffer */
		buffer : seq(JBYTE) &
		
		/* offset - the offset into the input buffer at which the modulus value starts */
		offset : JSHORT	&
		offset >= 0	

		/* CryptoException if the modulus value of the key has not been successfully 
		initialized since the time the initialized state of the key was set to false. */
		
	THEN
		ANY rsapublickey_modulus
		WHERE ((rsapublickey_modulus : JSHORT) &
		(rsapublickey_modulus >= 0))
		THEN modulus := rsapublickey_modulus
		END
	END;
	
/*------------------------------------------------------------------------------------------*/
	exponent <-- getExponent(buffer, offset)=
	PRE
		/* buffer - the output buffer */
		buffer : seq(JBYTE) &
		
		/* offset - the offset into the output buffer at which the exponent value begins */
		offset : JSHORT	&
		offset >= 0	

		/* CryptoException if the public exponent value of the key has not been successfully 
		initialized since the time the initialized state of the key was set to false. */
		
	THEN
		ANY rsapublickey_exponent
		WHERE ((rsapublickey_exponent : JSHORT) &
		(rsapublickey_exponent >= 0))
		THEN exponent := rsapublickey_exponent
		END
	END

END
