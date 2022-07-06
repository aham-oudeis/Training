function nodeSwap(firstId, secondId) {
  console.log(firstId, secondId);

  let first = document.getElementById(firstId);

  let second = document.getElementById(secondId);

  if (isDescendentOf(first, second) || isDescendentOf(second, first)) {
    return undefined;
  }

  let firstClone = first.cloneNode(true);
  let secondClone = second.cloneNode(true);
  let firstParent = first.parentNode;
  let secondParent = second.parentNode;

  firstParent.replaceChild(secondClone, first);
  secondParent.replaceChild(firstClone, second);

  return true;
}

function isDescendentOf(first, second) {
  while (second !== document.body || second !== first) {
    let parent = second.parentNode;
    second = parent;
  }

  return second === first;
}
