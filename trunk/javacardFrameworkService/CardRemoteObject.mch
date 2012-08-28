/* CardRemoteObject
 *
 * A convenient base class for remote objects for the Java Card platform. 
 * An instance of a subclass of this CardRemoteObject class will be exported 
 * automatically upon construction.
 *
 * Author: simone
 * Creation date: 27/08/11
 */
MACHINE
    CardRemoteObject

/* This class extends java.lang.Object and implements javacard.framework.service.Service */
EXTENDS
	Object

SEES
	JShort,
	javacardRmiClasses	

OPERATIONS
	export(obj) = 
	/* throws: SecurityException
			*/
	PRE
		/* obj - the remotely accessible object */
		obj : REMOTE

	/* SecurityException if the specified obj parameter is not owned by the caller context */
	/* SystemException.NO_RESOURCE if too many exported remote objects. All implementations 
	must support a minimum of 16 exported remote objects */
	
	THEN
		skip
	END;

/*------------------------------------------------------------------------------------------ */
	unexport(obj) = 
	/* throws: SecurityException
			*/
	PRE
		/* obj - the remotely accessible object */
		obj : REMOTE

	/* SecurityException if the specified obj parameter is not owned by the caller context */
	THEN
		skip
	END
	
END
