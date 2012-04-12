/* Applet - must be extended by any applet that is intended to be loaded onto, 
 * installed into and executed on a Java Card technology-compliant smart card.
 * Author: simone
 * Creation date: 07/06/11
 *
 * Extraído em parte de LibsBSmart
 */
MACHINE
    Applet
    
/*ATENTION This class extends Object (java.lang.Object)*/
SEES
    Object,
    javacardFrameworkClasses,
   
	JByte,
	JShort,
	Shareable,
	Classes,
	ApduSetsAndConstants

OPERATIONS
    
    /* constructor not modelled */
    
    
    /* Called by the JCRE to inform that this currently selected applet is
    being deselected on this logical channel and no applet from the same
    package is still active on any other logical channel. 
    The default implementation of this method provided by Applet class does 
    nothing. */
    	deselect =
	BEGIN
		skip
	END;


	/* Called by the JCRE to obtain a shareable interface object from this
	server applet, on behalf of a request from a client applet. */

	interface <-- getShareableInterfaceObject(clientAID, parameter) = 
	PRE
		/* the AID object of the client applet*/
		clientAID : AID &
		
		/* optional parameter byte. The parameter byte may be used by the
		client to specify which shareable interface object is being
		requested. */
		parameter : JBYTE
	THEN
	    interface :: SHAREABLE
	END;


	/* Called by the JCRE to create an instance of the Applet subclass */
	install(bArray, bOffset, bLength) = 
	/* throws: ISOException */
	PRE
	    /* the array containing installation parameters */
	    bArray : seq(JBYTE) &
	    
	    /* the starting offset in bArray */
	    bOffset : JSHORT &
	    bOffset >= 0 &
		
	    /* the length in bytes of the parameter data in bArray.*/
	    /* The maximum value of 'bLength' is 127*/
	    bLength : JBYTE &
	    bLength >= 0 & 
	    bLength <= 127 


	THEN
	    skip
	   /* ISOException if the install method fails */
	END;

	/* Called by the JCRE to process an incoming APDU command. */	

	process(apdu) = 
	/* throws: ISOException */
	PRE
		apdu : APDU
		/* ISOException with the response bytes per ISO 7816-4*/
	THEN
		skip
	END;

	res <-- select = 
		CHOICE
			res := FALSE
		OR
			res := TRUE
		END;
	

	register_1 = /*SystemException*/
	/*SystemException.ILLEGAL_AID if the Applet subclass AID bytes are in use or if the applet instance has previously successfully registered with the Java Card runtime environment via one of the register() methods or if a Java Card runtime environment initiated install() method execution is not in progress*/
	BEGIN
		skip
	END;
          
	register_2 (bArray, bOffset, bLength) = /*SystemException*/
	PRE
		bArray : seq(JBYTE) &
		bOffset : JSHORT &
		bOffset >= 0 & 
		bLength : JBYTE &
		bLength >= 5 & /*SystemException.ILLEGAL_VALUE if the 'bLength' parameter is less than 5*/
		bLength <= 16 /*SystemException.ILLEGAL_VALUE if the 'bLength' parameter is greater than 16*/

		/*SystemException.ILLEGAL_AID if the specified instance AID bytes are in use or if the applet instance has previously successfully registered with the Java Card runtime environment via one of the register() methods or if a Java Card runtime environment-initiated install() method execution is not in progress*/
	THEN
		skip
	END;
	
	res <-- selectingApplet = 
		CHOICE		
			res := FALSE
		OR
			res := TRUE
		END

END
