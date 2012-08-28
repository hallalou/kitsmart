/* Checksum
 *
 * The Checksum class is the base class for CRC (cyclic redundancy check) checksum algorithms.
 *
 * Author: simone
 * Creation date: 07/04/11
 */
MACHINE
    Checksum

SEES
	JShort,
	JByte,
	JBoolean

/*This class extends java.lang.Object */
EXTENDS
	Object

CONSTANTS
 ALG_ISO3309_CRC16,
 ALG_ISO3309_CRC32

PROPERTIES
 ALG_ISO3309_CRC16 : JBYTE &
 ALG_ISO3309_CRC16 = 1 &
 
 ALG_ISO3309_CRC32 : JBYTE &
 ALG_ISO3309_CRC32 = 2

OPERATIONS
	result <-- getInstance(algorithm, externalAccess) = 
	/* throws: CryptoException*/
	PRE
		/* algorithm - the desired checksum algorithm. Valid codes listed in ALG_* constants */
		algorithm : JBYTE &
		(algorithm = ALG_ISO3309_CRC16 or
		algorithm = ALG_ISO3309_CRC32) &
		
		/* externalAccess - true indicates that the instance will be shared among multiple 
		applet instances and that the Checksum instance will also be accessed 
		(via a Shareable. interface) when the owner of the Checksum instance is not the 
		currently selected applet. If true the implementation must not allocate 
		CLEAR_ON_DESELECT transient space for internal data. */
		externalAccess : JBOOLEAN
		
		/* CryptoException.NO_SUCH_ALGORITHM if the requested algorithm or shared access 
		mode is not supported. */
		
	THEN
		/* Returns the Checksum object instance of the requested algorithm. */
		ANY checksum_result
		WHERE (checksum_result : JBYTE) & 
		(checksum_result = ALG_ISO3309_CRC16 or
		checksum_result = ALG_ISO3309_CRC32)
		THEN result := checksum_result
		END
	END;

/*------------------------------------------------------------------------------------------*/
	init(bArray, bOff, bLen) = 
	/* throws: CryptoException*/
	PRE
		/* bArray - byte array containing algorithm specific initialization information */
		bArray : seq(JBYTE) &
		(size(bArray) = 2 or
		size(bArray) = 4) &
		
		/* bOff - offset within bArray where the algorithm specific data begins */
		bOff : JSHORT &
		bOff >= 0 &
		
		/* bLen - byte length of algorithm specific parameter data */
		bLen : JSHORT &
		(bLen = 2 or bLen = 4)

		/* CryptoException if a byte array parameter option is not supported by the algorithm or 
		if the bLen is an incorrect byte length for the algorithm specific data */
		
	THEN
		skip
	END;

/*------------------------------------------------------------------------------------------*/
	algorithm <-- getAlgorithm =
	
		/* Returns the algorithm code defined, valid codes listed in ALG_* constants */
		ANY checksum_algorithm
		WHERE (checksum_algorithm : JBYTE) &
		(checksum_algorithm = ALG_ISO3309_CRC16 or
		checksum_algorithm = ALG_ISO3309_CRC32)
		THEN algorithm := checksum_algorithm
		END;

/*------------------------------------------------------------------------------------------*/
	numbytes <-- doFinal(inBuff, inOffset, inLength, outBuff, outOffset)=
	PRE
		/* inBuff - the input buffer of data to be checksummed */
		inBuff : seq(JBYTE) &
		
		/* inOffset - the offset into the input buffer at which to begin checksum generation */
		inOffset : JSHORT &
		inOffset >= 0 &
		
		/* inLength - the byte length to checksum */
		inLength : JSHORT &
		inLength >= 0 &
		
		/* outBuff - the output buffer, may be the same as the input buffer */
		outBuff : seq(JBYTE) &
		
		/* outOffset - the offset into the output buffer where the resulting checksum value begins */
		outOffset : JSHORT &
		outOffset >= 0
		
	THEN
		/* Returns number of bytes of checksum output in outBuff */
		numbytes := size(outBuff)
	END;

/*------------------------------------------------------------------------------------------*/
	update(inBuff, inOffset, inLength)=
	PRE
		/* inBuff - the input buffer of data to be checksummed */
		inBuff : seq(JBYTE) &
		
		/* inOffset - the offset into the input buffer at which to begin checksum generation */
		inOffset : JSHORT &
		inOffset >= 0 &
		
		/* inLength - the byte length to checksum */
		inLength : JSHORT &
		inLength >= 0
		
	THEN
		/* If inLength is 0 this method does nothing. */
		skip
	END
END
