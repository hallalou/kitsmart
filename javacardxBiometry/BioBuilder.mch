/* BioBuilder
 * Author: simone
 * Creation date: 31/08/11
 *
 * This class builds an empty/blank biometric reference template.
 */
 
MACHINE
    BioBuilder

SEES
	javacardxBiometryClasses,
	JShort,
	JByte

/*This class extends java.lang.Object */
EXTENDS
	Object

CONSTANTS
	FACIAL_FEATURE,
	VOICE_PRINT,
	FINGERPRINT,
	IRIS_SCAN,
	RETINA_SCAN,
	HAND_GEOMETRY,
	SIGNATURE,
	KEYSTROKES,
	LIP_MOVEMENT,
	THERMAL_FACE,
	THERMAL_HAND,
	GAIT_STYLE,
	BODY_ODOR,
	DNA_SCAN,
	EAR_GEOMETRY,
	FINGER_GEOMETRY,
	PALM_GEOMETRY,
	VEIN_PATTERN,
	PASSWORD,
	DEFAULT_INITPARAM

PROPERTIES
	FACIAL_FEATURE : JBYTE &
	FACIAL_FEATURE = 1 &
	VOICE_PRINT : JBYTE &
	VOICE_PRINT = 2 &
	FINGERPRINT : JBYTE &
	FINGERPRINT = 3 &
	IRIS_SCAN : JBYTE &
	IRIS_SCAN = 4 &
	RETINA_SCAN : JBYTE &
	RETINA_SCAN = 5 &
	HAND_GEOMETRY : JBYTE &
	HAND_GEOMETRY = 6 &
	SIGNATURE : JBYTE &
	SIGNATURE = 7 &
	KEYSTROKES : JBYTE &
	KEYSTROKES = 8 &
	LIP_MOVEMENT : JBYTE &
	LIP_MOVEMENT = 9 &
	THERMAL_FACE : JBYTE &
	THERMAL_FACE = 10 &
	THERMAL_HAND : JBYTE &
	THERMAL_HAND = 11 &
	GAIT_STYLE : JBYTE &
	GAIT_STYLE = 12 &
	BODY_ODOR : JBYTE &
	BODY_ODOR = 13 &
	DNA_SCAN : JBYTE &
	DNA_SCAN = 14 &
	EAR_GEOMETRY : JBYTE &
	EAR_GEOMETRY = 15 &
	FINGER_GEOMETRY : JBYTE &
	FINGER_GEOMETRY = 16 &
	PALM_GEOMETRY : JBYTE &
	PALM_GEOMETRY = 17&
	VEIN_PATTERN : JBYTE &
	VEIN_PATTERN = 18 &
	PASSWORD : JBYTE &
	PASSWORD = 31 &
	DEFAULT_INITPARAM : JBYTE &
	DEFAULT_INITPARAM = 0

OPERATIONS
	result <-- buildBioTemplate_1(bioType, tryLimit) = 
	/* throws: BioException
		*/
	PRE
		/* bioType - the type of the template to be generated */
		/* BioException.NO_SUCH_BIO_TEMPLATE if the requested template associated 
		with the specified 'bioType' is not supported. Valid codes are listed in
		the biometric pattern type constants. */
		bioType : JBYTE &
		(bioType = FACIAL_FEATURE or
 		bioType = VOICE_PRINT or
 		bioType = FINGERPRINT or
 		bioType = IRIS_SCAN or
 		bioType = RETINA_SCAN or
 		bioType = HAND_GEOMETRY or
 		bioType = SIGNATURE or
 		bioType = KEYSTROKES or
 		bioType = LIP_MOVEMENT or
 		bioType = THERMAL_FACE or
 		bioType = THERMAL_HAND or
 		bioType = GAIT_STYLE or
 		bioType = BODY_ODOR or
 		bioType = DNA_SCAN or
 		bioType = EAR_GEOMETRY or
 		bioType = FINGER_GEOMETRY or
 		bioType = PALM_GEOMETRY or
 		bioType = VEIN_PATTERN or
 		bioType = PASSWORD) &
		
		/* tryLimit - maximum unsuccessful matches before template is blocked. 
		tryLimit must be at least 1 */
		/* BioException.ILLEGAL_VALUE if 'tryLimit' parameter is less than 1 */
		tryLimit : JBYTE &
		tryLimit >= 1 
	THEN
		/* Returns: the OwnerBioTemplate object instance of the requested bioType 
		and tryLimit access. */
		result :: OWNER_BIO_TEMPLATE
	END;

/*--------------------------------------------------------------------------------*/
	result <-- buildBioTemplate_2(bioType, tryLimit, RID, initParam) = 
	/* throws: BioException
		*/
	PRE
		/* bioType - the type of the template to be generated. */
		/* BioException.NO_SUCH_BIO_TEMPLATE if the requested template associated 
		 with the specified bioType is not supported. Valid codes are listed in 
		 the biometric pattern type constants. */
		bioType : JBYTE &
		(bioType = FACIAL_FEATURE or
 		bioType = VOICE_PRINT or
 		bioType = FINGERPRINT or
 		bioType = IRIS_SCAN or
 		bioType = RETINA_SCAN or
 		bioType = HAND_GEOMETRY or
 		bioType = SIGNATURE or
 		bioType = KEYSTROKES or
 		bioType = LIP_MOVEMENT or
 		bioType = THERMAL_FACE or
 		bioType = THERMAL_HAND or
 		bioType = GAIT_STYLE or
 		bioType = BODY_ODOR or
 		bioType = DNA_SCAN or
 		bioType = EAR_GEOMETRY or
 		bioType = FINGER_GEOMETRY or
 		bioType = PALM_GEOMETRY or
 		bioType = VEIN_PATTERN or
 		bioType = PASSWORD) &
		
		/* tryLimit - maximum unsuccessful matches before template is blocked. 
		tryLimit must be at least 1. */
		/* BioException.ILLEGAL_VALUE if 'tryLimit' parameter is less than 1*/
		tryLimit : JBYTE &
		tryLimit >= 1 &

		/* RID - the RID of the provider of OwnerBioTemplate implementation. 
		null value means default provider */
		RID : seq(JBYTE) &
		
		/* initParam - the provider specific initialization information for 
		the OwnerBioTemplate instance. DEFAULT_INITPARAM is default value. */
		initParam : JBYTE
	THEN
		/* Returns: the OwnerBioTemplate object instance of the requested bioType 
		and tryLimit access. */
		result :: OWNER_BIO_TEMPLATE 
	END
	
END
