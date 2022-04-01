'use strict';

/*
Write a function interval_insert which takes as input

    a list myl of disjoint closed intervals with integer endpoints, sorted by increasing order of left endpoints
    an interval interval

and returns the union of interval with the intervals in myl, as an array of disjoint closed intervals.
Terminology

A closed interval includes its endpoints. For example [0,5] means greater than or equal to 0 and less than or equal to 5. For more, refer to Wikipedia.

Two intervals are said to be disjoint if they have no element in common. Equivalently, disjoint intervals are intervals whose intersection is the empty interval. For example,
[1,3] and [4,6] are disjoint
[1,3] and [3,5] are not.
Examples:

                         [(1, 2)], (3, 4) -> [(1, 2), (3, 4)]
                         [(3, 4)], (1, 2) -> [(1, 2), (3, 4)]
                 [(1, 2), (4, 6)], (1, 4) -> [(1, 6)]
[(0, 2), (3, 6), (7, 7), (9, 12)], (1, 8) -> [(0, 8), (9, 12)]

Approach:
-insert the additional range to the correct position
  --find the range such that it's lower point is smaller than the lower point of the other range
  --insert it before that index
-iterate through the collection of ranges and on each iteration, check if the range overlap
  --either the higher of the previous is higher than the lower of the current range
  --or, higher of the current is lower than the higher of the previous
--keep track of the proper range
--if the range are distinct, append the current one
--this requires us to keep track of the range and append it to the collection only when it runs into a distinct range

--basicallly, initialize the first range to the running range
--iterate through the rest of the ranges
--on each iteration, check if the running range overlap with the current range
  --if they overlap, adjust the running range
    --if higher of the running range is smaller than the lower of the current range than they are distinct: append the running range and reassign the current range to the running range
    --if the higher of the running range is greater than or equal to the lower of the current range, then if the higher of the current range is greater than the higher of the running range, then update the running range
--once the iteration is complete, append the running range to the collection
*/

function unionRange(arrOfRange, range) {
  function joinRange() {
    const rangeGreaterThan = (pair) => {
      return pair[0] > range[0];
    };

    let idxOfHigherRange = arrOfRange.findIndex(rangeGreaterThan);

    if (idxOfHigherRange === -1) {
      idxOfHigherRange = arrOfRange.length;
    }

    let heap = arrOfRange.slice();
    heap.splice(idxOfHigherRange, 0, range);

    return heap;
  }

  let collection = [];
  let total = joinRange();
  let running = total[0];

  total.slice(1).forEach(([lower, higher]) => {
    if (running[1] < lower) {
      collection.push(running);
      running = [lower, higher];
    } else if (higher > running[1]) {
      running[1] = higher;
    }
  });

  collection.push(running);

  return collection;
}

console.log(unionRange([[0, 2], [3, 6], [7, 7], [9, 12]], [1, 8]));
