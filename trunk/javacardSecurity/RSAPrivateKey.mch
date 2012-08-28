/* RSAPrivateKey
 * 
 * The RSAPrivateKey class is used to sign data using the RSA algorithm in its 
 * modulus/exponent form.
 *
 * Author: simone
 * Creation date: 07/04/11
 */
MACHINE
    RSAPrivateKey

SEES
	JShort,
	JByte

/*This class extends javacard.security.PrivateKey */
EXTENDS
	PrivateKey

OPERATIONS
	setModulus(buffer, offset, length)= 
	/* throws: CryptoException */
	PRE
		/* buffer - the input buffer */
		buffer : seq(JBYTE) &
		
		/* offset - the offset into the input buffer at which the modulus value begins */
		offset : JSHORT	&
		offset >= 0 &
		
		/* length - the length of the modulus */
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
		
		/* length - the length of the exponent */
		length : JSHORT &
		length >= 0

		/* CryptoException if the input exponent data length is inconsistent with the 
		implementation or if input data decryption is required and fails */
		
	THEN
		skip
	END;

/*------------------------------------------------------------------------------------------*/
	modulus <-- getModulus(buffer, offset)=
	PRE
		/* buffer - the output buffer */
		buffer : seq(JBYTE) &
		
		/* offset - the offset into the output buffer at which the modulus value starts */
		offset : JSHORT	&
		offset >= 0	

		/* CryptoException if the modulus value of the key has not been successfully initialized
		since the time the initialized state of the key was set to false. */
		
	THEN
		ANY rsaprivatekey_modulus
		WHERE ((rsaprivatekey_modulus : JSHORT) &
		(rsaprivatekey_modulus >= 0))
		THEN modulus := rsaprivatekey_modulus
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

		/* CryptoException if the private exponent value of the key has not been successfully 
		initialized since the time the initialized state of the key was set to false. */
		
	THEN
		ANY rsaprivatekey_exponent
		WHERE ((rsaprivatekey_exponent : JSHORT) &
		(rsaprivatekey_exponent >= 0))
		THEN exponent := rsaprivatekey_exponent
		END
	END
END
