/* MultiSelectable - interface  -  A multiselectable applet is a subclass of  
 * javacard.framework.Applet which directly or indirectly implements this 
 * interface. All of the applets within an applet package must be 
 * multiselectable. If they are not, then none of the applets can be 
 * multiselectable. 
 * Author: simone
 * Creation date: 23/04/11
 */
MACHINE
    MultiSelectable
    
SEES
    JBoolean

OPERATIONS
    
    /* called by the JCRE to inform that this applet instance has been
    selected while the same applet instance or another applet instance from
    the same package is active on another logical channel. */ 
    
    result <-- select(appInstAlreadyActive) = 
	PRE
	    /* true when the same applet instance is still active on
		 another logical channel and false otherwise */
	    appInstAlreadyActive : JBOOLEAN
	THEN
		CHOICE
			result := TRUE
		OR
			result := FALSE
		END
	END;
	
	/* called by the JCRE to inform that this currently selected applet
	instance is being deselected on this logical channel while the same
	applet instance or another applet instance from the same package is
	still active on another logical channel. */

	deselect(appInstStillActive) =
	PRE
	    /* true when the same applet instance is already active on
		 another logical channel and false otherwise */
		appInstStillActive : JBOOLEAN
	THEN
		skip
	END
END

