/* javacardRmiClasses - models a simulation of the class hierarchy of the
 * javacardx.biometry package in B 
 * !! IMPORTANT: This machine MUST be SEEN by any module that references 
 * the types corresponding to these classes !!
 * Author: simone
 * Creation date: Wed Mai 30 2012
 */
MACHINE
    javacardRmiClasses
    
SEES
    javaLangClasses,
	javaIOClasses

CONSTANTS /* to be able to refer to JC API classes and interfaces to type data */
	REMOTE,
	REMOTE_EXCEPTION
    
    
PROPERTIES
	REMOTE <: CLASS_TYPE & /* CLASS_TYPE is the root of the hierarchy of class 
								 and interfaces */
	REMOTE_EXCEPTION <: IO_EXCEPTION
END
