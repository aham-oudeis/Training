function arrayToNodes(nodesArr, currentNode) {
  //clear the previous DOM tree
  if (currentNode === undefined && document.body) {
    document.body.remove();
  }

  if (nodesArr.length === 0) return;

  currentNode ||= document.lastChild;

  let elementType = nodesArr[0].toLowerCase();
  let currentElement = document.createElement(nodesArr[0]);

  currentNode.appendChild(currentElement);

  //now move to the children part
  //break the problem in terms of iteration and call the function recursively
  let nextChildren = nodesArr[1];
  currentNode = currentElement;

  nextChildren.forEach(nodesArr => {
    arrayToNodes(nodesArr, currentNode);
  })
}
