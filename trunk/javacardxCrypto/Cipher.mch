/* Cipher
 * Author: simone
 * Creation date: 12/04/11
 *
 * The Cipher class is the abstract base class for Cipher algorithms
 */
MACHINE
    Cipher

SEES
	javacardxCryptoClasses,
	javacardSecurityClasses,
	JByte,
	JShort

/*This class extends java.lang.Object */
EXTENDS
	Object

CONCRETE_CONSTANTS
	ALG_DES_CBC_NOPAD,
	ALG_DES_CBC_ISO9797_M1,
	ALG_DES_CBC_ISO9797_M2,
	ALG_DES_CBC_PKCS5,
	ALG_DES_ECB_NOPAD,
	ALG_DES_ECB_ISO9797_M1,
	ALG_DES_ECB_ISO9797_M2,
	ALG_DES_ECB_PKCS5,
	ALG_RSA_ISO14888,
	ALG_RSA_PKCS1,
	ALG_RSA_ISO9796,
	ALG_RSA_NOPAD,
	ALG_AES_BLOCK_128_CBC_NOPAD,
	ALG_AES_BLOCK_128_ECB_NOPAD,
	ALG_RSA_PKCS1_OAEP,
	ALG_KOREAN_SEES_ECB_NOPAD,
	ALG_KOREAN_SEES_CBC_NOPAD,
	MODE_DECRYPT,
	MODE_ENCRYPT


PROPERTIES
	ALG_DES_CBC_NOPAD : JBYTE &
	ALG_DES_CBC_NOPAD = 1 &
	ALG_DES_CBC_ISO9797_M1 : JBYTE &
	ALG_DES_CBC_ISO9797_M1 = 2 &
	ALG_DES_CBC_ISO9797_M2 : JBYTE &
	ALG_DES_CBC_ISO9797_M2 = 3 &
	ALG_DES_CBC_PKCS5 : JBYTE &
	ALG_DES_CBC_PKCS5 = 4 &
	ALG_DES_ECB_NOPAD : JBYTE &
	ALG_DES_ECB_NOPAD = 5 &
	ALG_DES_ECB_ISO9797_M1 : JBYTE &
	ALG_DES_ECB_ISO9797_M1 = 6 &
	ALG_DES_ECB_ISO9797_M2 : JBYTE &
	ALG_DES_ECB_ISO9797_M2 = 7 &
	ALG_DES_ECB_PKCS5 : JBYTE &
	ALG_DES_ECB_PKCS5 = 8 &
	ALG_RSA_ISO14888 : JBYTE &
	ALG_RSA_ISO14888 = 9 &
	ALG_RSA_PKCS1 : JBYTE &
	ALG_RSA_PKCS1 = 10 &
	ALG_RSA_ISO9796 : JBYTE &
	ALG_RSA_ISO9796 = 11 &
	ALG_RSA_NOPAD : JBYTE &
	ALG_RSA_NOPAD = 12 &
	ALG_AES_BLOCK_128_CBC_NOPAD : JBYTE &
	ALG_AES_BLOCK_128_CBC_NOPAD = 13 &
	ALG_AES_BLOCK_128_ECB_NOPAD : JBYTE &
	ALG_AES_BLOCK_128_ECB_NOPAD = 14 &
	ALG_RSA_PKCS1_OAEP : JBYTE &
	ALG_RSA_PKCS1_OAEP = 15 &
	ALG_KOREAN_SEES_ECB_NOPAD : JBYTE &
	ALG_KOREAN_SEES_ECB_NOPAD = 16 &
	ALG_KOREAN_SEES_CBC_NOPAD : JBYTE &
	ALG_KOREAN_SEES_CBC_NOPAD = 17 &
	MODE_DECRYPT : JBYTE &
	MODE_DECRYPT = 1 &
	MODE_ENCRYPT : JBYTE &
	MODE_ENCRYPT = 2

