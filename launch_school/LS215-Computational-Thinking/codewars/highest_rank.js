'use strict';

/*
Complete the method which returns the number which is most frequent in the given input array. If there is a tie for most frequent number, return the largest number among them.

Note: no empty arrays will be given.

[12, 10, 8, 12, 7, 6, 4, 10, 12]              -->  12
[12, 10, 8, 12, 7, 6, 4, 10, 12, 10]          -->  12
[12, 10, 8, 8, 3, 3, 3, 3, 2, 4, 10, 12, 10]  -->   3

approach:
-create count object
-sort the keys of the object as follows
  --(a, b) =>
  --if (obj[a] == obj[b]) return b - a;
  --b - a;
*/

function highestRank(arr) {
  let count = {};

  arr.forEach(item => {
    count[item] = count[item] || 0;
    count[item] += 1;
  });

  const comparison = (a, b) => {
    if (count[a] === count[b]) return Number(b) - Number(a);
    return count[b] - count[a];
  };

  //return count;
  return Object.keys(count).sort(comparison);
}

console.log(highestRank([12, 10, 8, 12, 7, 6, 4, 10, 12]));
console.log(highestRank([12,10,8,12,7,6,4,10,10]));

