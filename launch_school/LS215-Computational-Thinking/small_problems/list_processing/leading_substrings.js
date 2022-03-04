function leadingSubstrings(string) {
  let collection = [];

  [...string].reduce((acc, char) => {
    collection.push(acc);
    return acc + char;
  });

  collection.push(string);

  console.log(collection);
  return collection;
}

leadingSubstrings('abc');      // ["a", "ab", "abc"]
leadingSubstrings('a');        // ["a"]
leadingSubstrings('xyzzy');    // ["x", "xy", "xyz", "xyzz", "xyzzy"]
