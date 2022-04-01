'use strict';

/*
start time: 2: 12

In this kata you have to correctly return who is the "survivor", ie: the last element of a Josephus permutation.

Basically you have to assume that n people are put into a circle and that they are eliminated in steps of k elements, like this:

josephus_survivor(7,3) => means 7 people in a circle;
one every 3 is eliminated until one remains
[1,2,3,4,5,6,7] - initial sequence
  [1,2,3C,4,5,6,7]
[1,2,4,5,6,7] => 3 is counted out
  [1,2,3C,4,5,6C,7]
[1,2,4,5,7] => 6 is counted out
  [1,2C,3C,4,5,6C,7]
[1,4,5,7] => 2 is counted out
  [1,2C,3C,4,5,6C,7C]
[1,4,5] => 7 is counted out
  [1,2C,3C,4,5C,6C,7C]
[1,4] => 5 is counted out
  [1C,2C,3C,4,5C,6C,7C]
[4] => 1 counted out, 4 is the last element - the survivor!

The above link about the "base" kata description will give you a more thorough insight about the origin of this kind of permutation, but basically that's all that there is to know to solve this kata.

                        Problem
--------------------------------------------------------------
Input: two numbers, n and k
Output: a number that remains after removing kth element, until one remains

Rules:
-every kth element is removed
-if the element is already removed, skip it in counting
-on every iteration, removal starts from the last element removed

                      Clarifications:
--------------------------------------------------------------
Bad Inputs: NaN, other non-numbers
Edge Cases: Infinity, -Infinity, 0
-if zero, then return the last element
-

                        Examples
--------------------------------------------------------------
[1,2,3,4,5,6,7] - initial sequence
  position = 2 + 3
  [1,2, 3C, 4,5,6,7]
[1,2, 4,5,6,7] => 3 is counted out
  position = 5 + 3 % 7 = 1
  [1,2,3C,4,5,6C,7]
[1,2,4,5,7] => 6 is counted out
  position = 1 + 3 = 4;
  [1,2C,3C,4,5,6C,7]
[1,4,5,7] => 2 is counted out
  [1,2C,3C,4,5,6C,7C]
[1,4,5] => 7 is counted out
  [1,2C,3C,4,5C,6C,7C]
[1,4] => 5 is counted out
  [1C,2C,3C,4,5C,6C,7C]
[4] => 1 counted out, 4 is the last element - the survivor!


[1, 2, 3, 4], 2
[1, 2c, 3, 4c]
[1, 2c, 3c, 4c]

                        Data Structure
--------------------------------------------------------------
arrays

                        Algorithm
--------------------------------------------------------------
-start an array with n numbers
-create the position variable
-create a count variable
-while the number of untagged element is > 1
  -while loop to tag the element
  -increment the counter when the next element, starting from the position, is not tagged
  -when the counter reaches k, tag that element
  -reassign the position variable to that index
  -set the count to 1 again
*/
