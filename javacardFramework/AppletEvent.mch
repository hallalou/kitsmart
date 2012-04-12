/* AppletEvent - interface - a callback interface for the JCRE to inform 
 * the applet about life cycle events. An applet instance - subclass of 
 * Applet - should implement this interface if it needs to be informed 
 * about supported life cycle events.
 * Author: simone
 * Creation date: 23/04/11
 */
MACHINE
    AppletEvent

OPERATIONS
    
    /* called by the JCRE to inform this applet instance that the Applet
    Deletion Manager has been requested to delete it. */
	uninstall = skip

END
