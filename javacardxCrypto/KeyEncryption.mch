/* KeyEncryption
 * Author: simone
 * Creation date: 12/04/11
 *
 * KeyEncryption interface defines the methods used to enable encrypted key data 
 * access to a key implementation.
 */
MACHINE
    KeyEncryption

SEES
	javacardxCryptoClasses

OPERATIONS
	setKeyCipher(keyCipher) =
	PRE
		/* keyCipher - the decryption Cipher object to decrypt the input key data. 
		The null parameter indicates that no decryption is required. */
		keyCipher : CIPHER
	THEN
		skip
	END;

/*--------------------------------------------------------------------------------*/
	cipher <-- getKeyCipher =
	
		/* Returns: keyCipher, the decryption Cipher object to decrypt the input key 
		data. The null return indicates that no decryption is performed. */
		cipher :: CIPHER
	
END
