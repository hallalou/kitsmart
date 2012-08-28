/* Signature
 *
 * The Signature class is the base class for Signature algorithms.
 *
 * Author: simone
 * Creation date: 11/04/11
 */
MACHINE
    Signature

SEES
	javacardSecurityClasses,
	JByte,
	JShort,
	JBoolean

CONCRETE_CONSTANTS
	ALG_DES_MAC4_NOPAD,
	ALG_DES_MAC8_NOPAD,
	ALG_DES_MAC4_ISO9797_M1,
	ALG_DES_MAC8_ISO9797_M1,
	ALG_DES_MAC4_ISO9797_M2,
	ALG_DES_MAC8_ISO9797_M2,
	ALG_DES_MAC4_PKCS5,
	ALG_DES_MAC8_PKCS5,
	ALG_RSA_SHA_ISO9796,
	ALG_RSA_SHA_PKCS1,
	ALG_RSA_MD5_PKCS1,
	ALG_RSA_RIPEMD160_ISO9796,
	ALG_RSA_RIPEMD160_PKCS1,
	ALG_DSA_SHA,
	ALG_RSA_SHA_RFC2409,
	ALG_RSA_MD5_RFC2409,
	ALG_ECDSA_SHA,
	ALG_AES_MAC_128_NOPAD,
	ALG_DES_MAC4_ISO9797_1_M2_ALG3,
	ALG_DES_MAC8_ISO9797_1_M2_ALG3,
	ALG_RSA_SHA_PKCS1_PSS,
	ALG_RSA_MD5_PKCS1_PSS,
	ALG_RSA_RIPEMD160_PKCS1_PSS,
	MODE_SIGN,
	MODE_VERIFY

PROPERTIES
	ALG_DES_MAC4_NOPAD : JBYTE &
	ALG_DES_MAC4_NOPAD = 1 &
	
	ALG_DES_MAC8_NOPAD : JBYTE &
	ALG_DES_MAC8_NOPAD = 2 &
	
	ALG_DES_MAC4_ISO9797_M1 : JBYTE &
	ALG_DES_MAC4_ISO9797_M1 = 3 &
	
	ALG_DES_MAC8_ISO9797_M1 : JBYTE &
	ALG_DES_MAC8_ISO9797_M1 = 4 &
	
	ALG_DES_MAC4_ISO9797_M2 : JBYTE &
	ALG_DES_MAC4_ISO9797_M2 = 5 &
	
	ALG_DES_MAC8_ISO9797_M2 : JBYTE &
	ALG_DES_MAC8_ISO9797_M2 = 6 &
	
	ALG_DES_MAC4_PKCS5 : JBYTE &
	ALG_DES_MAC4_PKCS5 = 7 &
	
	ALG_DES_MAC8_PKCS5 : JBYTE &
	ALG_DES_MAC8_PKCS5 = 8 &
	
	ALG_RSA_SHA_ISO9796 : JBYTE &
	ALG_RSA_SHA_ISO9796 = 9 &
	
	ALG_RSA_SHA_PKCS1 : JBYTE &
	ALG_RSA_SHA_PKCS1 = 10 &
	
	ALG_RSA_MD5_PKCS1 : JBYTE &
	ALG_RSA_MD5_PKCS1 = 11 &
	
	ALG_RSA_RIPEMD160_ISO9796 : JBYTE &
	ALG_RSA_RIPEMD160_ISO9796 = 12 &
	
	ALG_RSA_RIPEMD160_PKCS1 : JBYTE &
	ALG_RSA_RIPEMD160_PKCS1 = 13 &
	
	ALG_DSA_SHA : JBYTE &
	ALG_DSA_SHA = 14 &
	
	ALG_RSA_SHA_RFC2409 : JBYTE &
	ALG_RSA_SHA_RFC2409 = 15 &
	
	ALG_RSA_MD5_RFC2409 : JBYTE &
	ALG_RSA_MD5_RFC2409 = 16 &
	
	ALG_ECDSA_SHA : JBYTE &
	ALG_ECDSA_SHA = 17 &
	
	ALG_AES_MAC_128_NOPAD : JBYTE &
	ALG_AES_MAC_128_NOPAD = 18 &
	
	ALG_DES_MAC4_ISO9797_1_M2_ALG3 : JBYTE &
	ALG_DES_MAC4_ISO9797_1_M2_ALG3 = 19 &
	
	ALG_DES_MAC8_ISO9797_1_M2_ALG3 : JBYTE &
	ALG_DES_MAC8_ISO9797_1_M2_ALG3 = 20 &
	
	ALG_RSA_SHA_PKCS1_PSS : JBYTE &
	ALG_RSA_SHA_PKCS1_PSS = 21 &
	
	ALG_RSA_MD5_PKCS1_PSS : JBYTE &
	ALG_RSA_MD5_PKCS1_PSS = 22 &
	
	ALG_RSA_RIPEMD160_PKCS1_PSS : JBYTE &
	ALG_RSA_RIPEMD160_PKCS1_PSS = 23 &
	
	MODE_SIGN : JBYTE &
	MODE_SIGN = 1 &
	
	MODE_VERIFY : JBYTE &
	MODE_VERIFY = 2

