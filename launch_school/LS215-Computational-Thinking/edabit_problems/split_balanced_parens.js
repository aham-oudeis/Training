'use strict';

/*

Write a function that groups a string into parentheses clusters. Each cluster should be balanced.
Examples

split("()()()") ➞ ["()", "()", "()"]

split("((()))") ➞ ["((()))"]

split("((()))(())()()(()())") ➞ ["((()))", "(())", "()", "()", "(()())"]

split("((())())(()(()()))") ➞ ["((())())", "(()(()()))"]

                        Problem
--------------------------------------------------------------
Input: String containing parentheses
Output: array with clusters of balanced parentheses

Rules:
-the string contains only the balanced parentheses
-each balanced parentheses is an element of the array
-balanced parentheses includes all the enclosing balanced parentheses
-

                      Clarifications:
--------------------------------------------------------------
Bad Inputs: no;
Edge Cases: when the parentheses are not balanced

                        Examples
--------------------------------------------------------------
split("()()()") ➞ ["()", "()", "()"]

-(), (), (),

split("((()))") ➞ ["((()))"]

-((()))
split(")()()()") ➞ ["()", "()", "()"]
split(")()()())") ➞ ["()", "()", "()"]


                        Data Structure
--------------------------------------------------------------
array as a way of storing the clusters

                        Algorithm
--------------------------------------------------------------
 -keep a paren counter
 -keep a cluster variable to collect the balanced parentheses
 -iterate through the string characters
 -if the character is left paren, increment the counter
 -if the charcter is right paren, decrement the counter
 -in both cases concatanate the cluster with the character
 -when the counter is zero and cluster length is more than zero apppend the cluster to the collection
 -and initialize the cluster to an empty string

 split("((()))()") ➞ ["((()))", '()']
*/

function split(parentheses)  {
  let counter = 0;
  let cluster = '';
  let collection = [];

  [...parentheses].forEach(char => {
    if (/\(/.test(char)) {
      counter++;
      cluster += char;
    } else if (/\)/.test(char)) {
      counter--;
      cluster += char;
    };

    if (counter === 0 && cluster.length > 0) {
      collection.push(cluster);
      cluster = '';
    }

    if (counter < 0) {
      counter = 0;
      cluster = '';
    }
  });

  return collection;
}

