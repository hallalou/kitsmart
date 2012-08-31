/* javacardxFrameworkTlvClasses - models a simulation of the class hierarchy of the
 * javacardx.framework.tlv package in B 
 * !! IMPORTANT: This machine MUST be SEEN by any module that references 
 * the types corresponding to these classes !!
 * Author: simone
 * Creation date: Thu Ago 30 2012
 */
MACHINE
    javacardxFrameworkTlvClasses
    
SEES
	javaLangClasses

CONSTANTS /* to be able to refer to JC API classes and interfaces to type data */
	BERTAG,
	BERTLV,
	CONSTRUCTED_BERTAG,
	CONSTRUCTED_BERTLV,
    PRIMITIVE_BERTAG
	
PROPERTIES
	BERTAG <: OBJECT &
	BERTLV <: OBJECT &
	CONSTRUCTED_BERTAG <: BERTAG &
	CONSTRUCTED_BERTLV <: BERTLV &
	PRIMITIVE_BERTAG <: BERTAG
	
END