OPERATIONS
	result <-- getInstance(algorithm, externalAccess) = 
	/* throws: CryptoException */
	PRE
		/* algorithm - the desired Signature algorithm. Valid codes listed in ALG_* constants */
		algorithm : JBYTE &
		(algorithm = ALG_DES_MAC4_NOPAD or
 		algorithm = ALG_DES_MAC8_NOPAD or
 		algorithm = ALG_DES_MAC4_ISO9797_M1 or
 		algorithm = ALG_DES_MAC8_ISO9797_M1 or
 		algorithm = ALG_DES_MAC4_ISO9797_M2 or
 		algorithm = ALG_DES_MAC8_ISO9797_M2 or
 		algorithm = ALG_DES_MAC4_PKCS5 or
 		algorithm = ALG_DES_MAC8_PKCS5 or
 		algorithm = ALG_RSA_SHA_ISO9796 or
 		algorithm = ALG_RSA_SHA_PKCS1 or
 		algorithm = ALG_RSA_MD5_PKCS1 or
		algorithm = ALG_RSA_RIPEMD160_ISO9796 or
		algorithm = ALG_RSA_RIPEMD160_PKCS1 or
		algorithm = ALG_DSA_SHA or
		algorithm = ALG_RSA_SHA_RFC2409 or
		algorithm = ALG_RSA_MD5_RFC2409 or
		algorithm = ALG_ECDSA_SHA or
		algorithm = ALG_AES_MAC_128_NOPAD or
		algorithm = ALG_DES_MAC4_ISO9797_1_M2_ALG3 or
		algorithm = ALG_DES_MAC8_ISO9797_1_M2_ALG3 or
		algorithm = ALG_RSA_SHA_PKCS1_PSS or
		algorithm = ALG_RSA_MD5_PKCS1_PSS or
		algorithm = ALG_RSA_RIPEMD160_PKCS1_PSS) & 
		
		/* externalAccess - true indicates that the instance will be shared among multiple 
		applet instances and that the Signature instance will also be accessed 
		(via a Shareable interface) when the owner of the Signature instance is not the 
		currently selected applet. If true the implementation must not allocate 
		CLEAR_ON_DESELECT transient space for internal data. */
		externalAccess : JBOOLEAN

		/* CryptoException.NO_SUCH_ALGORITHM if the requested algorithm or shared access mode 
		is not supported */
		
	THEN
		/* Returns: the Signature object instance of the requested algorithm */
		ANY signature_result
		WHERE (signature_result : SIGNATURE)
		THEN result := signature_result
		END
	END;
	
