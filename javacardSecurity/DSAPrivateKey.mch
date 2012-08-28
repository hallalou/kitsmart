/* DSAPrivateKey
 *
 * The DSAPrivateKey interface is used to sign data using the DSA algorithm.
 *
 * Author: simone
 * Creation date: 07/04/11
 */
MACHINE
    DSAPrivateKey

/*This class extends javacard.security.PrivateKey and javacard.security.DSAKey */
EXTENDS
	DSAKey

SEES
	JShort,
	JByte

OPERATIONS
	setX(buffer, offset, length)= 
	/* throws: CryptoException */
	PRE
		/* buffer - the input buffer */
		buffer : seq(JBYTE) &
		
		/* offset - the offset into the input buffer at which the modulus value begins */
		offset : JSHORT	&
		offset >= 0 &
		
		/* length - the length of the modulus */
		length : JSHORT &
		length > 0 
		
		/* CryptoException.ILLEGAL_VALUE if the input key data length is inconsistent 
		with the implementation or if input data decryption is required and fails. */
		
	THEN
		skip
	END;

/*------------------------------------------------------------------------------------------*/
	valueX <-- getX(buffer, offset)=
	PRE
		/* buffer - the output buffer */
		buffer : seq(JBYTE) &
		
		/* offset - the offset into the output buffer at which the key value starts */
		offset : JSHORT	&
		offset >= 0

		/* CryptoException.UNINITIALIZED_KEY if the value of the key has not been successfully 
		initialized since the time the initialized state of the key was set to false. */
		
	THEN
		ANY dsaprivatekey_valueX 
		WHERE (dsaprivatekey_valueX : JSHORT)
		THEN valueX := dsaprivatekey_valueX
		END
	END
END
