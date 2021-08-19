# what is polymorphism?
the ability of differrent kinds of objects to respond to the same method invocation

For instance: [1, "2", [3, 4], "hi "].map {|item| item *  2}

In this example, the array items are different objects: String, Integer, Array. But irrespective of what class they belong to, they all respond to the `*` method invocation with `2` passed in as an argument. They have radicallly different implementation. This is polymorophism.

# types of polymorophsm
-through inheritance: related types
-duck typing: unrelated types

A meaningful usage of polymorphism requires intentional design of the public interface so that various objects respond to the same method invocation.

# what are the benefits?
-avoid code duplication
-reduce dependencies
-more maintainable code

