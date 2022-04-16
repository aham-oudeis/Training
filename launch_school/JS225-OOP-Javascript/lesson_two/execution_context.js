'use strict';

//1. what will the code below output?

function foo() {
  return this;
}

let context = foo();
console.log(context);

//in absence of the strict mode, the context variable is initialized to the
//return value of the foo function invocation. the function returns the
//reference to the calling object since the calling object is the window object,
//the window object; but in the strict mode, the global this is undefined

//3. What will the code below output? Explain the difference, if any, between
//this output and that of problem 1.

let obj = {
  foo() {
    return this;
  },
};

let context = obj.foo();

console.log(context);

//the local variable context is initialized to the current obj, i.e. obj
//hence, the output will be the same obj

//4. what will the code below output?

var message = 'Hello from the global scope!';

function deliverMessage() {
  console.log(this.message);
}

deliverMessage();
//it logs the message property on the global object
//hence, it logs: Hello from the global scope

let bar = {
  message: 'Hello from the function scope!',
};

bar.deliverMessage = deliverMessage;

bar.deliverMessage();

//the method deliverMessage is invoked on the object
//the method logs the message property of the current object
//hence, it logs the message: Hello from the function scope
