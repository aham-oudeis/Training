'use strict';

/*
Background
There is a message that is circulating via public media that claims a reader can easily read a message where the inner letters of each words is scrambled, as long as the first and last letters remain the same and the word contains all the letters.

Another example shows that it is quite difficult to read the text where all the letters are reversed rather than scrambled.

In this kata we will make a generator that generates text in a similar pattern, but instead of scrambled or reversed, ours will be sorted alphabetically

Requirement
return a string where:

    the first and last characters remain in original place for each word
    characters between the first and last characters must be sorted alphabetically
    punctuation should remain at the same place as it started, for example: shan't -> sahn't

Assumptions

    words are seperated by single spaces
    only spaces separate words, special characters do not, for example: tik-tak -> tai-ktk
    special characters do not take the position of the non special characters, for example: -dcba -> -dbca
    for this kata puctuation is limited to 4 characters: hyphen(-), apostrophe('), comma(,) and period(.)
    ignore capitalisation


Approach:
-split the sentence into words
-create a function that takes a word and returns the requisite word
  --collect the punctuation
  --collect the rest
  --feed it to the sorting function
    --slice the word from the first index to the second last index
    --sort the array of chars
    --join it with the first and the last char and return it
  --iterate through the given word and collect according to whether the char is a punctuation
    --if the char is a punctuation, shift the collection of punctuation
    --else, shift the sorted array of chars
-map each sort by passing it to the helper function
-join the words and return it
*/

const scrambleWords = function (sentence) {
  function sortInnerChars(arr) {
    return [arr[0]].concat(arr.slice(1, -1).sort(), arr.slice(-1));
  }

  function scramble(word) {
    let chars = [...word];
    let letters = chars.filter(char => /[a-z]/i.test(char));
    let punctuation = chars.filter(char => /[\-.,']/.test(char));

    let sortedLetters = sortInnerChars(letters);

    let result = [];

    [...word].forEach(char => {
      let current =
        /[a-z]/i.test(char) ? sortedLetters.shift() : punctuation.shift();
      result.push(current);
    });

    return result.join('');
  }

  return sentence.split(' ').map(scramble).join(' ');
};

console.log(scrambleWords('card-carrying'));
