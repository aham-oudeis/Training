'use strict';

function countBoomerangs(arr) {
  let count = 0;

  const isBoomerang = (index) => {
    return arr[index - 1] === arr[index + 1] &&
           arr[index] !== arr[index - 1]
  };

  for (let idx = 1; idx < arr.length - 1; idx++) {
    if (isBoomerang(idx)) count += 1;
  }

  return count;
}

console.log(countBoomerangs([9, 5, 9, 5, 1, 1, 1]) === 2);

console.log(countBoomerangs([5, 6, 6, 7, 6, 3, 9]) === 1);

console.log(countBoomerangs([4, 4, 4, 9, 9, 9, 9]) === 0);

console.log(countBoomerangs([5, 9, 5, 9, 5]) === 3);
