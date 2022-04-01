'use strict';

/*
Write a function that divides a phrase into word buckets, with each bucket containing n or fewer characters. Only include full words inside each bucket.
Examples

bucketize("she sells sea shells by the sea", 10)
➞ ["she sells", "sea shells", "by the sea"]

bucketize("the mouse jumped over the cheese", 7)
➞ ["the", "mouse", "jumped", "over", "the", "cheese"]

bucketize("fairy dust coated the air", 20)
➞ ["fairy dust coated", "the air"]

bucketize("a b c d e", 2)
➞ ["a", "b", "c", "d", "e"]

/*

                        Problem
--------------------------------------------------------------
Input: string of words separated by spaces, and a number
Output: array of words of length equal or less than the given number

Rules:
-the phrases should not have trailing spaces
-the total length of the phrases must be equal or less than the number given
-if a given word + ' ' + another word has length more than the given number, then only one word is appended

                      Clarifications:
--------------------------------------------------------------
Bad Inputs: anything other than a string?
Edge Cases: empty string, string containing more than one spaces, string with words separated by other delimiters, given number less than the length of the word, improper number values

                        Examples
--------------------------------------------------------------
bucketize("she sells sea shells by the sea", 10)
➞ ["she sells", "sea shells", "by the sea"]

bucketize("the mouse jumped over the cheese", 7)
➞ ["the", "mouse", "jumped", "over", "the", "cheese"]

bucketize("", 2)
➞ ["the", "mouse", "jumped", "over", "the", "cheese"]

                        Data Structure
--------------------------------------------------------------
arrays

                        Algorithm
--------------------------------------------------------------
-split the string into separate words delimited by spaces
-initialize a phrase varaible
-iterate through the words and on each iteration, do:
  --create a new variable that concatanates the phrase and the current word
  --if the new phrase is longer than the given number, then append the phrase variable to a collection
  --else, reassign the phrase variable to the newly minted phrase
-as the iteration is done, append the phrase variable again to cover the last iteration that did not append
*/

function bucketize(string, length) {
  let words = string.split(/\s+/);
  if (words.some(word => word.length > length)) return [];

  let collection = [];
  let phrase = words[0];

  words.slice(1).forEach(word => {
    let newPhrase = phrase + " " + word;

    if (newPhrase.length > length) {
      collection.push(phrase);
      phrase = word;
    } else {
      phrase = newPhrase;
    }
  });

  collection.push(phrase);

  return collection;
}

console.log(bucketize("she sells sea shells by the sea", 2));// [])
console.log(bucketize("ab bc cd", 1));// [])
console.log(bucketize("she sells sea shells by the sea", 10));// ["she sells", "sea shells", "by the sea"])
console.log(bucketize("the mouse jumped over the cheese", 7));// ["the", "mouse", "jumped", "over", "the", "cheese"])
console.log(bucketize("fairy dust coated the air", 20));// ["fairy dust coated", "the air"])
console.log(bucketize("do the hokey pokey", 6));// ["do the", "hokey", "pokey"])
console.log(bucketize("do the hokey pokey", 12));// ["do the hokey", "pokey"])
console.log(bucketize("rich magnificent trees dotted the landscape", 12));// ["rich", "magnificent", "trees dotted", "the", "landscape"])
console.log(bucketize("rich magnificent trees dotted the landscape", 15));// ["rich", "magnificent", "trees dotted", "the landscape"])
console.log(bucketize("rich magnificent trees dotted the landscape", 18));// ["rich magnificent", "trees dotted the", "landscape"])
console.log(bucketize("rich magnificent trees dotted the landscape", 22));// ["rich magnificent trees", "dotted the landscape"])
console.log(bucketize("rich magnificent trees dotted the landscape", 40));// ["rich magnificent trees dotted the", "landscape"])
console.log(bucketize("rich magnificent trees dotted the landscape", 43));// ["rich magnificent trees dotted the landscape"])
console.log(bucketize("beep bo bee bop bee bo bo bop", 6));// ["beep", "bo bee", "bop", "bee bo", "bo bop"])
console.log(bucketize("beep bo bee bop bee bo bo bop", 10));// ["beep bo", "bee bop", "bee bo bo", "bop"])
console.log(bucketize("a b c d e", 3));// ["a b", "c d", "e"])
console.log(bucketize("a b c d e", 2));// ["a", "b", "c", "d", "e"])
console.log(bucketize("a b c d e", 1));// ["a", "b", "c", "d", "e"])
console.log(bucketize("a b c d e", 2));// ["a", "b", "c", "d", "e"])
console.log(bucketize("a b c d e", 1));// ["a", "b", "c", "d", "e"])
