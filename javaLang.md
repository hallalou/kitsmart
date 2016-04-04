# Details #

Auxiliary Specifications:

**javaLangClasses.mch: defines the abstract sets corresponding to each java.Lang class in Java Card
and their inclusion hierarchy. This machine must be SEEN by any machine which references one of its
types. To each java.Lang class defined type (e.g., object), a corresponding SET (OBJECT) is defined in
javaLangClasses. With this, if a method in a class receives a java "object" as parameter, the
corresponding B operation may require it to belong to set OBJECT. Class hierarchy is simulated by set
inclusion. For instance, the fact that every throwable is an object is reflected by the inclusion
THROWABLE <: OBJECT.**


Specification of the classes of java.lang:

**Object.mch: This class uses the type Object. This type is modeled as an abstract set (OBJECT) in javaLangClasses.**

**Throwable.mch
  * Exception.mch
    * RuntimeException.mch
      * ArithmeticException.mch
      * ArrayStoreException.mch
      * ClassCastException.mch
      * IndexOutOfBoundsException.mch
        * ArrayIndexOutOfBoundsException.mch
      * NegativeArraySizeException.mch
      * NullPointerException.mch
      * SecurityException.mch**
