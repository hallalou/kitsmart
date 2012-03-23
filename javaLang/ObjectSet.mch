/* ObjectSet - models a simulation of abstract objects in B 
 * !! IMPORTANT: This machine MUST be SEEN by any module that makes reference 
 * to the type Object !!
 * Author: Anamaria
 * Creation date: Fri Mar 23 2012
 */
MACHINE
    ObjectSet
     
SETS
     OBJECT
    
END

/* outra opção a ser estudada

CONSTANTS
    *//* the set of object references *//*
	OBJECT
	
PROPERTIES
    *//* object references are modeled by new = TRUE, to indicate that an object is allocated, and null = TRUE, to indicate a null reference. Both cannot be TRUE simultanously. This is not yet modeld and  this is not yet good.*//*    
    OBJECT = struct(new : BOOL, null : BOOL) 
    
   */