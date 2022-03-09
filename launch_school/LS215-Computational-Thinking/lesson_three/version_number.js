'use strict';

/*
 * Input:
 *  - two string representation of version numbers
 *  - contains only digits and dots
 * Output
 *  - -1 if the first version number is smaller
 *  - 1 if the first version number is larger
 *  - 0 if it is equal
 *
 * Examples:
 * 0.1 < 1 == 1.0 < 1.1 < 1.2 == 1.2.0.0 < 1.18.2 < 13.37
 *
 * we can compare character by character and return early
 * when we find the two strings to be different.
 * for instance, first character of 0.1 is 0 and the first character of 1 is 1. 1 > 0;
 * how about? 1 and 1.0? second character is 0 for second string, but no character for 1
 * in such cases, we can check if the longer string has any remaining digit that is not a zero
 * if there is a non zero digit, then the string is greater; otherwise, they are equal

 Algorithm:
 - return null if either string contains anything other than a digit and a dot
 - return null if either string contains more than one dot as a separator
 - split each string into arrays using the dot as a delimiter
 - iterate from 0 up to the length of the longer string
 - compare if the elements at that index are the same
 - if they are the same, move to next index
 - if the elements are different check, if the element in the shorter array is undefined
 - if it is undefined, the check if there is any non zero number in the remaining array
 - if it there is a non zero element, then the longer string is higher; return 1.
 - otherwise, return 0;
 */

function invalid(versionNumber) {
  return !(/^[0-9]+(\.[0-9]+)*$/.test(versionNumber));
}

function compareVersions(version1, version2) {
  if (invalid(version1) || invalid(version2)) {
    return null;
  }

  version1 = version1.split('.');
  version2 = version2.split('.');

  let length = Math.max(version1.length, version2.length);

  for (let i = 0; i < length; i++) {
    let firstPart = Number(version1[i]) || 0;
    let secondPart = Number(version2[i]) || 0;

    if (firstPart > secondPart) {
      return 1;
    } else if (firstPart < secondPart) {
      return -1;
    }
  }

  return 0;
}

console.log(compareVersions('0.1', '1'));
console.log(compareVersions('1', '1.0'));
console.log(compareVersions('1', '1.1'));
console.log(compareVersions('1.2', '1.1'));
console.log(compareVersions('1.2', '1.2.0.0'));
console.log(compareVersions('1.2.', '1.1'));
console.log(compareVersions('.1.2.', '1.1'));
console.log(compareVersions('1.2.', '1.1.'));
console.log(compareVersions('1..2.', '1.1'));

