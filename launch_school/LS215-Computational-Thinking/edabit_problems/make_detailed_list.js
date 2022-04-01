'use strict';

/*
The police call. They need a more detailed list of the stolen goods.

You are given an array with nested arrays that represent each room in your mansion where the goods were stolen. Each room will have two sub-arrays, one for the stolen items and the other for its values. They always match, the stolen item at index 0 is worth the value at index 0 of the values array, the stolen item at index 1 is worth the value at index 1, and so forth. Look at the example for a clearer picture.

Return an object that represents where the goods were stolen from and which goods were stolen from each room and their value.
Examples

makeDetailedList([["kitchen", ["piano", "tv"], [1000, 50]]])
➞ { kitchen: { piano: 1000, tv: 50 } }


makeDetailedList([
  ["basement", ["baseball bat"], [500] ],
  ["garage", ["horses", "cadillac", "flowers"], [110, 2000, 30]]
]) ➞ {
  basement: {
    "baseball bat": 500
  },
  garage: {
    horses : 110,
    cadillac: 2000,
    flowers: 30
  }
}

Input: array
Output: object

Rules:
-each array is a collection of arrays, such that
-array[0] is the room name
-arra[1] is an array containing the name of items
-array[2] is an array containing the price of items

task:
-create an object pairining the item name with the price
-create an object with the roomname as  the key value

algorithm
-create a function that takes two arrays and returns an object with elements from the first array as key
  and element from the second array as its value
  --initialize an empty object
  --iterate through the index of one array
  --key is the element from the first array
  --value is the element from the second array
  --return the object
-initialize an empty object
-iterate through the elements
-extract the first element as the key
-pass the next two arrays to the function
-add the roomname as key and the return value of the function to the object
-return that object
*/

function makeDetailedList(arr) {
  function mergeArr([arr1, arr2]) {
    let obj = {};

    for (let idx in arr1) {
      let key = arr1[idx];
      let value = arr2[idx];
      obj[key] = value;
    }

    return obj;
  }

  let detailedList = {};

  for (let room of arr) {
    let roomname = room[0];
    let objects = mergeArr(room.slice(1));

    detailedList[roomname] = objects;
  }

  return detailedList;
}

//console.log(makeDetailedList())

console.log(makeDetailedList([
  ["basement", ["baseball bat"], [500] ],
  ["garage", ["horses", "cadillac", "flowers"], [110, 2000, 30]]
]));
/*
➞ {
  basement: {
    "baseball bat": 500
  },
  garage: {
    horses : 110,
    cadillac: 2000,
    flowers: 30
  }
}
*/
