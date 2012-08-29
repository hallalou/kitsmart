/* javacardxFrameworkMathClasses - models a simulation of the class hierarchy of the
 * java.framework.service package in B 
 * !! IMPORTANT: This machine MUST be SEEN by any module that references 
 * the types corresponding to these classes !!
 * Author: simone
 * Creation date: Tue Ago 24 2012
 */
MACHINE
    javacardxFrameworkMathClasses
    
SEES
	javaLangClasses

CONSTANTS /* to be able to refer to JC API classes and interfaces to type data */
	BIG_NUMBER
    
PROPERTIES
	BIG_NUMBER <: OBJECT
	
END
