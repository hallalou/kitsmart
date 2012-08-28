/* AESKey
 *
 * AESKey contains a 16/24/32 byte key for AES computations based on the Rijndael algorithm.
 *
 * Author: simone
 * Creation date: 07/04/11
 */
MACHINE
    AESKey

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
		/* ArrayIndexOutOfBoundsException if the the 'keyData' array is too short.
		the size is 16/24/32 */
		(size(keyData) = 16 or 
		size(keyData) = 24 or
		size(keyData) = 32 ) &
		
		/* kOff - offset within keyData to start */
		/* ArrayIndexOutOfBoundsException if 'kOff' is negative */
		kOff : JSHORT &
		kOff >= 0 
			
	THEN
		skip
	END;

/*------------------------------------------------------------------------------------------*/	
	valueKey <-- getKey(keyData, kOff) =
	/* throws: CryptoException */
	PRE
		/* keyData - byte array to return key data */
		keyData : seq(JBYTE) &
		
		/* kOff - offset within keyData to start */
		kOff : JSHORT &
		kOff >= 0
		
		/* CryptoException if the key data has not been successfully initialized */	
	THEN
		/* Returns the Key data in plain text. 
		The length of output key data is 16/24/32 bytes.  */
		ANY aeskey_valueKey 
		WHERE (aeskey_valueKey : JBYTE)
		THEN valueKey := aeskey_valueKey
		END
	END
END
