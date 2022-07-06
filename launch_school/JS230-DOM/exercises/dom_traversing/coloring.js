function colorGeneration(num) {
  let start = document.body;

  let level = 1;
  let collection = Array.from(start.children);

  while (level !== num) {
    collection = collection.flatMap((node) => Array.from(node.children));
    level++
  }

  collection.forEach(node => {
    node.classList.add('generation-color');
  })
}
