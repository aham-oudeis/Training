'use strict';

/*
Complete the function that takes an object list of users, and find the nexus: the user whose rank is the closest or equal to his honor. Return the rank of this user. For each user, the key is the rank and the value is the honor.

If nobody has an exact rank/honor match, return the rank of the user who comes closest.

If there are several users who come closest, return the one with the lowest rank (numeric value).

The object will not necessarily contain consecutive rank numbers; return the best match from the ranks provided.

Example:
          rank    honor
users = { 1: 93,
          10: 55,
          15: 30,
          20: 19,    <--- nexus
          23: 11,
          30: 2 }



                        Problem
--------------------------------------------------------------
Input: object with ranks as keys and values as honors
Output: return the key, string

Rules:
-find the key such that the difference between the key and the value is the lowest
-if there are multiple keys with same diff, then return the key with the lowest rank
-ranks are measured in terms of numbers


                      Clarifications:
--------------------------------------------------------------
Bad Inputs: always objects
Edge Cases:
-negative infinity
-negative numbers
-0
-infinity
-NaN

                        Examples
--------------------------------------------------------------
users = { 1: 93,
          10: 55,
          15: 30,
          20: 19,    <--- nexus
          23: 11,
          30: 2 }

          users = { 1: 93,
          10: 55,
          15: 30,
          NaN: NaN,    <--- nexus
          23: 11,
          30: 2 }

                        Data Structure
--------------------------------------------------------------
array of keys
object
                        Algorithm
--------------------------------------------------------------
Strategy:
-take the keys and sort them by numbers
-iterate through the sorted keys
-initialize the previousDiff to Infinity
-initialize the resultKey;
-on each iteration, take the absolute value of the diff between the key and the value, using the given obj
-if the diff is lower than the previous diff, then change the key
-return the resultKey

users = { 1: 93,
          10: 55,
          15: 30,
          20: 19,    <--- nexus
          23: 11,
          30: 2 }

[1, 10, 15, 20, 23, 30]
1, 92
10, 45
15, 15
20, 1
20, 1

return 20
*/

function nexus(obj) {
  let keys = Object.keys(obj).sort((a, b) => a - b);
  let prevDiff = Infinity;
  let resultKey;

  for (let key of keys) {
    let keyValue = Number(key);
    let value = Number(obj[key]);

    if (isNaN(value)) continue;

    let diff = Math.abs(value - keyValue);

    if (diff < prevDiff) {
      prevDiff = diff;
      resultKey = key;
    }
  }

  return resultKey;
}

console.log(nexus({1: 93, 10: 55, 15: 30, 20: 19, 23: 11, 30: 2 })); // 20
console.log(nexus({1: 3, 3: 3, 5: 1})); // 3
console.log(nexus({1: 10, 2: 6, 3: 4, 5: 1})); //3
console.log(nexus({1: 10, 2: 3, 3: 4, 5: 1})); // 2

console.log(nexus({2: 3, 1: 10, 5: 1, 3: 4})); // 2
console.log(nexus({1: NaN, 2: undefined, 0: 4, 5: 'hi'})); // 0
console.log(nexus({'1': 3, 3: '1', 5: 1})); // 1
console.log(nexus({2: 4, 2: 3, 5: 1, 3: 4})); // 2