OPERATIONS
	result <-- getInstance(algorithm, externalAccess) = 
	/* throws: CryptoException
		*/
	PRE
		/* algorithm - the desired Cipher algorithm. 
		Valid codes listed in ALG_* constants */
		algorithm : JBYTE &
		(algorithm = ALG_DES_CBC_NOPAD or
		algorithm = ALG_DES_CBC_ISO9797_M1 or
		algorithm = ALG_DES_CBC_ISO9797_M2 or
		algorithm = ALG_DES_CBC_PKCS5 or
		algorithm = ALG_DES_ECB_NOPAD or
		algorithm = ALG_DES_ECB_ISO9797_M1 or
		algorithm = ALG_DES_ECB_ISO9797_M2 or
		algorithm = ALG_DES_ECB_PKCS5 or
		algorithm = ALG_RSA_ISO14888 or
		algorithm = ALG_RSA_PKCS1 or
		algorithm = ALG_RSA_ISO9796 or
		algorithm = ALG_RSA_NOPAD or
		algorithm = ALG_AES_BLOCK_128_CBC_NOPAD or
		algorithm = ALG_AES_BLOCK_128_ECB_NOPAD or
		algorithm = ALG_RSA_PKCS1_OAEP or
		algorithm = ALG_KOREAN_SEES_ECB_NOPAD or
		algorithm = ALG_KOREAN_SEES_CBC_NOPAD) &
		
		/* externalAccess - true indicates that the instance will be shared among 
		multiple applet instances */
		externalAccess : BOOL
		
		/* CryptoException.NO_SUCH_ALGORITHM if the requested algorithm is not 
		supported or shared access mode is not supported. */
		
	THEN
		/* Returns: the Cipher object instance of the requested algorithm */
		ANY anyResult
		WHERE ((anyResult : JBYTE) & 
			(anyResult = ALG_DES_CBC_NOPAD or
			anyResult = ALG_DES_CBC_ISO9797_M1 or
			anyResult = ALG_DES_CBC_ISO9797_M2 or
			anyResult = ALG_DES_CBC_PKCS5 or
			anyResult = ALG_DES_ECB_NOPAD or
			anyResult = ALG_DES_ECB_ISO9797_M1 or
			anyResult = ALG_DES_ECB_ISO9797_M2 or
			anyResult = ALG_DES_ECB_PKCS5 or
			anyResult = ALG_RSA_ISO14888 or
			anyResult = ALG_RSA_PKCS1 or
			anyResult = ALG_RSA_ISO9796 or
			anyResult = ALG_RSA_NOPAD or
			anyResult = ALG_AES_BLOCK_128_CBC_NOPAD or
			anyResult = ALG_AES_BLOCK_128_ECB_NOPAD or
			anyResult = ALG_RSA_PKCS1_OAEP or
			anyResult = ALG_KOREAN_SEES_ECB_NOPAD or
			anyResult = ALG_KOREAN_SEES_CBC_NOPAD))
		THEN result := anyResult
		END			
	END;

/*--------------------------------------------------------------------------------*/
	init_1(theKey, theMode) = 
	/* throws: CryptoException
		*/
	PRE
		/* theKey - the key object to use for encrypting or decrypting */
		theKey : KEY &
		
		/* theMode - one of MODE_DECRYPT or MODE_ENCRYPT */
		theMode : JBYTE &
		(theMode = MODE_DECRYPT or
		theMode = MODE_ENCRYPT)

		/* CryptoException.ILLEGAL_VALUE if theMode option is an undefined value 
		or if the Key is inconsistent with the Cipher implementation. */
		/* CryptoException.UNINITIALIZED_KEY if theKey instance is uninitialized. */
	THEN
		skip
	END;

/*--------------------------------------------------------------------------------*/
	init_2(theKey, theMode, bArray, bOff, bLen) = 
	/* throws: CryptoException
		*/
	PRE
		/* theKey - the key object to use for encrypting or decrypting. */
		theKey : KEY &
		
		/* theMode - one of MODE_DECRYPT or MODE_ENCRYPT */
		theMode : JBYTE &
		(theMode = MODE_DECRYPT or
		theMode = MODE_ENCRYPT) &
		
		/* bArray - byte array containing algorithm specific initialization info */
		bArray : seq(JBYTE) &
		
		/* bOff - offset within bArray where the algorithm specific data begins */
		bOff : JSHORT &
		bOff >= 0 &
		
		/* bLen - byte length of algorithm specific parameter data */
		bLen : JSHORT &
		bLen >= 0

		/* CryptoException.ILLEGAL_VALUE if theMode option is an undefined value or 
		if a byte array parameter option is not supported by the algorithm or 
		if the bLen is an incorrect byte length for the algorithm specific data or 
		if the Key is inconsistent with the Cipher implementation. */
		/* CryptoException.UNINITIALIZED_KEY if theKey instance is uninitialized. */
	THEN
		skip
	END;

