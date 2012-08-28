/* SignatureMessageRecovery
 *
 * A subclass of the abstract Signature class must implement this SignatureMessageRecovery 
 * interface to provide message recovery functionality.
 *
 * Author: simone
 * Creation date: 31/05/11
 */
MACHINE
    SignatureMessageRecovery

SEES
	javacardSecurityClasses,
	JShort,
	JByte,
	Signature

OPERATIONS
	/* the machine 'Signature' has also declare a method target 'init_1' and 'init_2' */
	init_3(theKey, theMode) = 
	/* throws: CryptoException */
	PRE
		/* theKey - the key object to use for signing or verifying */
		theKey : KEY & 
		
		/* theMode - one of MODE_SIGN or MODE_VERIFY */
		/* CryptoException if theMode option is an undefined value or 
		if the Key is inconsistent with theMode or with the Signature implementation*/
		theMode : JBYTE &
		(theMode = MODE_SIGN or 
		theMode = MODE_VERIFY) 

		/* CryptoException if theKey instance is uninitialized */
		
	THEN
		skip
	END;

/*------------------------------------------------------------------------------------------*/
 	value <-- beginVerify(sigAndRecDataBuff, buffOffset, sigLength) = 
	/* throws: CryptoException */
	PRE
		/* sigAndRecDataBuff - contains the signature data as input and 
		also contains the recoverable part of the message as output. */
		sigAndRecDataBuff : seq(JBYTE) &
		
		/* buffOffset - offset into the sigAndRecDataBuff array where data begins for 
		signature and where this method will start writing recovered message data. */
		buffOffset : JSHORT &
		buffOffset >= 0 &
		
		/* sigLength - the length of signature data */
		sigLength : JSHORT &
		sigLength >= 0
		
		/* CryptoException.ILLEGAL_USE for the following conditions:
			- if this object is initialized for signature sign mode
			- if sigLength is inconsistent with this Signature algorithm
			- if the decrypted message representative does not meet the algorithm specifications
			- if the bit length of the decrypted message representative is not a multiple of 8. */
		/* CryptoException.UNINITIALIZED_KEY if key not initialized. */ 
		/* CryptoException.INVALID_INIT if this Signature object is not initialized. */
		
	THEN
		ANY signaturemessagerecovery_value
		WHERE ((signaturemessagerecovery_value : JSHORT) &
		(signaturemessagerecovery_value >= 0))
		THEN value := signaturemessagerecovery_value
		END
	END;

/*------------------------------------------------------------------------------------------*/
	/* the machine 'Signature' has also declare a method target 'sign_1'*/
	value <-- sign_2(inBuff, inOffset, inLength, sigBuff, sigOffset, recMsgLen, recMsgLenOffset) = 
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
		sigOffset >= 0 &
		
		/* recMsgLen - the output buffer containing the number of bytes of the recoverable 
		message beginning with the first byte of the message that was encoded into the 
		signature itself */
		recMsgLen : seq(JSHORT) &
		
		/* recMsgLenOffset - offset into the recMsgLen output buffer where the byte length 
		of the recoverable message is stored. Note that a single short value is stored at 
		recMsgLenOffset offset. */
		recMsgLenOffset : JSHORT &
		recMsgLenOffset >= 0

		/* CryptoException.UNINITIALIZED_KEY if key not initialized. */
		/* CryptoException.INVALID_INIT if this Signature object is not initialized or 
		initialized for signature verify mode. */
		
	THEN
		ANY signaturemessagerecovery_value
		WHERE ((signaturemessagerecovery_value : JSHORT) &
		(signaturemessagerecovery_value >= 0))
		THEN value := signaturemessagerecovery_value
		END		
	END;

