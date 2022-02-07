/*
function indexOf(firstString, secondString) {
  if (RegExp(secondString).test(firstString)) {
    let lenOfString = firstString.length;
    let lenOfSubStr = secondString.length;
    let limitIdx = lenOfString - lenOfSubStr;

    for (i = 0; i <= limitIdx; i++) {
      let subStr = firstString.slice(i, (i + lenOfSubStr));
      if (subStr === secondString) {
        console.log(i);
        return i;
      }
    }
  }
  console.log(-1);
  return -1;
}
*/

function indexOf(firstString, secondString) {
  let lenOfString = firstString.length;
  let lenOfSubStr = secondString.length;
  let limitIdx = lenOfString - lenOfSubStr;

  for (i = 0; i <= limitIdx; i++) {
    let subStr = '';
    let j = 0;

    do {
      subStr += firstString[j + i];
      j++;
    } while (j < lenOfSubStr);

    if (subStr === secondString) {
      console.log(i);
      return i;
    }
  }

  console.log(-1);
  return -1;
}

/*
function lastIndexOf(firstString, secondString) {
   if (RegExp(secondString).test(firstString)) {
    let lenOfString = firstString.length;
    let lenOfSubStr = secondString.length;
    let limitIdx = lenOfString - lenOfSubStr;

    for (i = limitIdx; i >= 0; i--) {
      let subStr = firstString.slice(i, (i + lenOfSubStr));
      if (subStr === secondString) {
        console.log(i);
        return i;
      }
    }
   }
  console.log(-1);
  return -1;
}
*/

function lastIndexOf(firstString, secondString) {
  let lenOfString = firstString.length;
  let lenOfSubStr = secondString.length;
  let limitIdx = lenOfString - lenOfSubStr;

  for (i = limitIdx; i >=; i++) {
    let subStr = '';
    let j = 0;

    do {
      subStr += firstString[j + i];
      j++;
    } while (j < lenOfSubStr);

    if (subStr === secondString) {
      console.log(i);
      return i;
    }
  }

  console.log(-1);
  return -1;
}
indexOf('Some strings', 's');                      // 5
indexOf('Blue Whale', 'Whale');                    // 5
indexOf('Blue Whale', 'Blute');                    // -1
indexOf('Blue Whale', 'leB');                      // -1

lastIndexOf('Some strings', 's');                  // 11
lastIndexOf('Blue Whale, Killer Whale', 'Whale');  // 19
lastIndexOf('Blue Whale, Killer Whale', 'all');    // -1
