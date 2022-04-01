'use strict';

/*
Your task is to take arrays of numbers and compress them into ranges.

The numbers in the array are mostly consecutive. If you convert them as ranges, it will save a lot of space. You should write a function that will convert an array of numbers into a string. A range, or series of consecutive numbers, will be represented as two numbers separated by an underscore, a range of one just by the number its self and multiple ranges separated by commas.

For example,
The numbers 5, 6, 7, 8 and 9 would be displayed as "5_9"
The number 6 would just be "6"
The numbers 3,4,5,6,9 would be "3_6,9"

Using the above system, you should write two functions:
toRange - convert an array of numbers to a range string
toArray - convert a range string back to an array

toRange:
-iterate through the array and keep the lower range
-keep track of the previous num
-if the current num is 1 greater than the previous num, update the previous num and continue
-else if the lower range and previous num are different, append the lower range and the previous num separated by an underscore
-else append just the number
-reassign the lower range and previous num to the current num
-once the iteration is complete repeat the previous logic
*/

function toRange(arr) {
  let range = [];
  let lower = arr[0];
  let previous = lower;

  for (let i = 1; i < arr.length; i++) {
    if (arr[i] === previous + 1) {
      previous = arr[i];
      continue;
    } else if (previous === lower) {
      range.push(previous.toString());
    } else {
      range.push([lower, previous].join('_'));
    }

    lower = previous = arr[i];
  }

  if (previous === lower) {
    range.push(previous.toString());
  } else {
    range.push([lower, previous].join('_'));
  }

  return range.join(',')
}


function toArray(rangeStr) {
  function extractRange(str) {
    let [lower, higher] = str.split('_').map(Number);
    let coll = [];

    for (let num = lower; num <= higher; num++) {
      coll.push(num);
    }

    return coll;
  }

  let collection = [];

  rangeStr.split(',').forEach(range => {
    if (/_/.test(range)) {
      collection.push(...extractRange(range));
    } else {
      collection.push(Number(range));
    }
  });

  return collection;
}

console.log(toRange([2, 3, 4, 5, 6, 9]));
console.log(toArray('2_6,9'));
