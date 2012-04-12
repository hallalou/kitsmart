/* javacardFrameworkClasses
 * Author: Anamaria
 * Creation date: Tue Apr 10 2012
 */
MACHINE
    javacardFrameworkClasses
    
SEES
    javaLangClasses
    
SETS /* to be able to refer to JC API interfaces to type data */
    SHAREABLE; 		/* to be implemented by applets */
    PIN;
    APPLET_EVENT; 	/* to be implemented by applets */
    ISO7816;  		/* only defines ISO 7816 constants */
    MULTISELECTABLE 	/* to be implemented by applets */
    
CONSTANTS
    CARD_RUNTIME_EXCEPTION,
    CARD_EXCEPTION,
    ISO_EXCEPTION,
    PIN_EXCEPTION,
    SYSTEM_EXCEPTION,
    TRANSACTION_EXCEPTION, 
    USER_EXCEPTION,
    APDU_EXCEPTION,
    AID,
    OWNER_PIN
    
    
PROPERTIES
    CARD_RUNTIME_EXCEPTION <: RUNTIME_EXCEPTION &
    CARD_EXCEPTION <: EXCEPTION &
    ISO_EXCEPTION <: CARD_RUNTIME_EXCEPTION &
    PIN_EXCEPTION <: CARD_RUNTIME_EXCEPTION &
    SYSTEM_EXCEPTION <: CARD_RUNTIME_EXCEPTION &
    TRANSACTION_EXCEPTION <: CARD_RUNTIME_EXCEPTION &
    USER_EXCEPTION <: EXCEPTION &
    APDU_EXCEPTION <: CARD_RUNTIME_EXCEPTION &
    AID <: OBJECT &
    OWNER_PIN <: OBJECT

END
