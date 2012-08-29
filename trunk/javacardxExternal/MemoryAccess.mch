/* MemoryAccess
 *
 * This interface provides methods to read and write the external memory space.
 *
 * Author: simone
 * Creation date: 31/08/11
 */
MACHINE
    MemoryAccess

SEES
	JShort,
	JByte

OPERATIONS
	result <-- writeData(src, src_off, src_blen, 
						auth_key, auth_key_off, 
						auth_key_blen, other_sector, other_block) = 
	/* throws: ExternalException */
	PRE
		/* src - the source data byte array */
		src : seq(JBYTE) &
		
		/* src_off - the byte offset into the src array where data begins */
		src_off : JSHORT &
		src_off >= 0 &
		
		/* src_blen - the byte length of the data to be written */
		src_blen : JSHORT &
		src_blen >= 0 &
		
		/* auth_key - the byte array containing the key(password) */
		auth_key : seq(JBYTE) &
		
		/* auth_key_off - the byte offset into the auth_key array where the key data begins */
		auth_key_off : JSHORT &
		auth_key_off >= 0 &
		
		/* auth_key_blen - the length in bytes of the key in the auth_key array */
		auth_key_blen : JSHORT &
		auth_key_blen >= 0 &
		
		/* other_sector - the external memory subsystem sector number */
		other_sector : JSHORT &
		
		/* other_block - the external memory subsystem block number */
		other_block : JSHORT

		/* ExternalException.INVALID_PARAM if any of the input parameters are invalid */
		/* ExternalException.INTERNAL_ERROR if an unrecoverable external memory access 
		error occurred */
		
	THEN
		CHOICE
			result := TRUE
		OR
			result := FALSE
		END
	END;

/*--------------------------------------------------------------------------------------------*/
	lengthByte <-- readData(dest, dest_off, auth_key, 
							auth_key_off, auth_key_blen, 
							other_sector, other_block, other_len) = 
	/* throws: ExternalException */
	PRE
		/* dest - the destination data byte array */
		dest : seq(JBYTE) &
		
		/* dest_off - the byte offset into the dest array where data should begin */
		dest_off : JSHORT &
		dest_off >= 0 &
		
		/* auth_key - the byte array containing the key(password) */
		auth_key : seq(JBYTE) &
		
		/* auth_key_off - the byte offset into the auth_key array where the key data begins */
		auth_key_off : JSHORT &
		auth_key_off >= 0 &
		
		/* auth_key_blen - the length in bytes of the key in the auth_key array */
		auth_key_blen : JSHORT &
		auth_key_blen >= 0 &
		
		/* other_sector - the other memory subsystem sector number */
		other_sector : JSHORT &
		
		/* other_block - the other memory subsystem block number */
		other_block : JSHORT &
		
		/* other_len - the number of bytes of memory to be read */
		other_len : JSHORT

		/* ExternalException.INVALID_PARAM if any of the input parameters are invalid*/
		/* ExternalException.INTERNAL_ERROR if an unrecoverable external memory access error 
		occurred */
	
	THEN
		ANY memoryaccess_lengthByte
		WHERE (memoryaccess_lengthByte : JSHORT) &
		(memoryaccess_lengthByte >= 0)
		THEN lengthByte := memoryaccess_lengthByte
		END
	END
END
