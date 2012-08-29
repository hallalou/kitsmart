/* javacardxExternalClasses - models a simulation of the class hierarchy of the
 * javacardx.external package in B 
 * !! IMPORTANT: This machine MUST be SEEN by any module that references 
 * the types corresponding to these classes !!
 * Author: simone
 * Creation date: Tue Ago 28 2012
 */
MACHINE
    javacardxExternalClasses
    
SEES
	javaLangClasses,
	javacardFrameworkClasses

CONSTANTS /* to be able to refer to JC API classes and interfaces to type data */
	MEMORY_ACCESS,
	EXTERNAL_EXCEPTION
    
PROPERTIES
	MEMORY_ACCESS <: CLASS_TYPE &
	EXTERNAL_EXCEPTION <: CARD_RUNTIME_EXCEPTION
	
END
