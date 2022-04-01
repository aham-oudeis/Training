'use strict';

/*
start 3: 14

Write a function that takes two or more objects and returns
a new object which combines all the input objects.

Objects are combined together so that the values of matching keys are added together.

An example:

const objA = { a: 10, b: 20, c: 30 }
const objB = { a: 3, c: 6, d: 3 }
combine(objA, objB) // Returns { a: 13, b: 20, c: 36, d: 3 }

The combine function should not mutate the input objects.


                        Problem
--------------------------------------------------------------
Input: two or more than two objects
Output: one object that adds the values

Rules:
-don't mutate the object
-add the values (bc js by default discards)

                      Clarifications:
--------------------------------------------------------------
Bad Inputs:
Edge Cases: adding numbers to NaN, infinity
-if one of the repeat values is NaN
-strings

                        Examples
--------------------------------------------------------------
const objA = { a: 10, b: 20, c: 30 }
const objB = { a: 3, c: 6, d: 3 }
combine(objA, objB) // Returns { a: 13, b: 20, c: 36, d: 3 }

const objA = { a: 10, b: 20, c: 30, d:2 }
const objB = { a: 3, c: 6, d: NaN }
combine(objA, objB) // Returns { a: 13, b: 20, c: 36, d: 2 }

const objA = { a: 10, b: 20, c: 30, d:NaN }
const objB = { a: 3, c: 6, d: NaN }
combine(objA, objB) // Returns { a: 13, b: 20, c: 36, d: NaN }

const objA = { a: 10, b: 20, c: 30, d:'7' }
const objB = { a: 3, c: 6, d: '1' }
combine(objA, objB) // Returns { a: 13, b: 20, c: 36, d: 8 }

                        Data Structure
--------------------------------------------------------------
-objects

                        Algorithm
--------------------------------------------------------------
--create a function that combines two objects
  --create a copy of the object
  --iterate through the other object
  --if the copy already has a value, add the current value
    --extract the number from the value
    --add to the existing value
    --if the previous value is not NaN and the current value is NaN, then then total is the previous value
    --if there is no previous value and the current value is NaN, then total is NaN;
  --else, add the key and the value
    --convert the value to number
--reduce list of objects and combine them all using the helper function
*/

function combineTwo(obj1, obj2) {
  let collection = {...obj1};

  for (let key in obj2) {
    let previousValue = collection[key];
    let currentValue = obj2[key];

    if (isNaN(previousValue) && !isNaN(currentValue)) {
      previousValue = 0;
    };

    if (isNaN(currentValue) && !isNaN(previousValue)) {
      currentValue = 0;
    };

    if (previousValue === undefined && isNaN(currentValue)) {
      previousValue = NaN;
    }

    previousValue = Number(previousValue);
    currentValue = Number(currentValue);
    let total = previousValue + currentValue;

    collection[key] = total;
  }

  return collection;
}

function combine(...objects) {
  let combinations = objects.reduce((acc, obj) => {
    return combineTwo(acc, obj);
  }, {});

  return combinations;
}

const objA = { a: 10, b: 20, c: 30 };
const objB = { a: 3, c: 6, d: 3 };
const objC = { a: 1, c: 1, d: 1 }
console.log(combine(objA, objB, objC)); // Returns { a: 14, b: 20, c: 37, d: 4 }

const obj1 = { a: 10, b: 20, c: 30, d:2 }
const obj2 = { a: 3, c: 6, d: NaN }
console.log(combine(obj1, obj2)); // Returns { a: 13, b: 20, c: 36, d: 2 }

const obj3 = { a: 10, b: 20, c: 30, d:NaN }
const obj4 = { a: 3, c: 6, d: NaN }
console.log(combine(obj3, obj4)); // Returns { a: 13, b: 20, c: 36, d: NaN }

const obj5 = { a: 10, b: 20, c: 30, d:'7' }
const obj6 = { a: 3, c: 6, d: '1' }
combine(obj5, obj6) // Returns { a: 13, b: 20, c: 36, d: 8 }
