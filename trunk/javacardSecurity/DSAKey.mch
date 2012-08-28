/* DSAKey
 *
 * The DSAKey interface is the base interface for the DSA algorithm's private and 
 * public key implementations.
 *
 * Author: simone
 * Creation date: 07/04/11
 */
MACHINE
    DSAKey

SEES
	JShort,
	JByte

OPERATIONS
	setP(buffer, offset, length)= 
	/* throws: CryptoException */
	PRE
		/* buffer - the input buffer */
		buffer : seq(JBYTE) &
		
		/* offset - the offset into the input buffer at which the prime parameter value begins */
		offset : JSHORT	&
		offset >= 0 &
		
		/* length - the length of the prime parameter value */
		length : JSHORT &
		length >= 0 
		
		/* CryptoException.ILLEGAL_VALUE if the input parameter data length is inconsistent 
		with the implementation or if input data decryption is required and fails. */
		
	THEN
		skip
	END;

/*------------------------------------------------------------------------------------------*/	
	setQ(buffer, offset, length)= 
	/* throws: CryptoException */
	PRE
		/* buffer - the input buffer */
		buffer : seq(JBYTE) &
		
		/* offset - the offset into the input buffer at which the subprime parameter value begins */
		offset : JSHORT	&
		offset >= 0 &
		
		/* length - the length of the subprime parameter value */
		length : JSHORT &
		length >= 0 
		
		/* CryptoException.ILLEGAL_VALUE if the input parameter data length is inconsistent 
		with the implementation or if input data decryption is required and fails. */
		
	THEN
		skip
	END;

/*------------------------------------------------------------------------------------------*/
	setG(buffer, offset, length)= 
	/* throws: CryptoException */
	PRE
		/* buffer - the input buffer */
		buffer : seq(JBYTE) &
		
		/* offset - the offset into the input buffer at which the base parameter value begins */
		offset : JSHORT	&
		offset >= 0 &
		
		/* length - the length of the base parameter value */
		length : JSHORT &
		length >= 0 
		
		/* CryptoException.ILLEGAL_VALUE if the input parameter data length is inconsistent 
		with the implementation or if input data decryption is required and fails. */
		
	THEN
		skip
	END;

/*------------------------------------------------------------------------------------------*/
	valueP <-- getP(buffer, offset)=
	PRE
		/* buffer - the output buffer */
		buffer : seq(JBYTE) &
		
		/* offset - the offset into the output buffer at which the prime parameter value starts */
		offset : JSHORT	&
		offset >= 0

		/* CryptoException.UNINITIALIZED_KEY if the prime parameter has not been successfully 
		initialized since the time the initialized state of the key was set to false. */
		
	THEN
		ANY dsakey_valueP 
		WHERE (dsakey_valueP : JSHORT)
		THEN valueP := dsakey_valueP
		END
	END;

/*------------------------------------------------------------------------------------------*/
	valueQ <-- getQ(buffer, offset)=
	PRE
		/* buffer - the output buffer */
		buffer : seq(JBYTE) &
		
		/* offset - the offset into the output buffer at which the subprime parameter value begins */
		offset : JSHORT	&
		offset >= 0

		/* CryptoException.UNINITIALIZED_KEY if the subprime parameter has not been successfully 
		initialized since the time the initialized state of the key was set to false. */
		
	THEN
		ANY dsakey_valueQ 
		WHERE (dsakey_valueQ : JSHORT)
		THEN valueQ := dsakey_valueQ
		END
	END;

/*------------------------------------------------------------------------------------------*/
	valueG <-- getG(buffer, offset)=
	PRE
		/* buffer - the output buffer */
		buffer : seq(JBYTE) &
		
		/* offset - the offset into the output buffer at which the base parameter value begins */
		offset : JSHORT	&
		offset >= 0

		/* CryptoException.UNINITIALIZED_KEY if the base parameter has not been successfully 
		initialized since the time the initialized state of the key was set to false. */
		
	THEN
		ANY dsakey_valueG 
		WHERE (dsakey_valueG : JSHORT)
		THEN valueG := dsakey_valueG
		END
	END
END
