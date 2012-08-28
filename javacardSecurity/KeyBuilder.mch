/* KeyBuilder
 *
 * The KeyBuilder class is a key object factory.
 *
 * Author: simone
 * Creation date: 23/03/11
 */
MACHINE
    KeyBuilder

SEES
 JByte,
 JShort,
 JBoolean

/*This class extends java.lang.Object */
EXTENDS
	Object

CONCRETE_CONSTANTS
 LENGTH_AES_128,
 LENGTH_AES_192,
 LENGTH_AES_256,
 LENGTH_DES,
 LENGTH_DES3_2KEY,
 LENGTH_DES3_3KEY,
 LENGTH_DSA_1024,
 LENGTH_DSA_512,
 LENGTH_DSA_768,
 LENGTH_EC_F2M_113,
 LENGTH_EC_F2M_131,
 LENGTH_EC_F2M_163,
 LENGTH_EC_F2M_193,
 LENGTH_EC_FP_112,
 LENGTH_EC_FP_128,
 LENGTH_EC_FP_160,
 LENGTH_EC_FP_192,
 LENGTH_RSA_1024,
 LENGTH_RSA_1280,
 LENGTH_RSA_1536,
 LENGTH_RSA_1984,
 LENGTH_RSA_2048,
 LENGTH_RSA_512,
 LENGTH_RSA_736,
 LENGTH_RSA_768,
 LENGTH_RSA_896,
 TYPE_AES,
 TYPE_AES_TRANSIENT_DESELECT,
 TYPE_AES_TRANSIENT_RESET,
 TYPE_DES,
 TYPE_DES_TRANSIENT_DESELECT,
 TYPE_DES_TRANSIENT_RESET,
 TYPE_DSA_PRIVATE,
 TYPE_DSA_PUBLIC,
 TYPE_EC_F2M_PRIVATE,
 TYPE_EC_F2M_PUBLIC,
 TYPE_EC_FP_PRIVATE,
 TYPE_EC_FP_PUBLIC,
 TYPE_RSA_CRT_PRIVATE,
 TYPE_RSA_PRIVATE,
 TYPE_RSA_PUBLIC
 

