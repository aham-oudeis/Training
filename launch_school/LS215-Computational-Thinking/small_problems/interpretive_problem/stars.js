'use strict';

/*
star(7);
// logs
*  *  *
 * * *
  ***
*******
  ***
 * * *
*  *  *

Approach:
-three stars separated by decreasing amount of spaces
-the middle line has given number of stars
-total length of the line is the same as the given number
-the first line has 3 stars and 2 spaces in between
-the second line has 3 stars and 1 space in between
-the spaces are getting pushed outward
-the first half of the diamond consist of three lines
-the second half is the same
-the middle line is filled with stars of the num length

-take the half of the number - 1;
-the total number of inner space is num - 3
-first line consists of number - 3 spaces evenly divided in between: that is, divided by two: 4 / 2 = 2
-total number of outer space for each line is 4 - inner space
-outer space on each side is half of the total outer spaces
-on each iteration, decrement the number of inner spaces by two
-second half is simply the reverse of the first half
-the middle section is stars repeated times the given number
*/

function stars(num) {
  let half = (num - 1) / 2;

  let totalSpaces = num - 3;
  let innerSpaces = totalSpaces;

  let top = [];

  for (let idx = 0; idx < half; idx++) {

  }
}
