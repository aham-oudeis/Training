'use strict';

function merge(arr1, arr2) {
  let collection = [];
  let total = arr1.length + arr2.length;
  let firstIdx = 0;
  let secondIdx = 0;

  while (collection.length !== total) {
    if (firstIdx >= arr1.length) {
      collection.push(...arr2.slice(secondIdx))
      break;
    }

    if (secondIdx >= arr2.length) {
      collection.push(...arr1.slice(firstIdx));
      break;
    }

    if (arr1[firstIdx] <= arr2[secondIdx]) {
      collection.push(arr1[firstIdx]);
      firstIdx++;
    } else {
      collection.push(arr2[secondIdx]);
      secondIdx++
    }
  }

  return collection;
}

function mergeSort(arr) {
  if (arr.length <= 1) return arr;

  let half = Math.floor(arr.length / 2);

  let left = arr.slice(0, half);
  let right = arr.slice(half);

  return merge(mergeSort(left), mergeSort(right));
}


console.log(mergeSort([9, 5, 7, 1]));           // [1, 5, 7, 9]
console.log(mergeSort([5, 3]));                 // [3, 5]
console.log(mergeSort([6, 2, 7, 1, 4]));        // [1, 2, 4, 6, 7]

console.log(mergeSort(['Sue', 'Pete', 'Alice', 'Tyler', 'Rachel', 'Kim', 'Bonnie']));
// ["Alice", "Bonnie", "Kim", "Pete", "Rachel", "Sue", "Tyler"]

console.log(mergeSort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]));
// [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
