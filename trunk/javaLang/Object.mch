/* Object
 * Author: simone, Anamaria
 * Creation date: 27/08/11
 */
MACHINE
    Object

SEES
    /* to be able to reference the type OBJECT */
    javaLangClasses

OPERATIONS
    /* equals compares the object received in parameter with the current objet, and should return TRUE only if they are the same. With the current modeling we don't have this information. Here, we only model the two possible return values.*/
    
    /* IMPORTANT: 
    If a machine extends Object, this operation is automatically PROMOTED in it, but if that machine wants to use equals, it must explicitly SEE machine ObjectSet. This automatic promotion however may generate a duplication problem. If this is the case, the solution is not to extend Object, but to INCLUDE or to SEE Object and promote or redefine (possibly with some renaming) the operation equals manually. */
    
	result <-- equals(obj) =
	PRE
		obj : OBJECT
	THEN
		CHOICE
			result := TRUE
		OR
			result := FALSE
		END
	END
END
