/* HMACKey
 *
 * HMACKey contains a key for HMAC operations. 
 *
 * Author: simone
 * Creation date: 30/05/11
 */
MACHINE
    HMACKey

SEES
	JShort,
	JByte

/*This class extends javacard.security.SecretKey */
EXTENDS
	SecretKey

OPERATIONS
	setKey(keyData, kOff, KLen)= 
	/* throws: CryptoException,
		NullPointerException,
		ArrayIndexOutOfBoundsException */
	PRE
		/* keyData - byte array containing key initialization data */
		/* NullPointerException if the 'keyData' is null */
		keyData : seq1(JBYTE) & 
		
		/* kOff - offset within keyData to start */
		/* ArrayIndexOutOfBoundsException if 'kOff' is negative or the keyData array is too short */
		kOff : JSHORT	&
		kOff >= 0 & 
		
		/* kLen - the byte length of the key initialization data */
		KLen : JSHORT &
		KLen >= 0

		/* CryptoException if input data decryption is required and fails */
	THEN
		skip
	END;

/*------------------------------------------------------------------------------------------*/
	valueKey <-- getKey(keyData, kOff)= 
	/* throws: CryptoException */
	PRE
		/* keyData - byte array to return key data */
		/* The key can be any length, but should be longer than the byte length of the 
		hash algorithm output used */
		keyData : seq(JBYTE) &
		
		/* kOff - offset within keyData to start */
		kOff : JSHORT &
		kOff >= 0

		/* CryptoExceptionif the key data has not been successfully initialized since the 
		time the initialized state of the key was set to false. */
		
	THEN
		ANY hmackey_valueKey
		WHERE (hmackey_valueKey : JBYTE)
		THEN valueKey := hmackey_valueKey
		END
	END
END
