'use strict';

function longestNonrepeatingSubstring(string) {
  let longest = '';
  let currentSubStr = '';

  [...string].forEach(char => {
    if (currentSubStr.includes(char)) {
      let idx = [...currentSubStr].indexOf(char);

      if (longest.length < currentSubStr.length) {
        longest = currentSubStr;
      }

      currentSubStr = currentSubStr.slice(idx + 1);
    }

    currentSubStr += char;
  });

  if (longest.length < currentSubStr.length) {
    longest = currentSubStr;
  }

  return longest;
}

console.log(longestNonrepeatingSubstring("abcabcbb") == "abc")

console.log(longestNonrepeatingSubstring("aaaaaa") == "a")

console.log(longestNonrepeatingSubstring("abcde") === "abcde" )

console.log(longestNonrepeatingSubstring("abcda") == "abcd")
console.log(longestNonrepeatingSubstring("") == "")
console.log(longestNonrepeatingSubstring("1233") == "123")
console.log(longestNonrepeatingSubstring("abab") == "ab")
console.log(longestNonrepeatingSubstring("$b$da") == "b$da")
console.log(longestNonrepeatingSubstring("abbcda") == "bcda")
