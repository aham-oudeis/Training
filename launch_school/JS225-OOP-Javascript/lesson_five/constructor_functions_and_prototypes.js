//'use strict';

/*
let a = 1;
let foo;
let obj;

function Foo() {
  this.a = 2;
  this.bar = function() {
    console.log(this.a);
  };

  //the following line executes the function bar just defined on the object
  //hence, it logs the value stored in the property a
  this.bar();
}
//creates a new object that is an instance of Foo type. foo's prototype is
//set to Foo.prototype
//also, logs 2, since the value of `this.a` inside the bar function returns 2
foo = new Foo();

//logs 2 again
foo.bar();

//value of this is the global object and the value of a is set to 2
//then a bar method is defined on the global object
//when the bar method is called on the global object, it logs 2
Foo();

//a new object is created and the Foo method is called with the value of `this`
//set to the new object
//hence, the bar method does the same; it logs 2
obj = {};
Foo.call(obj);
obj.bar();

//logs 2 because the value of a is reassigned when Foo is called as a function
//if the file is run using node, then line 28 only passes in an empty object and
//that object as a value of this and that object is different from the this
//accessible in the main scope; hence, it returns undefined
console.log(this.a);

//creates an object with methods
let RECTANGLE = {
  area() {
    return this.width * this.height;
  },
  perimeter() {
    return 2 * (this.width + this.height);
  },
};

function Rectangle(width, height) {
  this.width = width;
  this.height = height;

  //the following code calls the method instead of merely referencing the function
  //hence, both area and perimeter properties are set to NaN
  //to fix it, we can remove the parentheses: this.area = RECTANGLE.area;
  //that way when we need to find the area we can simply call the function
  this.area = RECTANGLE.area();
  this.perimeter = RECTANGLE.perimeter();
}

//rect1 is initialzied to the new object created from
let rect1 = new Rectangle(2, 3);

//logs NaN
console.log(rect1.area);
console.log(rect1.perimeter);

function Circle(radius) {
  this.radius = radius;
  this.area = function() {
    return Math.PI * Math.pow(this.radius, 2);
  };
}

let a = new Circle(3);
let b = new Circle(4);

console.log(a.area().toFixed(2));
console.log(b.area().toFixed(2));



let ninja;
function Ninja() {
  this.swung = true;
}

//a new Ninja object is created and stored in the variable ninja
//this ninja inherits from the object that Ninja.prototype points to
ninja = new Ninja();

//now a new property swingSword is added to the prototype of ninja
//that is, this method is available to the object referenced by ninja
Ninja.prototype.swingSword = function() {
  return this.swung;
};

//logs true, because this inside the method swingSword points to the ninja object
//because the method is called on the ninja object
//hence, this.swung returns true, bc the value of swung is set to true when the
//ninja object is created on line 95
console.log(ninja.swingSword());
*/

let ninja;
function Ninja() {
  this.swung = true;
}

ninja = new Ninja();


//things are slightly different here: the Ninja.prototype property no longer
//references the same object; rather, it points to a different object
//but the [[Prototype]] property of ninja object still references the previous
//object referenced by Ninja.prototype
//Hence, the prototype of ninja is not the new object and thus the methods defined
//in the new object are not available to the ninja object
//but they will be available to objects that are created afterwards
Ninja.prototype = {
  swingSword: function() {
    return this.swung;
  },
};


//since ninja does not have the property swingSword, it returns undefined
//trying to call undefined as a method throws an error
console.log(ninja.swingSword());
