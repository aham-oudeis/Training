'use strict';

/*
function getDefiningObject(object, propKey) {
  if (object === null || object.hasOwnProperty(propKey)) {
    return object;
  } else {
    return getDefiningObject(Object.getPrototypeOf(object), propKey);
  }
}

let foo = {
  a: 1,
  b: 2,
};

let bar = Object.create(foo);
let baz = Object.create(bar);
let qux = Object.create(baz);

bar.c = 3;

console.log(getDefiningObject(qux, 'c') === bar);     // => true
console.log(getDefiningObject(qux, 'e'));             // => null
*/

/*
function shallowCopy(object) {
  let copy = Object.create(Object.getPrototypeOf(object));

  //Object.keys only returns the properties that are enumerable
  //if we want all properties, including the ones that are not enumerable
  //then we have to use Object.getOwnPropertyNames

  let keys = Object.keys(object);
  //let keys = Object.getOwnPropertyNames(object);

  for (let key of keys) {
    copy[key] = object[key];
  }

  return copy;
}

let foo = {
  a: 1,
  b: 2,
};

let bar = Object.create(foo);
bar.c = 3;
bar.say = function() {
  console.log('c is ' + this.c);
};

let baz = shallowCopy(bar);
console.log(baz.a);       // => 1
baz.say();                // => c is 3
console.log(baz.hasOwnProperty('a'));  // false
console.log(baz.hasOwnProperty('b'));  // false
*/

function extend(destination, ...sources) {
  function copyToDestinationFrom(obj) {
    Object.getOwnPropertyNames(obj).forEach(key => {
      destination[key] = obj[key];
    });
  };

  if (sources.length === 0) {
    return destination;
  } else {
    copyToDestinationFrom(sources.shift());
    return extend(destination, ...sources);
  }
}

let foo = {
  a: 0,
  b: {
    x: 1,
    y: 2,
  },
};

let joe = {
  name: 'Joe'
};

let funcs = {
  sayHello() {
    console.log('Hello, ' + this.name);
  },

  sayGoodBye() {
    console.log('Goodbye, ' + this.name);
  },
};

let object = extend({}, foo, joe, funcs);

console.log(object.b.x);          // => 1
object.sayHello();                // => Hello, Joe