PROPERTIES
 LENGTH_AES_128 : JSHORT &
 LENGTH_AES_128 = 128 &
 
 LENGTH_AES_192 : JSHORT &
 LENGTH_AES_192 = 192 &
 
 LENGTH_AES_256 : JSHORT &
 LENGTH_AES_256 = 256 &
 
 LENGTH_DES : JSHORT &
 LENGTH_DES = 64 &
 
 LENGTH_DES3_2KEY : JSHORT &
 LENGTH_DES3_2KEY = 128 &
 
 LENGTH_DES3_3KEY : JSHORT &
 LENGTH_DES3_3KEY = 192 &
 
 LENGTH_DSA_1024 : JSHORT &
 LENGTH_DSA_1024 = 1024 &
 
 LENGTH_DSA_512 : JSHORT &
 LENGTH_DSA_512 = 512 &
 
 LENGTH_DSA_768 : JSHORT &
 LENGTH_DSA_768 = 768 &
 
 LENGTH_EC_F2M_113 : JSHORT &
 LENGTH_EC_F2M_113 = 113 &
 
 LENGTH_EC_F2M_131 : JSHORT &
 LENGTH_EC_F2M_131 = 131 &
 
 LENGTH_EC_F2M_163 : JSHORT &
 LENGTH_EC_F2M_163 = 163 &
 
 LENGTH_EC_F2M_193 : JSHORT &
 LENGTH_EC_F2M_193 = 193 &
 
 LENGTH_EC_FP_112 : JSHORT &
 LENGTH_EC_FP_112 = 112 &
 
 LENGTH_EC_FP_128 : JSHORT &
 LENGTH_EC_FP_128 = 128 &
 
 LENGTH_EC_FP_160 : JSHORT &
 LENGTH_EC_FP_160 = 160 &
 
 LENGTH_EC_FP_192 : JSHORT &
 LENGTH_EC_FP_192 = 192 &
 
 LENGTH_RSA_1024 : JSHORT &
 LENGTH_RSA_1024 = 1024 &
 
 LENGTH_RSA_1280 : JSHORT &
 LENGTH_RSA_1280 = 1280 &
 
 LENGTH_RSA_1536 : JSHORT &
 LENGTH_RSA_1536 = 1536 &
 
 LENGTH_RSA_1984 : JSHORT &
 LENGTH_RSA_1984 = 1984&
 
 LENGTH_RSA_2048 : JSHORT &
 LENGTH_RSA_2048 = 2048 &
 
 LENGTH_RSA_512 : JSHORT &
 LENGTH_RSA_512 = 512 &
 
 LENGTH_RSA_736 : JSHORT &
 LENGTH_RSA_736 = 736 &
 
 LENGTH_RSA_768 : JSHORT &
 LENGTH_RSA_768 = 768 &
 
 LENGTH_RSA_896 : JSHORT &
 LENGTH_RSA_896 = 896 &
 
 TYPE_AES : JBYTE &
 TYPE_AES = 15 &
 
 TYPE_AES_TRANSIENT_DESELECT : JBYTE &
 TYPE_AES_TRANSIENT_DESELECT = 14 &
 
 TYPE_AES_TRANSIENT_RESET : JBYTE &
 TYPE_AES_TRANSIENT_RESET = 13 &
 
 TYPE_DES : JBYTE &
 TYPE_DES = 3 &
 
 TYPE_DES_TRANSIENT_DESELECT : JBYTE &
 TYPE_DES_TRANSIENT_DESELECT = 2 &
 
 TYPE_DES_TRANSIENT_RESET : JBYTE &
 TYPE_DES_TRANSIENT_RESET = 1 &
 
 TYPE_DSA_PRIVATE : JBYTE &
 TYPE_DSA_PRIVATE = 8 &
 
 TYPE_DSA_PUBLIC : JBYTE &
 TYPE_DSA_PUBLIC = 7 &
 
 TYPE_EC_F2M_PRIVATE : JBYTE &
 TYPE_EC_F2M_PRIVATE = 10 &
 
 TYPE_EC_F2M_PUBLIC : JBYTE &
 TYPE_EC_F2M_PUBLIC = 9 &
 
 TYPE_EC_FP_PRIVATE : JBYTE &
 TYPE_EC_FP_PRIVATE = 12 &
 
 TYPE_EC_FP_PUBLIC : JBYTE &
 TYPE_EC_FP_PUBLIC = 11 &
 
 TYPE_RSA_CRT_PRIVATE : JBYTE &
 TYPE_RSA_CRT_PRIVATE = 6 &
 
 TYPE_RSA_PRIVATE : JBYTE &
 TYPE_RSA_PRIVATE = 5 &
 
 TYPE_RSA_PUBLIC : JBYTE &
 TYPE_RSA_PUBLIC = 4

