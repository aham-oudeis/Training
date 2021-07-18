### Collaborator Objects

> Objects that are stored as state within another object are also  called "collaborator objects". We call such objects collaborators  because they work in conjunction (or in collaboration) with the class  they are associated with. For instance, `bob` has a collaborator object stored in the `@pet` variable. When we need that `BullDog` object to perform some action (i.e. we want to access some behavior of `@pet`), then we can go through `bob` and call the method on the object stored in `@pet`, such as `speak` or `fetch`.
>
> When we work with collaborator objects, they are usually custom  objects (e.g. defined by the programmer and not inherited from the Ruby  core library); `@pet` is an example of a custom object. Yet, collaborator objects aren't strictly custom objects. Even the string object stored in `@name` within `bob` in the code above is technically a collaborator object.
>
> Collaborator objects play an important role in object oriented  design, since they also represent the connections between various actors in your program. __When working on an object oriented program be sure to  consider what collaborators your classes will have and if those  associations make sense, both from a technical standpoint and in terms  of modeling the problem your program aims to solve.__

Basically, when objects are stored as state of another objects, they are called 'collaborator objects'; since custom objects can be used a collaborator objects, they allow for a rather flexible design. 

Objects has a state and a set of available behaviors. State can itself be a set of objects stored in the instance variables. These objects that are stored in the instance variables can be of any class and are called collaborator objects.

Thinking about collaborator objects and their relationships with the encapsulating objects is very important to think through the execution of object oriented design.

> Summary
>
> When working with collaborator objects in your class, you may be working with strings, integers, arrays, hashes, or even custom objects.  Collaborator objects allow you to chop up and modularize the problem  domain into cohesive pieces; they are at the core of OO programming and  play an important role in modeling complicated problem domains.

