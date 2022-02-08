function reverse(input) {
  let collection = [];
  for (let i = input.length - 1; i >= 0; i--) {
    collection.push(input[i]);
  }

  return Array.isArray(input) ? collection : collection.join();
}
