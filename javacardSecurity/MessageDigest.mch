/* MessageDigest
 *
 * The MessageDigest class is the base class for hashing algorithms.
 *
 * Author: simone
 * Creation date: 03/04/11
 */
MACHINE
    MessageDigest

SEES
	javacardSecurityClasses,
	JByte,
	JShort,
	JBoolean

/*This class extends java.lang.Object */
EXTENDS
	Object

CONSTANTS
	ALG_SHA,
	ALG_MD5,
	ALG_RIPEMD160,
	ALG_SHA_256,
	ALG_SHA_384,
	ALG_SHA_512,
	LENGTH_MD5,
	LENGTH_RIPEMD160,
	LENGTH_SHA,
	LENGTH_SHA_256,
	LENGTH_SHA_384,
	LENGTH_SHA_512

PROPERTIES
	ALG_SHA : JBYTE & 
	ALG_SHA = 1 &
	
	ALG_MD5 : JBYTE &
	ALG_MD5 = 2 &
 
	ALG_RIPEMD160 : JBYTE &
	ALG_RIPEMD160 = 3 &
 
	ALG_SHA_256 : JBYTE &
	ALG_SHA_256 = 4 &
 
	ALG_SHA_384 : JBYTE &
	ALG_SHA_384 = 5 &
 
	ALG_SHA_512 : JBYTE &
	ALG_SHA_512 = 6 &
 
	LENGTH_MD5 : JBYTE & 
	LENGTH_MD5 = 16 &
 
	LENGTH_RIPEMD160 : JBYTE & 
	LENGTH_RIPEMD160 = 20 &
 
	LENGTH_SHA : JBYTE &
	LENGTH_SHA = 20 &
 
	LENGTH_SHA_256 : JBYTE &
	LENGTH_SHA_256 = 32 &
 
	LENGTH_SHA_384 : JBYTE & 
	LENGTH_SHA_384 = 48 &
 
	LENGTH_SHA_512 : JBYTE & 
	LENGTH_SHA_512 = 64

OPERATIONS
	result <-- getInstance(algorithm, externalAccess) = 
	/* throws: CryptoException */
	PRE
		/* algorithm - the desired message digest algorithm. Valid codes listed in ALG_* constants */
		algorithm : JBYTE &
		(algorithm = ALG_SHA or
		algorithm = ALG_MD5 or
 		algorithm = ALG_RIPEMD160 or
		algorithm = ALG_SHA_256 or
		algorithm = ALG_SHA_384 or
 		algorithm = ALG_SHA_512) &
		
		/* externalAccess - true indicates that the instance will be shared among multiple 
		applet instances and that the MessageDigest instance will also be accessed 
		(via a Shareable. interface) when the owner of the MessageDigest instance is not the 
		currently selected applet. If true the implementation must not allocate 
		CLEAR_ON_DESELECT transient space for internal data. */
		externalAccess : JBOOLEAN

		/* CryptoException.NO_SUCH_ALGORITHM if the requested algorithm or shared access mode 
		is not supported */
		
	THEN
		/* Returns: the MessageDigest object instance of the requested algorithm */
		ANY messagedigest_result
		WHERE (messagedigest_result : MESSAGE_DIGEST)
		THEN result := messagedigest_result
		END
	END;

/*------------------------------------------------------------------------------------------*/
	instance <-- getInitializedMessageDigestInstance (algorithm, externalAccess) = 
	/* throws: CryptoException */
	PRE
		/* algorithm - the desired message digest algorithm. Valid codes listed in ALG_* constants */
		algorithm : JBYTE &
		(algorithm = ALG_SHA or
		algorithm = ALG_MD5 or
 		algorithm = ALG_RIPEMD160 or
		algorithm = ALG_SHA_256 or
		algorithm = ALG_SHA_384 or
 		algorithm = ALG_SHA_512) &
		
		/* externalAccess - true indicates that the instance will be shared among multiple 
		applet instances and that the InitializedMessageDigest instance will also be accessed 
		(via a Shareable. interface) when the owner of the InitializedMessageDigest instance is 
		not the currently selected applet. If true the implementation must not allocate 
		CLEAR_ON_DESELECT transient space for internal data. */
		externalAccess : JBOOLEAN

		/* CryptoException.NO_SUCH_ALGORITHM if the requested algorithm or shared access mode 
		is not supported */
		
	THEN
		/* Returns: the InitializedMessageDigest object instance of the requested algorithm */
		ANY messagedigest_instance
		WHERE (messagedigest_instance : INITIALIZED_MESSAGE_DIGEST)
		THEN instance := messagedigest_instance
		END
	END;
	
/*------------------------------------------------------------------------------------------*/
	algorithm <-- getAlgorithm =
		ANY messagedigest_algorithm
		WHERE (messagedigest_algorithm : JBYTE) &
		(messagedigest_algorithm = ALG_SHA or
		messagedigest_algorithm = ALG_MD5 or
 		messagedigest_algorithm = ALG_RIPEMD160 or
		messagedigest_algorithm = ALG_SHA_256 or
		messagedigest_algorithm = ALG_SHA_384 or
 		messagedigest_algorithm = ALG_SHA_512)
		THEN algorithm := messagedigest_algorithm
		END;	
	
/*------------------------------------------------------------------------------------------*/
	length <-- getLength =
		ANY messagedigest_length
		WHERE (messagedigest_length : JBYTE) &
		(messagedigest_length = LENGTH_MD5 or
		messagedigest_length = LENGTH_RIPEMD160 or
 		messagedigest_length = LENGTH_SHA or
		messagedigest_length = LENGTH_SHA_256 or
		messagedigest_length = LENGTH_SHA_384 or
 		messagedigest_length = LENGTH_SHA_512)
		THEN length := messagedigest_length
		END;

/*------------------------------------------------------------------------------------------*/
	numbytes <-- doFinal(inBuff, inOffset, inLength, outBuff, outOffset)= 
	/* throws: CryptoException */
	PRE
		/* inBuff - the input buffer of data to be hashed */
		inBuff : seq(JBYTE) &
		
		/* inOffset - the offset into the input buffer at which to begin hash generation */
		inOffset : JSHORT &
		inOffset >= 0 &
		
		/* inLength - the byte length to hash */
		inLength : JSHORT &
		inLength >= 0 &
		
		/* outBuff - the output buffer, may be the same as the input buffer */
		outBuff : seq(JBYTE) &
		
		/* outOffset - the offset into the output buffer where the resulting hash value begins */
		outOffset : JSHORT &
		outOffset >= 0

		/* CryptoException.ILLEGAL_USE if the accumulated message length is greater than the 
		maximum length supported by the algorithm */
		
	THEN
		ANY messagedigest_numbytes
		WHERE ((messagedigest_numbytes : JSHORT) &
		(messagedigest_numbytes >= 0))
		THEN numbytes := messagedigest_numbytes
		END
	END;

/*------------------------------------------------------------------------------------------*/
	update(inBuff, inOffset, inLength) = 
	/* throws: CryptoException */
	PRE
		/* inBuff - the input buffer of data to be hashed */
		inBuff : seq(JBYTE) &
		
		/* inOffset - the offset into the input buffer at which to begin hash generation */
		inOffset : JSHORT &
		inOffset >= 0 &
		
		/* inLength - the byte length to hash */
		inLength : JSHORT &
		inLength >= 0

		/* CryptoException.ILLEGAL_USE if the accumulated message length is greater than the 
		maximum length supported by the algorithm */
		
	THEN
		skip
	END;

/*------------------------------------------------------------------------------------------*/
	reset = 
		skip

END
