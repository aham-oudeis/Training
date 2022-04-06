'use strict';

let message = 'Hello from the global scope!';

function func(message) {
  message = 'Hello from the function scope!';
  console.log(message);
}

func(message);
console.log(message);

//the code above first logs the message inside the function and then logs the
//string stored in the message string on line 3
//this is because the function's parameter message shadows the global variable

let myObj = { message: 'Greetings from the global scope!' };

function func(obj) {
  obj.message = 'Greetings from the function scope!';
  console.log(obj.message);
}

func(myObj);

console.log(myObj.message);

//in this case, the message property is reassigned inside the function,
//because the object reference is passed to the function
//

let message = 'Hello from the global scope!';

function func() {
  message = 'Hello from the function scope!';
  console.log(message);
}

func();
console.log(message);

//here the message variable is reassigned from inside the function
//because functions are closures in javascript

let animal = {
  name: 'Pumbaa',
  species: 'Phacochoerus africanus',
};

let menagerie = {
  warthog: animal,
};

animal = {
  name: 'Timon',
  species: 'Suricata suricatta',
};

menagerie.meerkat = animal;

menagerie.warthog === animal; // false
menagerie.meerkat === animal; // true

// If objects are mutable, why does the second to last line return false?
// this is because menagerie.warthog is initialized to a different object that
// animal referenced before it was reinitialized to the object that is stored in
// menagerie.meerkat


