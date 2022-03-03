function anagrams(word, list) {
  let sortedWord = [...word].sort().join('');

  const isAnagram = (str) => {
    return sortedWord === [...str].sort().join('');
  };

  return list.filter(isAnagram);
}

console.log(anagrams('listen', ['enlists', 'google', 'inlets', 'banana']));  // [ "inlets" ]
console.log(anagrams('listen', ['enlist', 'google', 'inlets', 'banana']));   // [ "enlist", "inlets" ]
