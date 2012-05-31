/* SharedBioTemplate
 * Author: simone
 * Creation date: 31/08/11
 *
 * The SharedBioTemplate interface provides the means for accessing unrestricted 
 * biometric functionality, e.g., the biometric matching functions.
 */
MACHINE
    SharedBioTemplate

/*This class extends javacardx.biometry.BioTemplate and javacard.framework.Shareable */
EXTENDS
	BioTemplate,
	Shareable
END
