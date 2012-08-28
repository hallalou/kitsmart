/* javacardSecurityClasses - models a simulation of the class hierarchy of the
 * javacard.security package in B 
 * !! IMPORTANT: This machine MUST be SEEN by any module that references 
 * the types corresponding to these classes !!
 * Author: simone
 * Creation date: Wed Mai 30 2012
 */
MACHINE
    javacardSecurityClasses
    
SEES
    javaLangClasses,
	javacardFrameworkClasses

CONSTANTS /* to be able to refer to JC API classes and interfaces to type data */
	KEY,
	PRIVATE_KEY,
	PUBLIC_KEY,
	MESSAGE_DIGEST,
	INITIALIZED_MESSAGE_DIGEST,
	RANDOM_DATA,
	SIGNATURE,
	CRYPTO_EXCEPTION
    
PROPERTIES
	KEY <: CLASS_TYPE &
	PRIVATE_KEY <: KEY &
	PUBLIC_KEY <: KEY &
	MESSAGE_DIGEST <: OBJECT &
	INITIALIZED_MESSAGE_DIGEST <: MESSAGE_DIGEST &
	RANDOM_DATA <: OBJECT &
	SIGNATURE <: OBJECT &
	CRYPTO_EXCEPTION <: CARD_RUNTIME_EXCEPTION

END
