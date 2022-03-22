'use strict';

/*
Given an object containing chapter names as keys and page
numbers as values, and a target page create a function that
returns which chapter is nearest to the page you're on.

Input:Two [object, number]
Output:

Clarifications
-are the number of argument guaranteed? Yes
-what if one of the argument is missing? N/A
-what if the first argument is not an object? (say array) N/A
-what if the second argument is not a number? N/A
  -NaN?
  -Infinity / -Infinity:
  -return the first chapter: -Infinity
  -return the last chapter: Infinity
-what if the object is empty but number is supplied? N/A
-what if the object is empty and number is not supplied? N/A
-would the values stored in the objects always be numbers? Yes
  -or, could they be strings with numbers inside? N/A

Edge Cases

Approach:
-Object.entries(obj)
-closeness?
  --Difference being the smallest
  --if there is a tie, return the higher page name

-initiate a variable to keep track of the smallest diff with absolute value, with the chapter and page number pair
-return the chapter title

Pseudocode
-initialize a new array object to Object.entries(obj);
-initialize another variable to contain the chapter and page pair that yields the smallest Difference
-initialize another variable to keep track of the lowest difference (using Math.abs(diff))

nearestChapter({
  "Chapter 1" : 1,
  "Chapter 2" : 15,
  "Chapter 3" : 37
}, 10) ➞ "Chapter 2"

nearestChapter({
  "New Beginnings" : 1,
  "Strange Developments" : 62,
  "The End?" : 194,
  "The True Ending" : 460
}, 200) ➞ "The End?"

nearestChapter({
  "Chapter 1" : 1,
  "Chapter 2" : 19,
  "Chapter 3" : 37
}, 10) ➞ "Chapter 2"
*/

function nearestChapter(obj, target) {
  let chapters = Object.entries(obj);
  let nearest;
  let smallestDiff = Infinity;

  for (let index = 0; index < chapters.length; index++) {
    let chapter = chapters[index];
    let pageNum = chapter[1];
    let diff = Math.abs(target - pageNum);

    if (diff <= smallestDiff) {
      nearest = chapter[0];
      smallestDiff = diff;
    }
  }

  console.log(nearest);
  return nearest;
}

nearestChapter({
  "Chapter 1" : 1,
  "Chapter 2" : 15,
  "Chapter 3" : 37
}, 10); //"Chapter 2"

nearestChapter({
  "New Beginnings" : 1,
  "Strange Developments" : 62,
  "The End?" : 194,
  "The True Ending" : 460
}, 200); // "The End?"

nearestChapter({
  "Chapter 1" : 1,
  "Chapter 2" : 19,
  "Chapter 3" : 37
}, 10); // "Chapter 2"

