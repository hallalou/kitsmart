/* javacardFrameworkClasses - models a simulation of the class hierarchy of the
 * java.framework package in B 
 * !! IMPORTANT: This machine MUST be SEEN by any module that references 
 * the types corresponding to these classes !!
 * Author: Anamaria
 * Creation date: Tue Apr 10 2012
 */
MACHINE
    javacardFrameworkClasses
    
SEES
    javaLangClasses

CONSTANTS /* to be able to refer to JC API classes and interfaces to type data */
	SHAREABLE,  	/* an interface to be implemented by applets */
	PIN,			/* an interface to be implemented by applets */
	APPLET_EVENT,	/* an interface to be implemented by applets */
	MULTISELECTABLE,/* an interface to be implemented by applets */
	/* ISO7816  - this interface only defines ISO 7816 constants, should not 	
    appear as a type */
	
    CARD_RUNTIME_EXCEPTION,
    CARD_EXCEPTION,
    ISO_EXCEPTION,
    PIN_EXCEPTION,
    SYSTEM_EXCEPTION,
    TRANSACTION_EXCEPTION, 
    USER_EXCEPTION,
    APDU_EXCEPTION,
    AID,
    OWNER_PIN,
    APDU
    
    
PROPERTIES
	SHAREABLE <: CLASS_TYPE &
	PIN <: CLASS_TYPE &
	APPLET_EVENT <: CLASS_TYPE &
	MULTISELECTABLE <: CLASS_TYPE &
    CARD_RUNTIME_EXCEPTION <: RUNTIME_EXCEPTION &
    CARD_EXCEPTION <: EXCEPTION &
    ISO_EXCEPTION <: CARD_RUNTIME_EXCEPTION &
    PIN_EXCEPTION <: CARD_RUNTIME_EXCEPTION &
    SYSTEM_EXCEPTION <: CARD_RUNTIME_EXCEPTION &
    TRANSACTION_EXCEPTION <: CARD_RUNTIME_EXCEPTION &
    USER_EXCEPTION <: CARD_EXCEPTION &
    APDU_EXCEPTION <: CARD_RUNTIME_EXCEPTION &
    AID <: OBJECT &
    OWNER_PIN <: OBJECT &
    APDU <: OBJECT

END
