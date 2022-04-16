'use strict';

function greet(arg1, arg2) {
  [arg1, arg2] = [arg1, arg2].map(word => word.toLowerCase());

  const capitalize = (word) => word[0].toUpperCase() + word.slice(1);

  let msg = capitalize(arg1) + ',' + ' ' + capitalize(arg2) + '!';
  console.log(msg);
}

greet('howdy', 'joe');
greet('good morning', 'Sue');

function partial(func, first) {
  return function(second) {
    func(first, second);
  }
}

const sayHi = partial(greet, 'Hi');
const sayHello = partial(greet, 'Hello');
sayHello('Brute');
sayHi('Sappho');
