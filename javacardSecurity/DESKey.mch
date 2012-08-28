/* DESKey
 *
 * DESKey contains an 8/16/24-byte key for single/2 key triple DES/3 key triple DES operations.
 *
 * Author: simone
 * Creation date: 17/03/11
 *
 * Extraído da LibBSmart
 *
 */
MACHINE 
	DESKey

/*This class extends javacard.security.SecretKey */
EXTENDS
	SecretKey

SEES
	JShort,
	JByte
	
OPERATIONS
	setKey(keyData, kOff)= 
	/* throws: CryptoException,
		NullPointerException,
		ArrayIndexOutOfBoundsException */
	PRE
		/* keyData - byte array containing key initialization data */
		/* NullPointerException if 'keyData' was null */
		keyData : seq1(JBYTE) & 
		/* ArrayIndexOutOfBoundsException if the the array is too short.
		the size is8 bytes for DES, 16 bytes for 2-key triple DES and 
		24 bytes for 3-key triple DES */
		(size(keyData) = 8 or 
		size(keyData) = 16 or
		size(keyData) = 24 ) & 
		
		/* kOff - offset within keyData to start */
		/*ArrayIndexOutOfBoundsException if 'kOff' is negative */
		kOff : JSHORT &
		kOff >= 0 
		
		/* CryptoException.ILLEGAL_VALUE if input data decryption is required and fails. */
		
	THEN
		skip
	END;

/*------------------------------------------------------------------------------------------*/	
	valueKey <-- getKey(keyData, kOff) =
	PRE
		/* keyData - byte array to return key data */
		keyData : seq(JBYTE) &
		
		/* kOff - offset within keyData to start */
		kOff : JSHORT &
		kOff >= 0

		/* CryptoException.UNINITIALIZED_KEY if the key data has not been successfully initialized since 
		the time the initialized state of the key was set to false. */				
		
	THEN
		/* Returns the Key data in plain text. The length of output key data is 8 bytes for DES, 
		16 bytes for 2-key triple DES and 24 bytes for 3-key triple DES. */
		ANY deskey_valueKey 
		WHERE (deskey_valueKey : JBYTE)
		THEN valueKey := deskey_valueKey
		END
	END
END
