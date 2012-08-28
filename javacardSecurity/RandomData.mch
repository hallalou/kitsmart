/* RandomData
 *
 * The RandomData abstract class is the base class for random number generation.
 *
 * Author: simone
 * Creation date: 11/04/11
 */
MACHINE
    RandomData

SEES
	javacardSecurityClasses,
	JByte,
	JShort

/*This class extends java.lang.Object */
EXTENDS
	Object

CONSTANTS
 ALG_PSEUDO_RANDOM,
 ALG_SECURE_RANDOM

PROPERTIES
 ALG_PSEUDO_RANDOM : JBYTE &
 ALG_PSEUDO_RANDOM = 1 &
 
 ALG_SECURE_RANDOM : JBYTE &
 ALG_SECURE_RANDOM = 2

OPERATIONS
	result <-- getInstance(algorithm) = 
	/* throws: CryptoException */
	PRE
		/* algorithm - the desired random number algorithm. Valid codes listed in ALG_* constants */
		algorithm : JBYTE &
		(algorithm = ALG_PSEUDO_RANDOM or
 		algorithm = ALG_SECURE_RANDOM)

		/* CryptoException.NO_SUCH_ALGORITHM if the requested algorithm is not supported */
		
	THEN
		/* Returns: the RandomData object instance of the requested algorithm */
		ANY randomdata_result
		WHERE (randomdata_result : RANDOM_DATA)
		THEN result := randomdata_result
		END 
	END;
	
/*------------------------------------------------------------------------------------------*/
	generateData(buffer, offset, length) = 
	/* throws: CryptoException */
	PRE
		/* buffer - the output buffer */
		buffer : seq(JBYTE) &
		
		/* offset - the offset into the output buffer */
		offset : JSHORT &
		offset >= 0 &
		
		/* length - the length of random data to generate */
		length : JSHORT &
		length > 0 
		
		/* CryptoException.ILLEGAL_VALUE if the length parameter is zero */
		
	THEN
		skip
	END;

/*------------------------------------------------------------------------------------------*/
	setSeed(buffer, offset, length) =
	PRE
		/* buffer - the input buffer */
		buffer : seq(JBYTE) &
		
		/* offset - the offset into the input buffer */
		offset : JSHORT &
		offset >= 0 &
		
		/* length - the length of the seed data */
		length : JSHORT &
		length >= 0
	THEN
		skip
	END
END
