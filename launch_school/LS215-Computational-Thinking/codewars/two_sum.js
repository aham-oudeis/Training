'use strict';

/*
Write a function that takes an array of numbers (integers for the tests)
and a target number. It should find two different items in the array that,
when added together, give the target value. The indices of these items should
then be returned in a tuple / list (depending on your language) like so:
(index1, index2).

For the purposes of this kata, some tests may have multiple answers;
any valid solutions will be accepted.

The input will always be valid (numbers will be an array of length 2 or greater,
and all of the items will be numbers; target will always be the sum of two
different items from that array).

Approach:
-initialize an object to keep track of the seen elements and their index
-iterate through the array of numbers
  --on each iteration, add the element and its index in an array
  --check if the given number minutes the current element is in the object
  --if it is in the object, then return array after adding the current index

--since objects store strings, the comparision has to be done after converting
--string into numbers
 */
