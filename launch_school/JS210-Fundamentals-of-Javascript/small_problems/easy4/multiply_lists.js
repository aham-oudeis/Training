'use strict';

function multiplyList(arr1, arr2) {
  let multipliedList = [];

  for (let index = 0; index < arr1.length; index += 1) {
    multipliedList.push(arr1[index] * arr2[index]);
  }

  console.log(multipliedList);
  return multipliedList;
}

multiplyList([3, 5, 7], [9, 10, 11]);    // [27, 50, 77]
