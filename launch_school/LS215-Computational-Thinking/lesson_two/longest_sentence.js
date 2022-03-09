'use strict';
function countWords(sentence) {
  if (/[\w]/.test(sentence)) {
    return sentence.split(/\s+/).length;
  }

  return 0;
}

function display(sentence, length) {
  console.log("The longest sentence in the text is:");
  console.log('-'.repeat(20));
  console.log(sentence);
  console.log('-'.repeat(20));
  console.log("The longest sentence has " + String(length) + " words.");
  console.log();
}

function longestSentence(text) {
  text = text.replace(/([!.?]+)/g, '$1#&#');
  let listOfSentences = text.split(/#&#\s?/);

  let lastIdx = listOfSentences.length - 1;
  let firstSentence = listOfSentences[0] || '';
  let length = countWords(firstSentence);
  let longestSentence = firstSentence;

  for (let index = 1; index <= lastIdx; index++) {
    let lengthOfSentence = countWords(listOfSentences[index]);
    if (lengthOfSentence > length) {
      length = lengthOfSentence;
      longestSentence = listOfSentences[index];
    }
  }

  display(longestSentence, length);
}

let longText = 'Four score and seven years ago our fathers brought forth' +
  ' on this continent a new nation, conceived in liberty, and' +
  ' dedicated to the proposition that all men are created' +
  ' equal.' +
  ' Now we are engaged in a great civil war, testing whether' +
  ' that nation, or any nation so conceived and so dedicated,' +
  ' can long endure. We are met on a great battlefield of that' +
  ' war. We have come to dedicate a portion of that field, as' +
  ' a final resting place for those who here gave their lives' +
  ' that that nation might live. It is altogether fitting and' +
  ' proper that we should do this.' +
  ' But, in a larger sense, we can not dedicate, we can not' +
  ' consecrate, we can not hallow this ground. The brave' +
  ' men, living and dead, who struggled here, have' +
  ' consecrated it, far above our poor power to add or' +
  ' detract. The world will little note, nor long remember' +
  ' what we say here, but it can never forget what they' +
  ' did here. It is for us the living, rather, to be dedicated' +
  ' here to the unfinished work which they who fought' +
  ' here have thus far so nobly advanced. It is rather for' +
  ' us to be here dedicated to the great task remaining' +
  ' before us -- that from these honored dead we take' +
  ' increased devotion to that cause for which they gave' +
  ' the last full measure of devotion -- that we here highly' +
  ' resolve that these dead shall not have died in vain' +
  ' -- that this nation, under God, shall have a new birth' +
  ' of freedom -- and that government of the people, by' +
  ' the people, for the people, shall not perish from the' +
  ' earth.';


longestSentence(longText);

longestSentence('');

longestSentence('whatever this might be');

longestSentence('wohoo!!!');

longestSentence('what???');

longestSentence('that I am not sure...');

