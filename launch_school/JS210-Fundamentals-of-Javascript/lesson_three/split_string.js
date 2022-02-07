function splitString(string, delimiter) {
  let splitBYDelimiter = function (str, delimiter) {
    let subString = '';

    for (j = 0; j < string.length; j++) {
      if (delimiter !== string[j]) {
        subString += string[j];
       } else {
         console.log(subString);
         subString = '';
       }
      }

    if (subString !== '') {
      console.log(subString);
    }
  }

  let splitByCharacter = function(str) {
    for (i = 0; i < str.length; i++) {
      console.log(str[i]);
    }
  }

  if (delimiter === undefined) {
    console.log("ERROR: No delimiter");
  } else if (delimiter === '') {
    splitByCharacter(string);
  } else {
    splitBYDelimiter(string, delimiter);
  }
 }

splitString('abc,123,hello world', ',');
// logs:
// abc
// 123
// hello world

splitString('hello');
// logs:
// ERROR: No delimiter

splitString('hello', '');
// logs:
// h
// e
// l
// l
// o

splitString('hello', ';');
// logs:
// hello

splitString(';hello;', ';');
// logs:
//  (this is a blank line)
// hello