OPERATIONS
	result <-- buildKey(keyType, keyLength, keyEncryption)=
	/* throws CryptoException */
	PRE
		/* keyType - the type of key to be generated. Valid codes listed in TYPE_* constants. */
		keyType : JBYTE &
		(keyType = TYPE_AES or
 		keyType = TYPE_AES_TRANSIENT_DESELECT or
 		keyType = TYPE_AES_TRANSIENT_RESET or
 		keyType = TYPE_DES or
 		keyType = TYPE_DES_TRANSIENT_DESELECT or
 		keyType = TYPE_DES_TRANSIENT_RESET or
 		keyType = TYPE_DSA_PRIVATE or
 		keyType = TYPE_DSA_PUBLIC or
 		keyType = TYPE_EC_F2M_PRIVATE or
 		keyType = TYPE_EC_F2M_PUBLIC or
 		keyType = TYPE_EC_FP_PRIVATE or
 		keyType = TYPE_EC_FP_PUBLIC or
 		keyType = TYPE_RSA_CRT_PRIVATE or
 		keyType = TYPE_RSA_PRIVATE or
 		keyType = TYPE_RSA_PUBLIC) &
		
		/* keyLength - the key size in bits. The valid key bit lengths are key type dependent. 
		Some common key lengths are listed above above in the LENGTH_* constants. */
		keyLength : JSHORT &
		(keyLength = LENGTH_AES_128 or
 		keyLength = LENGTH_AES_192 or
 		keyLength = LENGTH_AES_256 or
 		keyLength = LENGTH_DES or
 		keyLength = LENGTH_DES3_2KEY or
 		keyLength = LENGTH_DES3_3KEY or
 		keyLength = LENGTH_DSA_1024 or
 		keyLength = LENGTH_DSA_512 or
 		keyLength = LENGTH_DSA_768 or
 		keyLength = LENGTH_EC_F2M_113 or
 		keyLength = LENGTH_EC_F2M_131 or
 		keyLength = LENGTH_EC_F2M_163 or
 		keyLength = LENGTH_EC_F2M_193 or
 		keyLength = LENGTH_EC_FP_112 or
 		keyLength = LENGTH_EC_FP_128 or
 		keyLength = LENGTH_EC_FP_160 or
 		keyLength = LENGTH_EC_FP_192 or
 		keyLength = LENGTH_RSA_1024 or
 		keyLength = LENGTH_RSA_1280 or
 		keyLength = LENGTH_RSA_1536 or
 		keyLength = LENGTH_RSA_1984 or
 		keyLength = LENGTH_RSA_2048 or
 		keyLength = LENGTH_RSA_512 or
 		keyLength = LENGTH_RSA_736 or
 		keyLength = LENGTH_RSA_768 or
 		keyLength = LENGTH_RSA_896) &
		
		/* keyEncryption - if true this boolean requests a key implementation which implements 
		the javacardx.crypto.KeyEncryption interface. The key implementation returned may 
		implement the javacardx.crypto.KeyEncryption interface even when this parameter is false. */
		keyEncryption : JBOOLEAN

		/* CryptoException if the requested algorithm associated with the specified type, 
		size of key and key encryption interface is not supported */
		
	THEN
		/*the key object instance of the requested key type, length and encrypted access*/
		ANY keybuilder_result
		WHERE (keybuilder_result : JSHORT) & 
		(keybuilder_result = TYPE_AES or
 		keybuilder_result = TYPE_AES_TRANSIENT_DESELECT or
 		keybuilder_result = TYPE_AES_TRANSIENT_RESET or
 		keybuilder_result = TYPE_DES or
 		keybuilder_result = TYPE_DES_TRANSIENT_DESELECT or
 		keybuilder_result = TYPE_DES_TRANSIENT_RESET or
 		keybuilder_result = TYPE_DSA_PRIVATE or
 		keybuilder_result = TYPE_DSA_PUBLIC or
 		keybuilder_result = TYPE_EC_F2M_PRIVATE or
 		keybuilder_result = TYPE_EC_F2M_PUBLIC or
 		keybuilder_result = TYPE_EC_FP_PRIVATE or
 		keybuilder_result = TYPE_EC_FP_PUBLIC or
 		keybuilder_result = TYPE_RSA_CRT_PRIVATE or
 		keybuilder_result = TYPE_RSA_PRIVATE or
 		keybuilder_result = TYPE_RSA_PUBLIC or
		keybuilder_result = LENGTH_AES_128 or
 		keybuilder_result = LENGTH_AES_192 or
 		keybuilder_result = LENGTH_AES_256 or
 		keybuilder_result = LENGTH_DES or
 		keybuilder_result = LENGTH_DES3_2KEY or
 		keybuilder_result = LENGTH_DES3_3KEY or
 		keybuilder_result = LENGTH_DSA_1024 or
 		keybuilder_result = LENGTH_DSA_512 or
 		keybuilder_result = LENGTH_DSA_768 or
 		keybuilder_result = LENGTH_EC_F2M_113 or
 		keybuilder_result = LENGTH_EC_F2M_131 or
 		keybuilder_result = LENGTH_EC_F2M_163 or
 		keybuilder_result = LENGTH_EC_F2M_193 or
 		keybuilder_result = LENGTH_EC_FP_112 or
 		keybuilder_result = LENGTH_EC_FP_128 or
 		keybuilder_result = LENGTH_EC_FP_160 or
 		keybuilder_result = LENGTH_EC_FP_192 or
 		keybuilder_result = LENGTH_RSA_1024 or
 		keybuilder_result = LENGTH_RSA_1280 or
 		keybuilder_result = LENGTH_RSA_1536 or
 		keybuilder_result = LENGTH_RSA_1984 or
 		keybuilder_result = LENGTH_RSA_2048 or
 		keybuilder_result = LENGTH_RSA_512 or
 		keybuilder_result = LENGTH_RSA_736 or
 		keybuilder_result = LENGTH_RSA_768 or
 		keybuilder_result = LENGTH_RSA_896)
		THEN result := keybuilder_result
		END
	END
END
