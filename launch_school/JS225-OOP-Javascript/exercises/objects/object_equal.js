'use strict';

function objectsEqual(first, second) {
  //checks if the values are already equal: same object or primitive values
  //if they are the same values, forming a set should collapse their values
  //into 1: this way, it works for NaN values as well
  if ([...new Set([first, second])].length === 1) return true;

  //they are not equal; if they are primitives, then they are unequal
  if (typeof first !== 'object' || typeof second !== 'object') return false;

  //then start checking for object equality
  let firstKeys = Object.getOwnPropertyNames(first);
  let secondKeys = Object.getOwnPropertyNames(second);

  //if there are different number of keys, return false;
  if (firstKeys.length !== secondKeys.length) return false;

  //given that the keys are of same length, checking every key in another object
  //suffices for checking the equality of keys and values
  for (let key of firstKeys) {
    //if the the same key is not present in the other, return false
    if (!Object.prototype.hasOwnProperty.call(second, key)) return false;

     //to check the value equality, use recursion
    if (!objectsEqual(first[key], second[key])) return false;
   }

  return true;
}

let ar = [1, 2];
console.log(objectsEqual({a: 'foo'}, {a: 'foo'}));                      // true
console.log(objectsEqual({a: 'foo', b: 'bar'}, {a: 'foo'}));            // false
console.log(objectsEqual({}, {}));                                      // true
console.log(objectsEqual({a: 'foo', b: undefined}, {a: 'foo', c: 1}));  // false
console.log(objectsEqual({a: ar, b:2, c: 3}, {c: 3, b: 2, a: ar}) === true); // true
console.log(objectsEqual({a: [1,2], b:2, c: 3}, {c: 3, b: 2, a: [1,2]}) === true); // true
console.log(objectsEqual({a: {b: [1,2]}, b:2, c: 3}, {c: 3, b: 2, a: {b: [1,2]}}) === true); // true
console.log(objectsEqual({a: {b: [1,2]}}, {a: {b: [1,2]}}) === true); // true
console.log(objectsEqual({a: {b: 1}, b:2, c: 3}, {c: 3, b: 2, a: {b: 1}}) === true); //true
console.log(objectsEqual({a: {b: 1}, b:{'nest1' : {'nest2': 'very nested value'}}, c: 3}, {c: 3, b: {'nest1' : {'nest2': 'very nested value'}}, a: {b: 1}}) === true); //true

console.log(objectsEqual({a: {b: 1}, b:{'nest1' : {'nest2': 'very nested value'}}, c: 3}, {c: 3, b: {'nest1' : {'nest2': 'very nested value not equal'}}, a: {b: 1}}) === false); //false
console.log(objectsEqual({a: {b: 1}, b:2, c: 3}, {c: 3, b: 2, a: {b: '1'}}) === false); //false
console.log(objectsEqual({a: {b: 1}}, {a: {b: '1'}}) === false); //false
console.log(objectsEqual({a: 1}, {a: '1'}) === false); //false
console.log(objectsEqual({ a: 'foo' }, { a: 'foo' }));                      // true
console.log(objectsEqual({ a: 'foo', b: 'bar' }, { a: 'foo' }));            // false
console.log(objectsEqual({}, {}));                                      // true
console.log(objectsEqual({ a: 'foo', b: { a: 1 } }, { a: 'foo', c: 1 }));  // false
console.log(objectsEqual({ a: 'foo', b: { a: 1 } }, { a: 'foo', b: { a: 1 } }));  // true
console.log(objectsEqual({ a: 'foo', b: { a: 1 } }, { a: 'foo', b: { a: 2 } }));  // false
console.log(objectsEqual({ a: null, b: [1, 2] }, { a: null, b: [1, 2] })); //true
console.log(objectsEqual({ a: null, b: undefined }, { a: null, b: undefined })); //true
console.log(objectsEqual({ a: null, b: undefined }, { a: null, b: [1, 2] })); // false