/*------------------------------------------------------------------------------------------*/
	/*the machine 'Signature' has also declare a method target 'verify_1'*/
	result <-- verify_2(inBuff, inOffset, inLength) = 
	/* throws: CryptoException */
	PRE
		/* inBuff - the input buffer of data to be verified */
		inBuff : seq(JBYTE) &
		
		/* inOffset - the offset into the input buffer at which to begin signature generation */
		inOffset : JSHORT &
		inOffset >= 0 &
		
		/* inLength - the byte length to sign */
		inLength : JSHORT &
		inLength >= 0

		/* CryptoException.UNINITIALIZED_KEY if key not initialized. */
		/* CryptoException.INVALID_INIT if this Signature object is not initialized or 
		initialized for signature sign mode. */
		/* CryptoException.ILLEGAL_USE if beginVerify method has not been called. */
		
	THEN
		CHOICE 
			result := TRUE
		OR
			result := FALSE
		END
	END;

/*------------------------------------------------------------------------------------------*/
	/*the machine 'Signature' has also declare a method target 'getAlgorithm_1'*/
	algorithm <-- getAlgorithm_2 = 
		/* Returns the algorithm code implemented by this Signature instance. */
		ANY anyAlgorithm
		WHERE (anyAlgorithm : JBYTE) &
		(anyAlgorithm = ALG_DES_MAC4_NOPAD or
		anyAlgorithm = ALG_DES_MAC8_NOPAD or
		anyAlgorithm = ALG_DES_MAC4_ISO9797_M1 or
		anyAlgorithm = ALG_DES_MAC8_ISO9797_M1 or
		anyAlgorithm = ALG_DES_MAC4_ISO9797_M2 or
		anyAlgorithm = ALG_DES_MAC8_ISO9797_M2 or
		anyAlgorithm = ALG_DES_MAC4_PKCS5 or
		anyAlgorithm = ALG_DES_MAC8_PKCS5 or
		anyAlgorithm = ALG_RSA_SHA_ISO9796 or
		anyAlgorithm = ALG_RSA_SHA_PKCS1 or
		anyAlgorithm = ALG_RSA_MD5_PKCS1 or
		anyAlgorithm = ALG_RSA_RIPEMD160_ISO9796 or
		anyAlgorithm = ALG_RSA_RIPEMD160_PKCS1 or
		anyAlgorithm = ALG_DSA_SHA or
		anyAlgorithm = ALG_RSA_SHA_RFC2409 or
		anyAlgorithm = ALG_RSA_MD5_RFC2409 or
		anyAlgorithm = ALG_ECDSA_SHA or
		anyAlgorithm = ALG_AES_MAC_128_NOPAD or
		anyAlgorithm = ALG_DES_MAC4_ISO9797_1_M2_ALG3 or
		anyAlgorithm = ALG_DES_MAC8_ISO9797_1_M2_ALG3 or
		anyAlgorithm = ALG_RSA_SHA_PKCS1_PSS or
		anyAlgorithm = ALG_RSA_MD5_PKCS1_PSS or
		anyAlgorithm = ALG_RSA_RIPEMD160_PKCS1_PSS)
 		THEN algorithm := anyAlgorithm
		END;

/*------------------------------------------------------------------------------------------*/
	length <-- getlength = /*CryptoException*/
		/* CryptoException.INVALID_INIT if this Signature object is not initialized. */
		/* CryptoException.UNINITIALIZED_KEY if key not initialized. */
		
		ANY signaturemessagerecovery_length
		WHERE (signaturemessagerecovery_length : JSHORT) &
		(signaturemessagerecovery_length >= 0)
		THEN length := signaturemessagerecovery_length
		END;	

/*------------------------------------------------------------------------------------------*/
	/*the machine 'Signature' has also declare a method target 'update_1'*/
	update_2(inBuff, inOffset, inLength) = 
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

		/* CryptoException.UNINITIALIZED_KEY if key not initialized. */
		/* CryptoException.INVALID_INIT if this Signature object is not initialized. */
		/* CryptoException.ILLEGAL_USE if the mode set in the init() method is MODE_VERIFY and 
		the beginVerify() method is not yet called. */
		
	THEN
		/* If inLength is 0 this method does nothing. */
		skip
	END
END
