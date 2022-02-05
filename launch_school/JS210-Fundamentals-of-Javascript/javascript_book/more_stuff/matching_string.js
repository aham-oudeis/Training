let allMatches = function(words, pattern) {
  let matchingWords =
    words.filter(item => {
      return pattern.test(item);
    });
  return matchingWords;
}

let words = [
  'laboratory',
  'experiment',
  'flab',
  'Pans Labyrinth',
  'elaborate',
  'polar bear',
];

console.log(allMatches(words, /lab/)); // => ['laboratory', 'flab', 'elaborate']
