/* MultiSelectable
 * Author: simone
 * Creation date: 23/04/11
 */
MACHINE
    MultiSelectable
    
SEES
    JBoolean

OPERATIONS

	result <-- select(appInstAlreadyActive) = 
	PRE
	    appInstAlreadyActive : JBOOLEAN
	THEN
		CHOICE
			result := TRUE
		OR
			result := FALSE
		END
	END;

	deselect(appInstStillActive) =
	PRE
		appInstStillActive : JBOOLEAN
	THEN
		skip
	END
END
