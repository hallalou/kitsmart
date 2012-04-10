/* TransactionException - an exception in the transaction subsystem. The 
 * methods referred to in this class are in the JCSystem class. The JCSystem
 * class and the transaction facility throw JCRE-owned instances of 
 * TransactionException. 
 * Author: simone
 * Creation date: 05/06/11
 * Not modeled in the current stateless model: the ?eld "reason" and the class 
 * constructor.   */
MACHINE
    TransactionException
    
/*This class extends javacard.framework.CardRuntimeException */
EXTENDS
    CardRuntimeException
    
SEES
    JShort
    
CONSTANTS
 IN_PROGRESS,
 NOT_IN_PROGRESS,
 BUFFER_FULL,
 INTERNAL_FAILURE

PROPERTIES
    
 /* a transaction is already in progress */
 IN_PROGRESS : JSHORT &
 IN_PROGRESS = 1 &
 
 /* a transaction is not in progress */
 NOT_IN_PROGRESS : JSHORT & 
 NOT_IN_PROGRESS = 2 &
 
 
 /* the commit buffer is full */
 BUFFER_FULL : JSHORT &
 BUFFER_FULL = 3 &
 
 /*  an internal Java Card runtime environment problem (fatal error) */
 INTERNAL_FAILURE : JSHORT &
 INTERNAL_FAILURE = 4
 

END
