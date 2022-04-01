'use strict';

/*

*/

function binarySearch(arr, item) {
  function search(lower, upper) {
    let mid = Math.floor((lower + upper)/ 2);

    // for an empty array or when you are down to one element
    if (lower >= upper) {
      return arr[lower] === item ? lower : - 1;
    }

    if (item === arr[mid]) return mid;

    if (item < arr[mid]) {
      return search(lower, mid - 1);
    } else {
      return search(mid + 1, upper);
    }
  }

  return search(0, arr.length - 1);
}

const yellowPages = ['Apple Store', 'Bags Galore', 'Bike Store', 'Donuts R Us', 'Eat a Lot', 'Good Food', 'Pasta Place', 'Pizzeria', 'Tiki Lounge', 'Zooper'];
console.log(binarySearch(yellowPages, 'Pizzeria'));                   // 7


console.log(binarySearch(yellowPages, 'Apple Store'));                // 0

console.log(binarySearch([1, 5, 7, 11, 23, 45, 65, 89, 102], 77));    // -1

console.log(binarySearch([1, 5, 7, 11, 23, 45, 65, 89, 102], 89));    // 7
console.log(binarySearch([1, 5, 7, 11, 23, 45, 65, 89, 102], 5));     // 1

console.log(binarySearch(['Alice', 'Bonnie', 'Kim', 'Pete', 'Rachel', 'Sue', 'Tyler'], 'Peter'));  // -1
console.log(binarySearch(['Alice', 'Bonnie', 'Kim', 'Pete', 'Rachel', 'Sue', 'Tyler'], 'Tyler'));  // 6

