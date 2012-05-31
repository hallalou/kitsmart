/* javacardxBiometryClasses - models a simulation of the class hierarchy of the
 * javacardx.biometry package in B 
 * !! IMPORTANT: This machine MUST be SEEN by any module that references 
 * the types corresponding to these classes !!
 * Author: simone
 * Creation date: Wed Mai 30 2012
 */
MACHINE
    javacardxBiometryClasses
    
SEES
    javaLangClasses

CONSTANTS /* to be able to refer to JC API classes and interfaces to type data */
	BIO_TEMPLATE, 		 /* is the base interface for all biometric templates */
	OWNER_BIO_TEMPLATE,  /* an interface to be implemented by applets which 
						 owns the biometric template */
	SHARED_BIO_TEMPLATE, /* interface provides the means for accessing 
						 unrestricted biometric functionality */	
    BIO_EXCEPTION
    
    
PROPERTIES
	BIO_TEMPLATE <: CLASS_TYPE & /* CLASS_TYPE is the root of the hierarchy of class 
								 and interfaces */
	OWNER_BIO_TEMPLATE <: BIO_TEMPLATE &
	SHARED_BIO_TEMPLATE <: BIO_TEMPLATE &
	BIO_EXCEPTION <: CARD_RUNTIME_EXCEPTION

END
