Objects can be thought of as a bundle of two kinds of things: properties and behaviors. We can have objects without any methods attached to them. In creating such objects, we are not relying on the prototypal pattern of JS, because the role of prototype is to delegate behaviors.

For ease of understanding, let's say that the objects without behaviors are called 'simple objects' and objects with behaviors are called 'complex objects'.

Hence, the discussion of 'object creation' can be thought of in two ways: creation of simple objects and creation of complex objects.

## Patterns of Object Creation
1. [Object Factories](/Function as Object Factories)
2. Constructor Function

## Patterns of Behavior Delegation (Prototypal)
It is all prototypal in JS, but the there are different kinds of patterns we can follow:
1.[ Pseudo-classical](/Pseudo Classical Pattern): When you make use of the protypal pattern with the constructor pattern, then you get pseudo-classical
2. [OLOO](/OLOO): When you make use of the protypal pattern without resorting to the constructor function, then you get OLOO pattern.