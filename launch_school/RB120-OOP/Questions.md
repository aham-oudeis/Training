Questions

1. Is there such a thing as a method look up path for class methods? (There is one for Constants.)

   I would think that the method look up path for class methods is the same as the one for instance methods.

2. Why is setter methods is to be preferred over instance variables when it comes to changing the value?

   > We say that calling the setter method, if available, is safer since  using the instance variable bypasses any checks or operations performed  by the setter. For instance, consider what would happen if our setter  method looked like this:
   >
   > ```
   > def mileage=(miles)
   >   @mileage = miles.to_i
   > end
   > ```
   >
   > When you use the setter method elsewhere in your class, you're guaranteed that it will try to apply `#to_i` to the value. If you don't use the setter, you may set the mileage to a string value.

3. Why should class methods (with self) not be in modules?

   In regards to having a `self.drive` method inside a `Drivable` module:

   > Methods in mixin modules should be defined without using `self.` in the definition. If you add `self.` to the definition, the including class will only be able to access the method by calling `Drivable.drive`; furthermore, the method will not be available at all as an instance method to objects.

   The way the instance methods are included in a class is different from how the class methods are included. Although there are some compliicated ways of including the class methods from a module, right now it's not necessary to dive into them. 

4. When to use a module instead of a superclass?

   > However, if you recall from the OOP book, [modules are more appropriate in a has-a relationship](https://launchschool.com/books/oo_ruby/read/inheritance#inheritancevsmodules). While it is sometimes tricky to choose one or the other, a great  guideline is to decide if you want some additional functionality, or if  you want to extend the abilities of the class. In this case, it is  pretty clear that we need the functionality of walking; we don't need to extend the abilities of class `Person`(extending the abilities of a class coincides with an is-a relationship, not has-a).

5. 