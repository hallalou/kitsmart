/* KoreanSEEDKey
 *
 * KoreanSEEDKey contains an 16-byte key for Korean Seed Algorithm operations.
 *
 * Author: simone
 * Creation date: 31/05/11
 */
MACHINE
    KoreanSEEDKey

SEES
	JShort,
	JByte

/*This class extends javacard.security.SecretKey */
EXTENDS
	SecretKey

OPERATIONS
	setKey(keyData, kOff)= 
	/* throws: CryptoException,
		NullPointerException,
		ArrayIndexOutOfBoundsException */
	PRE
		/* keyData - byte array containing key initialization data */
		/* NullPointerException if 'keyData' was null */
		keyData : seq1(JBYTE) & 
		
		/* kOff - offset within keyData to start */
		/*ArrayIndexOutOfBoundsException if 'kOff' is negative or the array is too short*/
		kOff : JSHORT &
		kOff >= 0 

		/* CryptoException if input data decryption is required and fails */
		
	THEN
		skip
	END;

/*------------------------------------------------------------------------------------------*/
	valueKey <-- getKey(keyData, kOff)= 
	/* throws: CryptoException */
	PRE
		/* keyData - byte array to return key data */
		/*The key can be any length, but should be longer than the byte length of the 
		hash algorithm output used */
		keyData : seq(JBYTE) &
		
		/* kOff - offset within keyData to start */
		kOff : JSHORT &
		kOff >= 0
		
		/* CryptoException if the key data has not been successfully initialized since the time 
		the initialized state of the key was set to false. */
		
	THEN
		/* The length of output key data is 16 bytes for Korean Seed Algorithm. */
		ANY koreanseedkey_valueKey
		WHERE (koreanseedkey_valueKey : JBYTE)
		THEN valueKey := koreanseedkey_valueKey
		END
	END
END
