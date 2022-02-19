'use strict';

function union(arr1, arr2) {
  let unionArray = [];

  [...arr1, ...arr2].forEach(item => {
    if (!(unionArray.includes(item))) {
      unionArray.push(item);
    }
  });

  console.log(unionArray);
  return unionArray;
}

union([1, 3, 5], [3, 6, 9]);    // [1, 3, 5, 6, 9]
