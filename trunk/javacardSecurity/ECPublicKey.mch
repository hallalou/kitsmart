/* ECPublicKey
 *
 * The ECPublicKey interface is used to verify signatures on signed data using the ECDSA 
 * algorithm and to generate shared secrets using the ECDH algorithm.
 *
 * Author: simone
 * Creation date: 07/04/11
 */
MACHINE
    ECPublicKey

SEES
	JShort,
	JByte

/*This class extends javacard.security.PublicKey and javacard.security.ECKey */
EXTENDS
	ECKey

OPERATIONS
	setW(buffer, offset, length)= 
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
	valueW <-- getW(buffer, offset)= 
	/* throws: CryptoException */
	PRE
		/* buffer - the output buffer */
		buffer : seq(JBYTE) &
		
		/* offset - the offset into the output buffer at which the point specification data is to begin */
		offset : JSHORT	&
		offset >= 0
		
		/* cryptoException if the point of the curve comprising the public key has not been 
		successfully initialized since the time the initialized state of the key was set to false. */
		
	THEN
		ANY ecpublickey_valueW
		WHERE (ecpublickey_valueW : JSHORT)
		THEN valueW := ecpublickey_valueW
		END
	END
END
