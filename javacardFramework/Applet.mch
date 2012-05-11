/* Applet - must be extended by any applet that is intended to be loaded onto, 
 * installed into and executed on a Java Card technology-compliant smart card.
 * Author: simone, Anamaria
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
    Shareable /* only for documentation, as the CONSTANT SHAREABLE is declared in 
	javacardFrameworkClasses */
    /* ApduSetsAndConstants */

OPERATIONS
    
    /* applet constructor not modelled */
    
    
    /* Called by the JCRE to inform that this currently selected applet is
    being deselected on this logical channel and no applet from the same
    package is still active on any other logical channel. 
    The default implementation of this method provided by Applet class does 
    nothing. */
    
	deselect =
	BEGIN
		skip
	END;

/*------------------------------------------------------------------------------*/
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

/*------------------------------------------------------------------------------*/
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

	/* Installation parameters are supplied in the byte array parameter
	and must be in a format using length-value (LV) pairs as de?ned below: 

	bArray[bOffset] = length(Li) of instance AID, 
	bArray[bOffset+1..bOffset+Li] = instance AID bytes, 
	bArray[bOffset+Li+1] = length(Lc) of control info,
	bArray[bOffset+Li+2..bOffset+Li+Lc+1] = control info, 
	bArray[bOffset+Li+Lc+2] = length(La) of applet data, 
	bArray[bOffset+Li+Lc+3..bOffset+Li+Lc+La+2] = applet data 

	In the above format, any of the lengths: Li, Lc or La may be zero. 	
	The control information is implementation dependent. */

	THEN
	    skip
	   /* ISOException if the install method fails */
	END;

/*------------------------------------------------------------------------------*/
	/* Called by the JCRE to process an incoming APDU command. */	
	process(apdu) = 
	/* throws: ISOException */
	PRE
		apdu : APDU
		/* ISOException with the response bytes per ISO 7816-4*/
	THEN
		skip
	END;
	
/*------------------------------------------------------------------------------*/
	/* used by the applet to register this applet instance with the JCRE
	* and to assign the Java Card platform name of the applet as its
	* instance AID bytes. */
	register_1 = 
	/* throws: SystemException */
	/* SystemException.ILLEGAL_AID if the Applet subclass AID bytes are in
	 * use or if the applet instance has previously successfully registered
	 * with the JCRE or if a JCRE initiated install() method execution is
	 * not in progress. 
	 */
	BEGIN
		skip
	END;

/*------------------------------------------------------------------------------*/          
	/* used by the applet to register this applet instance with the JCRE
	* and to assign the Java Card platform name of the applet as its
	* instance AID bytes. */
	register_2 (bArray, bOffset, bLength) = 
	/* throws: SystemException */

	PRE
	    /* the byte array containing the AID bytes */
	    bArray : seq(JBYTE) &
	    
	    /* the start of AID bytes in bArray */
	    bOffset : JSHORT &
	    bOffset >= 0 & 
		
	   /* the length of the AID bytes in bArray */
	   /* SystemException.ILLEGAL_VALUE if 'bLength' is less than 5*/
	   /* SystemException.ILLEGAL_VALUE if 'bLength' is greater than 16*/
	    bLength : JBYTE &
	    bLength >= 5 & 
	    bLength <= 16 
	    
	/* SystemException.ILLEGAL_AID if the Applet subclass AID bytes are in
	 * use or if the applet instance has previously successfully registered
	 * with the JCRE or if a JCRE initiated install() method execution is
	 * not in progress. 
	 */
	THEN
		skip
	END;
	
/*------------------------------------------------------------------------------*/	
	/* Called by the JCRE to inform this applet that it has been selected  	
	when no applet from the same package is active on any other logical 
	channel. */
	res <-- select = 
		CHOICE
		    res := TRUE     /* success */
		OR
		    res := FALSE    /* tells the JCRE that this Applet declines 	
		    				to be selected.*/
		END;

/*------------------------------------------------------------------------------*/		
	/* used by the applet process() method to distinguish the SELECT APDU
	command which selected this applet, from all other SELECT APDU 	
	commands which may relate to ?le or internal applet state selection. */
	res <-- selectingApplet = 
		CHOICE		
			res := FALSE
		OR
			res := TRUE /* if this applet is being selected */
		END

END
