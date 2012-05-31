/* javacardxCryptoClasses - models a simulation of the class hierarchy of the
 * javacardx.crypto package in B 
 * !! IMPORTANT: This machine MUST be SEEN by any module that references 
 * the types corresponding to these classes !!
 * Author: simone
 * Creation date: Wed Mai 30 2012
 */
MACHINE
    javacardxCryptoClasses
    
SEES
    javaLangClasses

CONSTANTS /* to be able to refer to JC API classes and interfaces to type data */
	CIPHER    
    
PROPERTIES
	CIPHER <: OBJECT

END
