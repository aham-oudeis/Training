function startsWith(string, searchString) {
  if (!searchString) {
    console.log(true);
    return true;
  }

  let subStrLen = searchString.length;

  for (let i = 0; i < subStrLen; i++) {
    if (string[i] !== searchString[i]) {
      console.log(false);
      return false;
    }
  }

  console.log(true);
  return true;
}


let str = 'We put comprehension and mastery above all else';
let longerString = 'We put comprehension and mastery above all else!';

startsWith(str, longerString);      // false
startsWith(str, 'We');              // true
startsWith(str, 'We put');          // true
startsWith(str, '');                // true
startsWith(str, 'put');             // false


