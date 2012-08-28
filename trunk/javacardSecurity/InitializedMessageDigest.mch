/* InitializedMessageDigest
 *
 * The InitializedMessageDigest class is a subclass of the base class MessageDigest. 
 * This class is used to generate a hash representing a specified message but with the 
 * additional capability to initialize the starting hash value corresponding to a previously 
 * hashed part of the message.
 *
 * Author: simone
 * Creation date: 31/05/11
 */
MACHINE
    InitializedMessageDigest

SEES
	JShort,
	JByte,
	MessageDigest


OPERATIONS
	setInitialDigest(initialDigestBuf, initialDigestOffset, 
				initialDigestLength, digestedMsgLenBuf, 
				digestedMsgLenOffset, digestedMsgLenLength) = 
	/*throws: CryptoException */
	PRE
		/* initialDigestBuf - input buffer containing the starting hash value representing 
		the previously computed hash (using the same algorithm) of first part of the message */
		initialDigestBuf : seq(JBYTE) &
		
		/* initialDigestOffset - offset into initialDigestBuf array where initial digest 
		value data begins */
		initialDigestOffset : JSHORT &
		initialDigestOffset >= 0 &
		
		/* initialDigestLength - the length of data in initialDigestBuf array. */
		initialDigestLength : JSHORT &
		/* CryptoException if the parameter 'initialDigestLength' is not equal to the length 
		of message digest of the algorithm (see LENGTH_* constants LENGTH_SHA) */
		(initialDigestLength = LENGTH_MD5 or
 		initialDigestLength = LENGTH_RIPEMD160 or
		initialDigestLength = LENGTH_SHA or
		initialDigestLength = LENGTH_SHA_256 or
		initialDigestLength = LENGTH_SHA_384 or
		initialDigestLength = LENGTH_SHA_512) & 
		
		/* digestedMsgLenBuf - the byte array containing the number of bytes in the first part 
		of the message that has previously been hashed to obtain the specified initial digest 
		value value */
		digestedMsgLenBuf : seq(JBYTE) &
		
		/* digestedMsgLenOffset - the offset within digestedMsgLenBuf where the digested length 
		begins(the bytes starting at this offset for digestedMsgLenLength bytes are concatenated 
		to form the actual digested message length value) */
		digestedMsgLenOffset : JSHORT &
		digestedMsgLenOffset >= 0 &
		
		/* digestedMsgLenLength - byte length of the digested length */
		digestedMsgLenLength : JSHORT &
		digestedMsgLenLength >= 0

		/* CryptoException if the number of bytes in the first part of the message that has 
		previously been hashed is 0 or not a multiple of the algorithm's block size or greater 
		than the maximum length supported by the algorithm 
		(see ALG_* algorithm descriptions ALG_SHA) */
		
	THEN
		skip
	END	
END
