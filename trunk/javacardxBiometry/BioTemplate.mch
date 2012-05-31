/* BioTemplate
 * Author: simone
 * Creation date: 31/08/11
 *
 * The BioTemplate interface is the base interface for all biometric templates. 
 * It provides the user interface for accessing biometric functionality.
 */
MACHINE
    BioTemplate

SEES
	JShort,
	JByte,
	BioBuilder

CONSTANTS
 MINIMUM_SUCCESSFUL_MATCH_SCORE,
 MATCH_NEEDS_MORE_DATA

PROPERTIES
 MINIMUM_SUCCESSFUL_MATCH_SCORE : JSHORT &
 MINIMUM_SUCCESSFUL_MATCH_SCORE = 16384 &
 MATCH_NEEDS_MORE_DATA : JSHORT &
 MATCH_NEEDS_MORE_DATA = -1
 
OPERATIONS
	result <-- isInitialized = 
		CHOICE
			result := TRUE
		OR
			result := FALSE
		END;

/*--------------------------------------------------------------------------------*/
	result <-- isValidated = 
		CHOICE
			result := TRUE
		OR
			result := FALSE
		END;

/*--------------------------------------------------------------------------------*/
	reset = 
		skip;

/*--------------------------------------------------------------------------------*/
	tries <-- getTriesRemaining = 
		
		/* BioException.NO_TEMPLATES_ENROLLED if the reference template is 
		uninitialized */
		
		ANY biotemplate_tries
		WHERE (biotemplate_tries : JBYTE) & (biotemplate_tries >= 0)
		THEN tries := biotemplate_tries
		END;

/*--------------------------------------------------------------------------------*/
	bioType <-- getBioType = 
	
		/* Returns: biometric general type. Valid type are described in BioBuilder */
		ANY biotemplate_bioType
		WHERE (biotemplate_bioType : JBYTE) &
		(biotemplate_bioType = FACIAL_FEATURE or
 		biotemplate_bioType = VOICE_PRINT or
 		biotemplate_bioType = FINGERPRINT or
 		biotemplate_bioType = IRIS_SCAN or
 		biotemplate_bioType = RETINA_SCAN or
 		biotemplate_bioType = HAND_GEOMETRY or
 		biotemplate_bioType = SIGNATURE or
 		biotemplate_bioType = KEYSTROKES or
 		biotemplate_bioType = LIP_MOVEMENT or
 		biotemplate_bioType = THERMAL_FACE or
 		biotemplate_bioType = THERMAL_HAND or
 		biotemplate_bioType = GAIT_STYLE or
 		biotemplate_bioType = BODY_ODOR or
 		biotemplate_bioType = DNA_SCAN or
 		biotemplate_bioType = EAR_GEOMETRY or
 		biotemplate_bioType = FINGER_GEOMETRY or
 		biotemplate_bioType = PALM_GEOMETRY or
 		biotemplate_bioType = VEIN_PATTERN or
 		biotemplate_bioType = PASSWORD)
		THEN bioType := biotemplate_bioType
		END;

/*--------------------------------------------------------------------------------*/
	numBytes <-- getVersion(dest, offset) = 
		PRE
			/* dest - destination byte array. */
			dest : seq(JBYTE) &
			
			/* offset - starting offset within the destination byte array. */
			offset : JSHORT
		THEN
			ANY biotemplate_numBytes
			WHERE (biotemplate_numBytes : JBYTE) &
			(biotemplate_numBytes >= 0)
			THEN numBytes := biotemplate_numBytes
			END
		END;

/*--------------------------------------------------------------------------------*/
	numBytes <-- getPublicTemplateData(publicOffset, dest, destOffset, length) = 
	/* throws: BioException
		*/
	PRE
		/* publicOffset - starting offset within the public data. */
		publicOffset : JSHORT &
		publicOffset >= 0 &
		
		/* dest - destination byte array. */
		dest : seq(JBYTE) &
		
		/* destOffset - starting offset within the destination byte array. */
		destOffset : JSHORT &
		destOffset >= 0 &
		
		/* length - maximum length in bytes of the requested data. */
		length : JSHORT &
		length >= 0

		/* BioException.NO_TEMPLATES_ENROLLED if the reference template is 
		uninitialized */
	THEN
		ANY biotemplate_numBytes
		WHERE (biotemplate_numBytes : JBYTE) &
		(biotemplate_numBytes >= 0)
		THEN numBytes := biotemplate_numBytes
		END
	END;

/*--------------------------------------------------------------------------------*/
	matchScore <-- initMatch(candidate, offset, length) = 
	/* throws: BioException
		*/
	PRE
		/* candidate - the data or part of the data of the candidate template. */
		candidate : seq(JBYTE) &
		
		/* offset - starting offset into the candidate array where the candidate 
		data is to be found. */
		offset : JSHORT &
		offset >= 0 &
		
		/* length - number of bytes to be taken from the candidate array. */
		length : JSHORT &
		length >= 0

		/* BioException.NO_TEMPLATES_ENROLLED if the reference template is 
		uninitialized */
		/* BioException.INVALID_DATA if the submitted candidate template data does 
		not have the required format */
	THEN
		ANY anyMatchScore
		WHERE (anyMatchScore : JSHORT) &
		(anyMatchScore >= MINIMUM_SUCCESSFUL_MATCH_SCORE or
		(anyMatchScore >=0 & anyMatchScore < MINIMUM_SUCCESSFUL_MATCH_SCORE) or
		anyMatchScore = MATCH_NEEDS_MORE_DATA)
		THEN matchScore := anyMatchScore
		END
	END;

/*--------------------------------------------------------------------------------*/
	matchScore <-- match(candidate, offset, length) = 
	/* throws: BioException
		*/
	PRE
		/* candidate - the data or part of the data of the candidate template. */
		candidate : seq(JBYTE) &
		
		/* offset - starting offset into the candidate array where the candidate 
		data is to be found. */
		offset : JSHORT &
		offset >= 0 &
		
		/* length - number of bytes to be taken from the candidate array. */
		length : JSHORT &
		length >= 0

		/* BioException.ILLEGAL_USE if used outside a matching session */
		/* BioException.NO_TEMPLATES_ENROLLED if the reference template is 
		uninitialized */
		/* BioException.INVALID_DATA if the submitted candidate template data does 
		not have the required format */
	THEN
		ANY anyMatchScore
		WHERE (anyMatchScore : JSHORT) &
		(anyMatchScore >= MINIMUM_SUCCESSFUL_MATCH_SCORE or
		(anyMatchScore >=0 & anyMatchScore < MINIMUM_SUCCESSFUL_MATCH_SCORE) or
		anyMatchScore = MATCH_NEEDS_MORE_DATA)
		THEN matchScore := anyMatchScore
		END
	END
	
END
