/* DSAPublicKey
 *
 * The DSAPublicKey interface is used to verify signatures on signed data using the DSA algorithm.
 *
 * Author: simone
 * Creation date: 07/04/11
 */
MACHINE
    DSAPublicKey

/*This class extends javacard.security.PublicKey and javacard.security.DSAKey */
EXTENDS
	DSAKey
	
SEES
	JShort,
	JByte


OPERATIONS
	setY(buffer, offset, length)= 
	/* throws: CryptoException */
	PRE
		/* buffer - the input buffer */
		buffer : seq(JBYTE) &
		
		/* offset - the offset into the input buffer at which the key value begins */
		offset : JSHORT	&
		offset >= 0 &
		
		/* length - the length of the key value */
		length : JSHORT &
		length >= 0 
		
		/* CryptoException.ILLEGAL_VALUE if the input key data length is inconsistent 
		with the implementation or if input data decryption is required and fails. */
		
	THEN
		skip
	END;

/*------------------------------------------------------------------------------------------*/
	valueY <-- getY(buffer, offset)=
	PRE
		/* buffer - the output buffer */
		buffer : seq(JBYTE) &
		
		/* offset - the offset into the input buffer at which the key value starts */
		offset : JSHORT	&
		offset >= 0

		/* CryptoException.UNINITIALIZED_KEY if the value of the key has not been successfully 
		initialized since the time the initialized state of the key was set to false. */
		
	THEN
		ANY dsapublickey_valueY 
		WHERE (dsapublickey_valueY : JSHORT)
		THEN valueY := dsapublickey_valueY
		END
	END
END