/*------------------------------------------------------------------------------------------*/
	init_1(theKey, theMode) = 
	/* throws: CryptoException */
	PRE
		/* theKey - the key object to use for signing or verifying */
		theKey : KEY &
		
		/* theMode - one of MODE_SIGN or MODE_VERIFY */
		theMode : JBYTE &
		(theMode = MODE_SIGN or
 		theMode = MODE_VERIFY)

		/*CryptoException.ILLEGAL_VALUE if theMode option is an undefined value or if the Key 
		is inconsistent with theMode or with the Signature implementation. */
		/*CryptoException.UNINITIALIZED_KEY if theKey instance is uninitialized */
		
	THEN
		skip
	END;

/*------------------------------------------------------------------------------------------*/
	init_2(theKey, theMode, bArray, bOff, bLen) = 
	/* throws: CryptoException */
	PRE
		/* theKey - the key object to use for signing */
		theKey : KEY &
		
		/* theMode - one of MODE_SIGN or MODE_VERIFY */
		theMode : JBYTE &
		(theMode = MODE_SIGN or
 		theMode = MODE_VERIFY) &
		
		/* bArray - byte array containing algorithm specific initialization information */
		bArray : seq(JBYTE) &
		
		/* bOff - offset within bArray where the algorithm specific data begins */
		bOff : JSHORT &
		bOff >= 0 &
		
		/* bLen - byte length of algorithm specific parameter data */
		bLen : JSHORT &
		bLen >= 0

		/*CryptoException.ILLEGAL_VALUE if theMode option is an undefined value or if a byte 
		array parameter option is not supported by the algorithm or if the bLen is an incorrect 
		byte length for the algorithm specific data or if the Key is inconsistent with theMode 
		or with the Signature implementation. */
		/* CryptoException.UNINITIALIZED_KEY if theKey instance is uninitialized */
	THEN
		skip
	END;
	
/*------------------------------------------------------------------------------------------*/
	algorithm <-- getAlgorithm_1 =
		ANY signature_algorithm
		WHERE (signature_algorithm : JBYTE) &
		(signature_algorithm = ALG_DES_MAC4_NOPAD or
 		signature_algorithm = ALG_DES_MAC8_NOPAD or
 		signature_algorithm = ALG_DES_MAC4_ISO9797_M1 or
 		signature_algorithm = ALG_DES_MAC8_ISO9797_M1 or
 		signature_algorithm = ALG_DES_MAC4_ISO9797_M2 or
 		signature_algorithm = ALG_DES_MAC8_ISO9797_M2 or
 		signature_algorithm = ALG_DES_MAC4_PKCS5 or
 		signature_algorithm = ALG_DES_MAC8_PKCS5 or
 		signature_algorithm = ALG_RSA_SHA_ISO9796 or
 		signature_algorithm = ALG_RSA_SHA_PKCS1 or
 		signature_algorithm = ALG_RSA_MD5_PKCS1 or
		signature_algorithm = ALG_RSA_RIPEMD160_ISO9796 or
		signature_algorithm = ALG_RSA_RIPEMD160_PKCS1 or
		signature_algorithm = ALG_DSA_SHA or
		signature_algorithm = ALG_RSA_SHA_RFC2409 or
		signature_algorithm = ALG_RSA_MD5_RFC2409 or
		signature_algorithm = ALG_ECDSA_SHA or
		signature_algorithm = ALG_AES_MAC_128_NOPAD or
		signature_algorithm = ALG_DES_MAC4_ISO9797_1_M2_ALG3 or
		signature_algorithm = ALG_DES_MAC8_ISO9797_1_M2_ALG3 or
		signature_algorithm = ALG_RSA_SHA_PKCS1_PSS or
		signature_algorithm = ALG_RSA_MD5_PKCS1_PSS or
		signature_algorithm = ALG_RSA_RIPEMD160_PKCS1_PSS)
		THEN algorithm := signature_algorithm
		END;

