/* KeyAgreement
 *
 * The KeyAgreement class is the base class for key agreement algorithms such as 
 * Diffie-Hellman and EC Diffie-Hellman [IEEE P1363].
 *
 * Author: simone
 * Creation date: 07/04/11
 */
MACHINE
    KeyAgreement

SEES
	javacardSecurityClasses,
	JByte,
	JShort,
	JBoolean
	
/*This class extends java.lang.Object */
EXTENDS
	Object

CONSTANTS
	ALG_EC_SVDP_DH,
	ALG_EC_SVDP_DHC

PROPERTIES
	ALG_EC_SVDP_DH : JBYTE &
	ALG_EC_SVDP_DH = 1 &
	
	ALG_EC_SVDP_DHC : JBYTE &
	ALG_EC_SVDP_DHC = 2

OPERATIONS
	result <-- getInstance(algorithm, externalAccess) = 
	/* throws: CryptoException */
	PRE
		/* algorithm - the desired key agreement algorithm Valid codes listed in ALG_* constants */
		algorithm : JBYTE &
		(algorithm = ALG_EC_SVDP_DH or
		algorithm = ALG_EC_SVDP_DHC) &
		
		/* externalAccess - if true indicates that the instance will be shared among multiple 
		applet instances and that the KeyAgreement instance will also be accessed 
		(via a Shareable interface) when the owner of the KeyAgreement instance is not the 
		currently selected applet. If true the implementation must not allocate 
		CLEAR_ON_DESELECT transient space for internal data. */
		externalAccess : JBOOLEAN

		/* CryptoException.NO_SUCH_ALGORITHM if the requested algorithm or shared access mode 
		is not supported. */
		
	THEN
		/* Returns the KeyAgreement object instance of the requested algorithm. Valid codes 
		listed in ALG_* constants */
		ANY keyagreement_result
		WHERE (keyagreement_result : JBYTE) & 
		(keyagreement_result = ALG_EC_SVDP_DH or
		keyagreement_result = ALG_EC_SVDP_DHC)
		THEN result := keyagreement_result
		END
	END;

/*------------------------------------------------------------------------------------------*/
	init(privKey) = 
	/* throws: CryptoException */
	PRE
		/* privKey - the private key */
		privKey : PRIVATE_KEY

		/* CryptoException.ILLEGAL_VALUE if the input key type is inconsistent with the 
		KeyAgreement algorithm, for example, if the KeyAgreement algorithm is ALG_EC_SVDP_DH and 
		the key type is TYPE_RSA_PRIVATE, or if privKey is inconsistent with the implementation */
		/* CryptoException.UNINITIALIZED_KEY if privKey is uninitialized, or if the KeyAgreement 
		algorithm is set to ALG_EC_SVDP_DHC and the cofactor, K, has not been successfully 
		initialized since the time the initialized state of the key was set to false */
		
	THEN
		skip
	END;

/*------------------------------------------------------------------------------------------*/
	algorithm <-- getAlgorithm =
		/* Returns the algorithm code defined */
		ANY keyagreement_algorithm
		WHERE (keyagreement_algorithm : JBYTE) & 
		(keyagreement_algorithm = ALG_EC_SVDP_DH or
		keyagreement_algorithm = ALG_EC_SVDP_DHC)
		THEN algorithm := keyagreement_algorithm
		END;

/*------------------------------------------------------------------------------------------*/
	valueSecret <-- generateSecret(publicData, publicOffset, publicLength, secret, secretOffset) = 
	/* throws: CryptoException */
	PRE
		/* publicData - buffer holding the public data of the second party */
		publicData : seq(JBYTE) &
		
		/* publicOffset - offset into the publicData buffer at which the data begins */
		publicOffset : JSHORT &
		publicOffset >= 0 &
		
		/* publicLength - byte length of the public data */
		publicLength : JSHORT &
		publicLength >= 0 &
		
		/* secret - buffer to hold the secret output */
		secret : seq(JBYTE) &
		
		/* secretOffset - offset into the secret array at which to start writing the secret */
		secretOffset : JSHORT &
		secretOffset >= 0

		/* CryptoException.ILLEGAL_VALUE if the publicData data format is incorrect, or if the 
		publicData data is inconsistent with the PrivateKey specified during initialization */
		/* CryptoException.INVALID_INIT if this KeyAgreement object is not initialized */
	
	THEN
		/* Returns byte length of the secret */
		valueSecret := size(secret)
	END
END
