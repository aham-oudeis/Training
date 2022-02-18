'use strict';

function cleanUp(string) {
  return string.replace(/[^A-Za-z]+/g, ' ');
}

console.log(cleanUp("---what's my +*& line?"));
