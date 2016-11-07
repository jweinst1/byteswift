#byteswift

##Usage

Byte swift is a small swift package to facilitate dealing with UInt8 numbers in swift. One big advantage of using bytes is that are much faster to handle due totheir
smaller size.

###Data Structures

byteswift contains three data structures, the bytelist, the bytemap, and the bytetree. The byte list stores a list of bytes but only allows indexing from 0 to 255, the range of values of an unsigned 8 bit integer.

The ByteTree, is a tree of byte lists that operate as nodes, where each node holds one byte, and a series of child nodes. It's implemented a struct to be more lightweight that a class counterpart.
