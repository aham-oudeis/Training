// Question 1
const shape = {
  getType() {
    return this.type;
  }
};

function Triangle(a, b, c) {
  this.a = a;
  this.b = b;
  this.c = c;
  this.type = 'triangle';
}

Triangle.prototype = shape;
shape.constructor = Triangle;
Triangle.prototype.getPerimeter = function() {
  return this.a + this.b + this.c;
};

let t = new Triangle(3, 4, 5);
console.log(t.constructor);
console.log(shape.isPrototypeOf(t));
console.log(t.getPerimeter());
console.log(t.getType());

// Question 2
function User(first, last) {
  if (User.prototype.isPrototypeOf(this)) {
    this.first = first;
    this.last = last;
    this.name = first + ' ' + last;
  } else {
    return new User(first, last);
  }
}

let name = 'Jane Doe';
let user1 = new User('John', 'Doe');
let user2 = User('Mohan', 'Deer');

console.log(name);
console.log(user1.name);
console.log(user2.name);

//Question 3
function createObject(obj) {
  // the following is a rather slow solution
  //let minted = {};
  //Object.setPrototypeOf(minted, obj);
  //return minted;

  //faster solution
  function temp() {};
  temp.prototype = obj;

  let minted = new temp();
  return minted;
}

let foo = {
  a: 1
};

let bar = createObject(foo);
console.log(foo.isPrototypeOf(bar));

//Question 4
Object.prototype.begetObject = function() {
  function Temp() {};
  Temp.prototype = this;
  return new Temp();
}

let doo = {
  a: 1
}

let mar = doo.begetObject();
console.log(doo.isPrototypeOf(mar));

//Question 5
function neww(constructor, args) {
  let obj = Object.create(constructor.prototype);
  let result = constructor.apply(obj, args);

  return typeof result === 'object' ? result : obj;
}

function Person(firstName, lastName) {
  this.firstName = firstName;
  this.lastName = lastName;
}

Person.prototype.greeting = function() {
  console.log('Hello, ' + this.firstName + ' ' + this.lastName);
};

let john = neww(Person, ['John', 'Doe']);
john.greeting();
console.log(john.constructor);
