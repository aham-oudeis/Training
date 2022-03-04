'use strict';

function substrings(string) {
  function leadingSubstrings(str) {
    let collection = [];

    [...str].reduce((acc, char) => {
      collection.push(acc);
      return acc + char;
    });

    collection.push(str);

    return collection;
  }

  let allSubstrings = [];

  for (let index = 0; index < string.length; index++) {
    let subString = string.slice(index);
    allSubstrings = allSubstrings.concat(leadingSubstrings(subString));
  }

  return allSubstrings;
}

substrings('abcde');
