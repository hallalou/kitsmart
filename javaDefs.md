# Details #

Java Card Primitive types in B: JBoolean, JByte, JShort, JInt (optional in Java Card)

Extra specification: Int32 (probably will be removed)

Some guidelines on understanding the specs:

. the Java Card numeric types are all subsets of INTEGER in B:
> . JByte declares JBYTE, corresponding to Java Card byte (8 bits) numeric type,
> . JShort declares JSHORT, corresponding to Java Card short (16 bits) numeric type,
> . JInt declares JINT, corresponding to Java Card int (32 bits) numeric type.

. JBoolean declares JBOOLEAN as a new name for the B BOOL type.

. It is possible to use regular B arithmetic operators on INTEGERS on any B expression of the
Java Card "type" and B tools will accept this as they see values of the type INTEGER. However,
to make sure that verifications are done according to Java Card semantics of each operation, it
is important to use the more cumbersome but more precise corresponding functions defined on the
B machines. These functions are defined to produce non-specified values in case of overflow,
similarly to what happens in Java/Java Card.


