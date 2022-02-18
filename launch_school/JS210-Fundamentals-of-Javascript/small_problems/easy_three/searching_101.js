'use strict';

let rlSync = require('readline-sync');
let num1 = rlSync.question('Enter the 1st number: ');
let num2 = rlSync.question('Enter the 2nd number: ');
let num3 = rlSync.question('Enter the 3rd number: ');
let num4 = rlSync.question('Enter the 4th number: ');
let num5 = rlSync.question('Enter the 5th number: ');
let last = rlSync.question('Enter the last number: ');

let collection = [num1, num2, num3, num4, num5];
let isInCollection = collection.includes(last);

console.log(`The number ${last} ${ isInCollection ? 'does' : 'does not' } appear in [ ${collection.join(', ')} ].`);
