function repeatedCharacters(string) {
  string = string.toLowerCase();
  let len = string.length;
  let collection = {};

  for (let i = 0; i < len; i++) {
    let char = string[i]
    if (collection[char]) {
      collection[char] += 1;
    } else {
      collection[char] = 1;
    }
  }

  let repeatedChars = {};

  for (let key in collection) {
    if (collection[key] > 1) {
      repeatedChars[key] = collection[key];
    }
  }

  console.log(repeatedChars);
  return repeatedChars;
}

repeatedCharacters('Programming');    // { r: 2, g: 2, m: 2 }
repeatedCharacters('Combination');    // { o: 2, i: 2, n: 2 }
repeatedCharacters('Pet');            // {}
repeatedCharacters('Paper');          // { p: 2 }
repeatedCharacters('Baseless');       // { s: 3, e: 2 }
