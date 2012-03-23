/* Object
 * Author: simone
 * Creation date: 27/08/11
 */
MACHINE
    Object

SEES
    /* to be able to reference the type OBJECT */
    ObjectSet

OPERATIONS
    /* equals compares the object received in parameter with the current objet, and should return TRUE only if they are the same. With the current modeling we don't have this information. Here, we only model the two possible return values.*/
    
    /* IMPORTANT: this operation is PROMOTED in every machine that extends Object, but any machine that wants to use it must explicitly SEE machine ObjectSet */
    
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
