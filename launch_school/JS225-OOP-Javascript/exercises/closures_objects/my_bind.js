'use strict';

function myBind(func, thisArg, ...args) {
  return function(...rest) {
    func.call(thisArg, ...args, ...rest);
  }
}

let obj = {
  a: 'hello from obj',
};

var a = 'greetings from global';

function greet(from, to) {
  console.log('From:', from);
  console.log('To:', to);
  console.log(this.a);
}

myBind(greet, obj, 'Gagan').call(this, 'World');
