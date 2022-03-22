'use strict';

/*
Create a function that takes two "sorted" arrays of numbers and returns an array of numbers which are common to both the input arrays.
Examples

console.log(commonElements([-1, 3, 4, 6, 7, 9], [1, 3]));// [3]

console.log(commonElements([1, 3, 4, 6, 7, 9], [1, 2, 3, 4, 7, 10]));// [1, 3, 4, 7]

console.log(commonElements([1, 2, 2, 2, 3, 4, 5], [1, 2, 4, 5]));// [1, 2, 4, 5]

console.log(commonElements([1, 2, 3, 4, 5], [10, 12, 13, 15]));// []
*/

function commonElements(arr1, arr2) {
  let count = {};

  arr1.forEach(item => {
    count[item] = count[item] || 0;
    count[item] += 1;
  });

  arr2.forEach(item => {
    if (count[item]) {
      count[item] = true;
    };
  });

  return Object.entries(count)
               .filter(pair => pair[1] === true)
               .map(pair => Number(pair[0]));
}

console.log(commonElements([-1, 3, 4, 6, 7, 9], [1, 3]));// [3]

console.log(commonElements([1, 3, 4, 6, 7, 9], [1, 2, 3, 4, 7, 10]));// [1, 3, 4, 7]

console.log(commonElements([1, 2, 2, 2, 3, 4, 5], [1, 2, 4, 5]));// [1, 2, 4, 5]

console.log(commonElements([1, 2, 3, 4, 5], [10, 12, 13, 15]));// []
//

// to find all the common elements including the count
function commonElements(arr1, arr2) {
  let count1 = {};

  arr1.forEach(item => {
    count1[item] = count1[item] || 0;
    count1[item] += 1;
  });

  let count2 = {};

  arr2.forEach(item => {
    count2[item] = count2[item] || 0;
    count2[item] += 1;
  });

  let collection = [];

  Object.keys(count1).forEach(num => {
    if (count2[num]) {
      let total = Math.min(count1[num], count2[num]);
      let minCountOfNum= new Array(total).fill(Number(num));
      collection.push(...minCountOfNum);
    }
  });

  console.log(collection);
  return collection;
}

commonElements([1, 2, 2, 2, 3, 4, 5], [1, 2, 2, 4, 5]);// [1, 2, 2, 4, 5]
