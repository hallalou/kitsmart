/* ECPrivateKey
 *
 * The ECPrivateKey interface is used to generate signatures on data using the ECDSA 
 * (Elliptic Curve Digital Signature Algorithm) and to generate shared secrets using 
 * the ECDH (Elliptic Curve Diffie-Hellman) algorithm. 
 *
 * Author: simone
 * Creation date: 07/04/11
 */
MACHINE
    ECPrivateKey

SEES
	JShort,
	JByte

/*This class extends javacard.security.PrivateKey and javacard.security.ECKey */
EXTENDS
	ECKey

OPERATIONS
	setS(buffer, offset, length)= 
	/* throws: CryptoException */
	PRE
		/* buffer - the input buffer */
		buffer : seq(JBYTE) &
		
		/* offset - the offset into the input buffer at which the secret value is to begin */
		offset : JSHORT	&
		offset >= 0 &
		
		/* length - the byte length of the secret value */
		length : JSHORT &
		length >= 0

		/* CryptoException if the input key data is inconsistent with the key length or if 
		input data decryption is required and fails */
		
	THEN
		skip
	END;

/*------------------------------------------------------------------------------------------*/
	valueS <-- getS(buffer, offset)= 
	/* throws: CryptoException */
	PRE
		/* buffer - the output buffer */
		buffer : seq(JBYTE) &
		
		/* offset - the offset into the input buffer at which the secret value is to begin */
		offset : JSHORT	&
		offset >= 0

		/* CryptoException if the value of the secret key has not been successfully initialized 
		since the time the initialized state of the key was set to false. */
		
	THEN
		ANY ecprivatekey_valueS
		WHERE (ecprivatekey_valueS : JSHORT)
		THEN valueS := ecprivatekey_valueS
		END
	END

END
