/* javacardFrameworkServiceClasses - models a simulation of the class hierarchy of the
 * java.framework.service package in B 
 * !! IMPORTANT: This machine MUST be SEEN by any module that references 
 * the types corresponding to these classes !!
 * Author: simone
 * Creation date: Tue Ago 24 2012
 */
MACHINE
    javacardFrameworkServiceClasses
    
SEES
	javacardFrameworkClasses,
    javaLangClasses

CONSTANTS /* to be able to refer to JC API classes and interfaces to type data */
	SERVICE,
	SERVICE_EXCEPTION
    
PROPERTIES
	SERVICE <: CLASS_TYPE &
	SERVICE_EXCEPTION <: CARD_RUNTIME_EXCEPTION
	
END
