/* Memory
 * Author: simone
 * Creation date: 31/08/11
 */
MACHINE
    Memory

SEES
	javacardxExternalClasses,
	JByte,
	JShort

/*This class extends java.lang.Object */
EXTENDS
	Object

CONSTANTS

 MEMORY_TYPE_MIFARE,
 MEMORY_TYPE_EXTENDED_STORE

PROPERTIES

	MEMORY_TYPE_MIFARE : JBYTE &
	MEMORY_TYPE_MIFARE = 1 &
	
	MEMORY_TYPE_EXTENDED_STORE : JBYTE &
	MEMORY_TYPE_EXTENDED_STORE = 2

OPERATIONS
	memoryAccess <-- getMemoryAccessInstance(memoryType, memorySize, memorySizeOffset) = 
	/* THROWS: ExternalException */
	PRE
		/* memoryType - the desired external memory subsystem. 
		Valid codes listed in MEMORY_TYPE_* constants */
		memoryType : JBYTE &
		(memoryType = MEMORY_TYPE_MIFARE or
		memoryType = MEMORY_TYPE_EXTENDED_STORE) &
		
		/* memorySize - the array containing the desired size in bytes, if applicable, 
		in the external memory subsystem. Check the descriptions of the MEMORY_TYPE_* constants 
		above for more details. The 32 bit number representing the memory size in bytes is 
		formed by concatenating the two short values at offset memorySizeOffset 
		(most significant 16 bits) and memorySizeOffset+1 (least significant 16 bits) in this 
		array */
		memorySize : seq(JSHORT) &
		
		/* memorySizeOffset - the offset within the memorySize array where the 32 bit memory size number in bytes is specified */
		memorySizeOffset : JSHORT &
		memorySizeOffset >= 0

		/* ExternalException.NO_SUCH_SUBSYSTEM if the requested memory subsystem is not available */
		/* ExternalException.INVALID_PARAM if the memorySize parameter is invalid */
	THEN
		/* Returns: the MemoryAccess object instance of the requested memory subsystem */
		ANY memory_memoryAccess
		WHERE (memory_memoryAccess : MEMORY_ACCESS)
		THEN memoryAccess := memory_memoryAccess
		END
	END
END
