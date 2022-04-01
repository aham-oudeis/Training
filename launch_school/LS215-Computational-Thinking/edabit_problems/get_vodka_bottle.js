'use strict';

/*
The insurance guy laughs, he's just kidding. He just needs an updated list. You just need one of those Rammstein Vodka bottles.

Given an object with alcoholic drinks and a number, return a string with the name of the Rammstein bottle that matches the given number.

Examples
{ whiskey: 100, "Rammstein A": 100, "Rammstein B": 50 } ➞ "Rammstein A"
// number = 100

{ whiskey: 100, "Rammstein A": 100, "Rammstein B": 50 } ➞ "Rammstein B"
// number = 50

{ whiskey: 100, "Rammstein A": 100, "Rammstein D": 70, beer: 70 } ➞ "Rammstein D"
// number = 70


                        Problem
--------------------------------------------------------------
Input: an obj and a number
Output: return the key with Ramstein string that has the value as the given number

Rules:
-the ramstein bottle would be present as a key
-could be a mix of upper and lower cases
-objects have strings that have spaces in them

                      Clarifications:
--------------------------------------------------------------
Bad Inputs: could be handled with guard clauses
Edge Cases:
-when number is NaN
                        Examples
--------------------------------------------------------------
{ whiskey: 100, "Rammstein A": 100, "Rammstein B": 50 }, 100 === "Rammstein A"

{ whiskey: 100, "Rammstein A": 100, "Rammstein B": 50 }, 50  === "Rammstein B"

{ whiskey: 100, "Rammstein A": 100, "Rammstein D": 70, beer: 70 }, 70 === "Rammstein D"

{ whiskey: 100, "Rammstein A": 100, "Rammstein D": NaN, beer: 70 }, NaN === "Rammstein D"

{ whiskey: 100, "rammstein A": 100, "Rammstein D": NaN, beer: 70 }, 100 === "rammstein A";

{ whiskey: 100, "rammstein A": 100, "Rammstein D": NaN, beer: 70 }, 100 === "rammstein A"

                        Data Structure
--------------------------------------------------------------
-for key in obj
-obj

                        Algorithm
--------------------------------------------------------------
-iterate through the objects using keys
-test if the key has rammstein in it as the first string
-if it does, test the corresponding value,
-if the value matches the number, return that key
  --implement this by using uniq function
  --pass the given number and the value to it
  --check the length of the returned array
  --if it is 1, return the key
-if nothing is found, return null;
*/

const uniq = (arr) => [...new Set(arr)];

function getVodka(obj, number) {
  for (let key in obj) {
    if (/^rammstein/i.test(key)) {
      let value = obj[key];
      let twoValues = uniq([value, number])
      let total = twoValues.length;
      if (total === 1) return key;
    }
  }
}

console.log(getVodka({ whiskey: 100, "Rammstein A": 100, "Rammstein B": 50 }, 100) === "Rammstein A");

console.log(getVodka({ whiskey: 100, "Rammstein A": 100, "Rammstein B": 50 }, 50)  === "Rammstein B");

console.log(getVodka({ whiskey: 100, "Rammstein A": 100, "Rammstein D": 70, beer: 70 }, 70) === "Rammstein D");

console.log(getVodka({ whiskey: 100, "Rammstein A": 100, "Rammstein D": NaN, beer: 70 }, NaN) === "Rammstein D");

console.log(getVodka({ whiskey: 100, "rammstein A": 100, "Rammstein D": NaN, beer: 70 }, 100) === "rammstein A");

console.log(getVodka({ whiskey: 100, "rammstein A": 100, "Rammstein D": NaN, beer: 70 }, 100) === "rammstein A");