/*------------------------------------------------------------------------------------------*/
	length <-- getLength = 
	/* throws: CryptoException */
		
		/* CryptoException.INVALID_INIT if this Signature object is not initialized */
		/* CryptoException.UNINITIALIZED_KEY if key not initialized */
		
		ANY signature_length
		WHERE (signature_length : JBYTE) & (signature_length >= 0)
		THEN length := signature_length
		END;

/*------------------------------------------------------------------------------------------*/
	update_1(inBuff, inOffset, inLength) = 
	/* throws: CryptoException */
	PRE
		/* inBuff - the input buffer of data to be signed/verified */
		inBuff : seq(JBYTE) &
		
		/* inOffset - the offset into the input buffer where input data begins */
		inOffset : JSHORT &
		inOffset >= 0 &
		
		/* inLength - the byte length to sign/verify */
		inLength : JSHORT &
		inLength >= 0

		/* CryptoException.UNINITIALIZED_KEY if key not initialized */
		/* CryptoException.INVALID_INIT if this Signature object is not initialized */
		
	THEN
		skip
	END;

/*------------------------------------------------------------------------------------------*/
	numbytes <-- sign_1(inBuff, inOffset, inLength, sigBuff, sigOffset) = 
	/* throws: CryptoException */
	PRE
		/* inBuff - the input buffer of data to be signed */
		inBuff : seq(JBYTE) &
		
		/* inOffset - the offset into the input buffer at which to begin signature generation */
		inOffset : JSHORT &
		inOffset >= 0 &
		
		/* inLength - the byte length to sign */
		inLength : JSHORT &
		inLength >= 0 &
		
		/* sigBuff - the output buffer to store signature data */
		sigBuff : seq(JBYTE) &
		
		/* sigOffset - the offset into sigBuff at which to begin signature data */
		sigOffset : JSHORT &
		sigOffset >= 0

		/* CryptoException.UNINITIALIZED_KEY if key not initialized */
		/* CryptoException.INVALID_INIT if this Signature object is not initialized or initialized 
		for signature verify mode */
		/*CryptoException.ILLEGAL_USE:
			- if this Signature algorithm does not pad the message and the message is not block 
			aligned.
			- if this Signature algorithm does not pad the message and no input data has been 
			provided in inBuff or via the update() method.
			- if this Signature algorithm includes message recovery functionality.*/
	THEN
		ANY signature_numbytes
		WHERE (signature_numbytes : JSHORT) &
		(signature_numbytes >= 0)
		THEN numbytes := signature_numbytes
		END
	END;

/*------------------------------------------------------------------------------------------*/
	result <-- verify_1(inBuff, inOffset, inLength, sigBuff, sigOffset, sigLength) = 
	/* throws: CryptoException */
	PRE
		/* inBuff - the input buffer of data to be verified */
		inBuff : seq(JBYTE) &
		
		/* inOffset - the offset into the input buffer at which to begin signature generation */
		inOffset : JSHORT &
		inOffset >= 0 &
		
		/* inLength - the byte length to sign */
		inLength : JSHORT &
		inLength >= 0 &
		
		/* sigBuff - the input buffer containing signature data */
		sigBuff : seq(JBYTE) &
		
		/* sigOffset - the offset into sigBuff where signature data begins */
		sigOffset : JSHORT &
		sigOffset >= 0 &
		
		/* sigLength - the byte length of the signature data */
		sigLength : JSHORT &
		sigLength >= 0

		/* CryptoException.UNINITIALIZED_KEY if key not initialized */
		/* CryptoException.INVALID_INIT if this Signature object is not initialized or initialized for signature sign mode*/
		/* CryptoException.ILLEGAL_USE:
			- if this Signature algorithm does not pad the message and the message is not block 
			aligned.
			- if this Signature algorithm does not pad the message and no input data has been 
			provided in inBuff or via the update() method.
			- if this Signature algorithm includes message recovery functionality */
			
	THEN
		CHOICE
			result := TRUE
		OR
			result := FALSE
		END
	END
END
