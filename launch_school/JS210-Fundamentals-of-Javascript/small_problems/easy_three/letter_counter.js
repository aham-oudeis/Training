'use strict';

function wordSizes(string) {
  let words = string.split(' ');
  let letterCount = {};

  words.forEach(word => {
    let length = word.length;
    if (letterCount[length]) {
      letterCount[length] += 1;
    } else {
      letterCount[length] = 1;
    }
  });

  console.log(letterCount);
  return letterCount;
}

wordSizes('Four score and seven.');                       // { "3": 1, "4": 1, "5": 1, "6": 1 }
wordSizes('Hey diddle diddle, the cat and the fiddle!');  // { "3": 5, "6": 1, "7": 2 }
wordSizes("What's up doc?");                              // { "2": 1, "4": 1, "6": 1 }
wordSizes('');                                            // {}

function onlyWordSizes(string) {
  string = string.replace(/[^A-Za-z\s]/g, '');
  return wordSizes(string);
}

onlyWordSizes('Hey diddle diddle, the cat and the fiddle!');
