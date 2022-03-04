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

function palindromes(string) {
  function isPalindrome(str) {
    if (str.length === 1) {
      return false;
    }

    return str === [...str].reverse().join('');
  }

  string = string.toLowerCase();

  let allSubStrings = substrings(string);

  let listOfPalindromes = allSubStrings.filter(subStr => isPalindrome(subStr));

  console.log(listOfPalindromes);
  return listOfPalindromes;
}

palindromes('abcd');       // []
palindromes('madam');      // [ "madam", "ada" ]

palindromes('hello-madam-did-madam-goodbye');
/* returns
[ "ll", "-madam-", "-madam-did-madam-", "madam", "madam-did-madam", "ada",
  "adam-did-mada", "dam-did-mad", "am-did-ma", "m-did-m", "-did-", "did",
  "-madam-", "madam", "ada", "oo" ]
*/
palindromes('knitting cassettes');
// returns
// [ "nittin", "itti", "tt", "ss", "settes", "ette", "tt" ]
