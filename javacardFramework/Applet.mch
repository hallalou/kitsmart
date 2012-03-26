/* Applet
 * Author: simone
 * Creation date: 07/06/11
 *
 * Extraído em parte de LibsBSmart
 */
MACHINE
    Applet
    
/*ATENTION This class extends Object (java.lang.Object)*/
EXTENDS
	Object    
    
SEES
	JByte,
	JShort,
	Shareable,
	Classes,
	ApduSetsAndConstants

OPERATIONS
	install(bArray, bOffset, bLength) = /*ISOException*/
	PRE
		bArray : seq(JBYTE) &
		bOffset : JSHORT &
		bOffset >= 0 &
		bLength : JBYTE &
		bLength >= 0 & 
		bLength <= 127 /*The maximum value of 'bLength' is 127*/

		/*ISOException if the install method failed*/
	THEN
		skip
	END;

/* An abstract method - how to treat then ? promotes in the calling Java Card method ?
 * Called by the Java Card runtime environment to process an incoming APDU command.
 *
abstract  void 	process(APDU apdu)*/

	process(apdu) = /*ISOException*/
	PRE
		apdu : APDU
		/*ISOException with the response bytes per ISO 7816-4*/
	THEN
		skip
	END;

	res <-- select = 
		CHOICE
			res := FALSE
		OR
			res := TRUE
		END;
	
	deselect =
	BEGIN
		skip
	END;

	interface <-- getShareableInterfaceObject(clientAID, parameter) = 
	/*
 	Shareable 	getShareableInterfaceObject(AID clientAID, byte parameter)
        Called by the Java Card runtime environment to obtain a shareable interface object from this server applet, on behalf of a request from a client applet.*/
	PRE
		/*clientAID's type is AID*/
		clientAID : seq(JBYTE) &
		parameter : JBYTE
	THEN
	    CHOICE
			interface := rec(object : SHAREABLEobject , null : FALSE)
		OR
			ANY vv WHERE vv : CLASSES
			THEN
				interface := rec(object : vv, null : TRUE)
			END 
		END
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
