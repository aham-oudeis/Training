'use strict';

/*
YouTube currently displays a like and a dislike button, allowing you to express your opinions about particular content. It's set up in such a way that you cannot like and dislike a video at the same time.

There are two other interesting rules to be noted about the interface:

    Pressing a button, which is already active, will undo your press.
    If you press the like button after pressing the dislike button, the like button overwrites the previous "dislike" state. The same is true for the other way round.

Create a function that takes an array of button inputs and returns the final state.

Input: array of button presses
Output: the final state of the presses

Rules:
-initial state is 'Nothing'
-two presses of either 'like' or 'dislike' returns to the original state
-if the current state is 'like', then 'dislike' changes the current state to 'dislike'
-likewise, if the current state is 'dislike', then 'like' changes the current state to 'dislike'

Clarifications:
-what if the array is empty?
-return 'Nothing'
-would the array contain any bad inputs? Like strings that are neither 'like' or 'dislike'?


Approach:
-keep track of the current state
-iterate through the array and toggle the current state accordingly
  --if the current button is the same as the current state, change the current state to 'Nothing'
  --if the current state different, then change the current state to the current button

likeOrDislike(["Dislike"]) === "Dislike"

likeOrDislike(["Like", "Like"]) === "Nothing"

likeOrDislike(["Dislike", "Like"]) === "Like"

likeOrDislike(["Like", "Dislike", "Dislike"]) === "Nothing"
*/

function likeOrDislike(arr) {
  let DEFAULT = 'Nothing'
  let currentState = DEFAULT;

  arr.forEach(button => {
    if (button === currentState) {
      currentState = DEFAULT;
    } else {
      currentState = button;
    }
  });

  return currentState;
}

console.log(likeOrDislike(["Dislike"]) === "Dislike");

console.log(likeOrDislike(["Like", "Like"]) === "Nothing");

console.log(likeOrDislike(["Dislike", "Like"]) === "Like");

console.log(likeOrDislike(["Like", "Dislike", "Dislike"]) === "Nothing");
