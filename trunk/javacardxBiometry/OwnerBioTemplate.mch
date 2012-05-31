/* OwnerBioTemplate
 * Author: simone
 * Creation date: 31/08/11
 *
 * The OwnerBioTemplate interface should be implemented by the applet which 
 * owns the biometric template.
 */
MACHINE
    OwnerBioTemplate

SEES
	JShort,
	JByte

/*This class extends javacardx.biometry.BioTemplate */
EXTENDS
	BioTemplate

OPERATIONS
	init(bArray, offset, length) = 
	/* throws: BioException
		*/
	PRE
		/* bArray - byte array containing the data of the template */
		bArray : seq(JBYTE) &
		
		/* offset - starting offset in the bArray */
		offset : JSHORT &
		offset >= 0 &
		
		/* length - byte length of the template data in the bArray */
		length : JSHORT &
		length >= 0

		/* BioException.INVALID_DATA if the submitted template data does not have 
		the required format */
	THEN
		skip
	END;

/*--------------------------------------------------------------------------------*/
	update(bArray, offset, length) = 
	/* throws: BioException
		*/
	PRE
		/* bArray - byte array containing the data of the template */
		bArray : seq(JBYTE) &
		
		/* offset - starting offset in the bArray */
		offset : JSHORT &
		offset >= 0 &
		
		/* length - byte length of the template data in the bArray */
		length : JSHORT &
		length >= 0

		/* BioException.ILLEGAL_USE if the reference is already initialized or 
		the current enrollment state doesn't expect this method */
		/* BioException.INVALID_DATA if the submitted template data does not 
		have the required format */
	THEN
		skip
	END;

/*--------------------------------------------------------------------------------*/
	dofinal = 
	/* throws: BioException
		*/
		/* BioException.ILLEGAL_USE if the reference is already initialized or 
		the current enrollment state doesn't expect this method */
		/* BioException.INVALID_DATA if the submitted template data does not 
		have the required format */
		
		skip;

/*--------------------------------------------------------------------------------*/
	resetUnblockAndSetTryLimit(newTryLimit) = /*BioException*/
	PRE
		/* newTryLimit - the number of tries allowed before the reference is 
		blocked. newTryLimit must be at least 1. */
		/* BioException.ILLEGAL_VALUE if the newTryLimit parameter is less than 1. */
		newTryLimit : JBYTE &
		newTryLimit >= 1
	THEN
		skip
	END
	
END
