/* KeyPair
 * Author: simone
 * Creation date: 23/03/11
 */
MACHINE
    KeyPair

SEES
	javacardSecurityClasses,
	JByte,
	JShort,
	KeyBuilder

CONSTANTS
	ALG_RSA,
	ALG_RSA_CRT,
	ALG_DSA,
	ALG_EC_F2M,
	ALG_EC_FP

PROPERTIES
	ALG_RSA : JBYTE &
	ALG_RSA = 1 &
	
	ALG_RSA_CRT : JBYTE &
	ALG_RSA_CRT = 2 &
	
	ALG_DSA : JBYTE &
	ALG_DSA = 3 &
	
	ALG_EC_F2M : JBYTE & 
	ALG_EC_F2M = 4 &
	
	ALG_EC_FP : JBYTE &
	ALG_EC_FP = 5
 

OPERATIONS
	C1_KeyPair(algorithm, keyLength) = 
	/* throws CryptoException */
	PRE
		/* algorithm - the type of algorithm whose key pair needs to be generated. 
		Valid codes listed in ALG_* constants */
		algorithm : JBYTE &
		(algorithm = ALG_RSA or
 		algorithm = ALG_RSA_CRT or
 		algorithm = ALG_DSA or
 		algorithm = ALG_EC_F2M or
 		algorithm = ALG_EC_FP) &
		
		/* keyLength - the key size in bits. The valid key bit lengths are key type dependent. */
		keyLength : JSHORT &
		(keyLength = LENGTH_AES_128 or
 		keyLength = LENGTH_AES_192 or
 		keyLength = LENGTH_AES_256 or
 		keyLength = LENGTH_DES or
 		keyLength = LENGTH_DES3_2KEY or
 		keyLength = LENGTH_DES3_3KEY or
 		keyLength = LENGTH_DSA_1024 or
 		keyLength = LENGTH_DSA_512 or
 		keyLength = LENGTH_DSA_768 or
 		keyLength = LENGTH_EC_F2M_113 or
 		keyLength = LENGTH_EC_F2M_131 or
 		keyLength = LENGTH_EC_F2M_163 or
 		keyLength = LENGTH_EC_F2M_193 or
 		keyLength = LENGTH_EC_FP_112 or
 		keyLength = LENGTH_EC_FP_128 or
 		keyLength = LENGTH_EC_FP_160 or
 		keyLength = LENGTH_EC_FP_192 or
 		keyLength = LENGTH_RSA_1024 or
 		keyLength = LENGTH_RSA_1280 or
 		keyLength = LENGTH_RSA_1536 or
 		keyLength = LENGTH_RSA_1984 or
 		keyLength = LENGTH_RSA_2048 or
 		keyLength = LENGTH_RSA_512 or
 		keyLength = LENGTH_RSA_736 or
 		keyLength = LENGTH_RSA_768 or
 		keyLength = LENGTH_RSA_896)

		/* CryptoException.NO_SUCH_ALGORITHM if the requested algorithm associated with the 
		specified type, size of key is not supported. */
		
	THEN
		skip
	END;
		
/*------------------------------------------------------------------------------------------*/
	C2_KeyPair(publicKey, privateKey) = 
	/* throws CryptoException */
	PRE
		/* publicKey - the public key. */
		publicKey : PUBLIC_KEY &
		/* privateKey - the private key. */
		privateKey : PRIVATE_KEY

		/* CryptoException.ILLEGAL_VALUE if the input parameter key objects are mismatched - 
		different algorithms or different key sizes. Parameter values are not checked. */
		/* CryptoException.NO_SUCH_ALGORITHM if the algorithm associated with the specified 
		type, size of key is not supported. */
		
	THEN
		skip
	END;

/*------------------------------------------------------------------------------------------*/
	genKeyPair = 
	/* throws CryptoException */
		
		/* CryptoException.ILLEGAL_VALUE if the pre-initialized exponent value parameter in the 
		RSA public key or the pre-initialized p, q, g parameter set in the DSA public key or the 
		pre-initialized Field, A, B, G and R parameter set in public EC key is invalid. */
		
		skip;

/*------------------------------------------------------------------------------------------*/		
	result <-- getPublic = 
		
		/* Returns a reference to the public key.*/
		ANY keypair_result
		WHERE (keypair_result : PUBLIC_KEY)
		THEN result := keypair_result
		END;

/*------------------------------------------------------------------------------------------*/
	result <-- getPrivate = 
		
		/* Returns a reference to the private key.*/
		ANY keypair_result 
		WHERE (keypair_result : PRIVATE_KEY)
		THEN result := keypair_result
		END
END