/*--------------------------------------------------------------------------------*/
	algorithm <-- getAlgorithm =
		ANY anyAlgorithm
		WHERE ((anyAlgorithm : JBYTE) & 
		(anyAlgorithm = ALG_DES_CBC_NOPAD or
		anyAlgorithm = ALG_DES_CBC_ISO9797_M1 or
		anyAlgorithm = ALG_DES_CBC_ISO9797_M2 or
		anyAlgorithm = ALG_DES_CBC_PKCS5 or
		anyAlgorithm = ALG_DES_ECB_NOPAD or
		anyAlgorithm = ALG_DES_ECB_ISO9797_M1 or
		anyAlgorithm = ALG_DES_ECB_ISO9797_M2 or
		anyAlgorithm = ALG_DES_ECB_PKCS5 or
		anyAlgorithm = ALG_RSA_ISO14888 or
		anyAlgorithm = ALG_RSA_PKCS1 or
		anyAlgorithm = ALG_RSA_ISO9796 or
		anyAlgorithm = ALG_RSA_NOPAD or
		anyAlgorithm = ALG_AES_BLOCK_128_CBC_NOPAD or
		anyAlgorithm = ALG_AES_BLOCK_128_ECB_NOPAD or
		anyAlgorithm = ALG_RSA_PKCS1_OAEP or
		anyAlgorithm = ALG_KOREAN_SEES_ECB_NOPAD or
		anyAlgorithm = ALG_KOREAN_SEES_CBC_NOPAD))
		THEN algorithm := anyAlgorithm
	END;
	
/*--------------------------------------------------------------------------------*/
	numbytes <-- doFinal(inBuff, inOffset, inLength, outBuff, outOffset) = 
	/* throws: CryptoException
		*/
	PRE
		/* inBuff - the input buffer of data to be encrypted/decrypted */
		inBuff : seq(JBYTE) &
		
		/* inOffset - the offset into the input buffer at which to begin 
		encryption/decryption */
		inOffset : JSHORT &
		inOffset >= 0 &
		
		/* inLength - the byte length to be encrypted/decrypted */
		inLength : JSHORT &
		inLength >= 0 &
		
		/* outBuff - the output buffer, may be the same as the input buffer */
		outBuff : seq(JBYTE) &
		
		/* outOffset - the offset into the output buffer where the resulting 
		output data begins */
		outOffset : JSHORT &
		outOffset >= 0
		
		/* CryptoException.UNINITIALIZED_KEY if key not initialized. */
		/* CryptoException.INVALID_INIT if this Cipher object is not initialized. */
		/* CryptoException.ILLEGAL_USE if: This Cipher algorithm does not pad the 
		message and the message is not block aligned; This Cipher algorithm does 
		not pad the message and no input data has been provided in inBuff or via 
		the update() method; The input message length is not supported;
		The decrypted data is not bounded by appropriate padding bytes. */
		
	THEN
		ANY anyNumbytes
		WHERE ((anyNumbytes : JSHORT) & (anyNumbytes > 0))
		THEN numbytes := anyNumbytes
		END	
	END;

/*--------------------------------------------------------------------------------*/
	numbytes <-- update(inBuff, inOffset, inLength, outBuff, outOffset) = 
	/* throws: CryptoException
		*/
	PRE
		/* inBuff - the input buffer of data to be encrypted/decrypted */
		inBuff : seq(JBYTE) &
		
		/* inOffset - the offset into the input buffer at which to begin 
		encryption/decryption */
		inOffset : JSHORT &
		inOffset >= 0 &
		
		/* inLength - the byte length to be encrypted/decrypted */
		inLength : JSHORT &
		inLength >= 0 &
		
		/* outBuff - the output buffer, may be the same as the input buffer */
		outBuff : seq(JBYTE) &
		
		/* outOffset - the offset into the output buffer where the resulting 
		ciphertext/plaintext begins */
		outOffset : JSHORT &
		outOffset >= 0
		
		/* CryptoException.UNINITIALIZED_KEY if key not initialized. */
		/* CryptoException.INVALID_INIT if this Cipher object is not initialized. */
		/*CryptoException.ILLEGAL_USE if the input message length is not supported.*/
	
	THEN
		ANY anyNumbytes
		WHERE ((anyNumbytes : JSHORT) & (anyNumbytes > 0))
		THEN numbytes := anyNumbytes
		END
	END

END
