'use strict';

/*
merge([1, 5, 9], [2, 6, 8]);      // [1, 2, 5, 6, 8, 9]
merge([1, 1, 3], [2, 2]);         // [1, 1, 2, 2, 3]
merge([], [1, 4, 5]);             // [1, 4, 5]
merge([1, 4, 5], []);             // [1, 4, 5].


                        Problem
--------------------------------------------------------------
Input: two sorted arrays
Output: a sorted array

Rules:

                      Clarifications:
--------------------------------------------------------------
Bad Inputs:
Edge Cases:

                        Examples
--------------------------------------------------------------

                        Data Structure
--------------------------------------------------------------
hashes
recursive nature of the parentheses and brackets
f(K4[ON(SO3)2]2)
f(K4) + f([ON(SO3)2]2)
f(K4) + f(ON(SO3)2) * 2
f(k4) + (f(ON) + f(SO3)2) * 2

                       Algorithm
--------------------------------------------------------------
 {s: 1, O: 3}
 number is 2
 {s: 2, O: 6}



function merge(arr1, arr2) {
  let collection = [];
  let total = arr1.length + arr2.length;
  let firstIdx = 0;
  let secondIdx = 0;

  while (collection.length !== total) {
    if (firstIdx >= arr2.length) {
      collection.push(...arr1.slice(firstIdx))
      break;
    }

    if (secondIdx >= arr1.length) {
      collection.push(...arr2.slice(firstIdx));
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
*/

function merge(arr1, arr2) {
  let collection = [];
  let total = arr1.length + arr2.length;

  let copy1 = arr1.slice().reverse();
  let copy2 = arr2.slice().reverse()

  while (copy1.length > 0 && copy2.length > 0) {
    let idx1 = copy1.length - 1;
    let idx2 = copy2.length - 1;
    let insert = copy1[idx1] <= copy2[idx2] ? copy1.pop() : copy2.pop();

    collection.push(insert);
  }

  return collection.concat(copy1.length === 0 ? copy2.reverse() : copy1.reverse())
}

console.log(merge([1, 5, 9], [2, 6, 8]));      // [1, 2, 5, 6, 8, 9]
console.log(merge([1, 1, 3], [2, 2]));         // [1, 1, 2, 2, 3]
console.log(merge([], [1, 4, 5]));             // [1, 4, 5]
console.log(merge([1, 4, 5], []));             // [1, 4, 5].


