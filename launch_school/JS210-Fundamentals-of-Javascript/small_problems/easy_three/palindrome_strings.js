'use strict';

function isPalindrome(string) {
  let reverseString = [...string].reverse().join('');

  let result = string === reverseString;
  console.log(result);
  return result;
}

function isRealPalindrome(string) {
  let alphaNumericString = string.toLowerCase().replace(/[^a-z0-0]/g, '');

  return isPalindrome(alphaNumericString);
}

isPalindrome('madam');               // true
isPalindrome('Madam');               // false (case matters)
isPalindrome("madam i'm adam");      // false (all characters matter)
isPalindrome('356653');              // true

console.log('-'.repeat(40));

isRealPalindrome('madam');               // true
isRealPalindrome('Madam');               // true (case does not matter)
isRealPalindrome("Madam, I'm Adam");     // true (only alphanumerics matter)
isRealPalindrome('356653');              // true
isRealPalindrome('356a653');             // true
isRealPalindrome('123ab321');            // false
