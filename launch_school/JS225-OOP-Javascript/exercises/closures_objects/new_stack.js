'use strict';

function newStack() {
  const stack = [];

  return {
    push(item) {
      stack.push(item);
    },

    pop() {
      stack.pop();
    },

    printStack() {
      stack.forEach(item => console.log(item));
    },
  };
}

let stack = newStack();

stack.push([9]);
stack.push('hello');
stack.push({a: 'hi'});
stack.printStack();
stack.pop();
stack.printStack();
