function freqFirstLetter(arr) {
  function letterCount(arrayOfLetter) {
    const countLetters = (collection, item) => {
      collection[item] = collection[item] || 0;
      collection[item] += 1;
      return collection;
    }

    return arrayOfLetter.reduce(countLetters, {});
  }

  let firstLetters = arr.map(str => str[0]);

  let frequencyCount = letterCount(firstLetters);

  const maxFreqCount = (maxCountElement, element) => {
      if (frequencyCount[element] > frequencyCount[maxCountElement]) {
        return element;
      } else {
        return maxCountElement;
      }
    }

  return firstLetters.reduce(maxFreqCount);
}
