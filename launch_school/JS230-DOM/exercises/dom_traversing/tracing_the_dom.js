function domTreeTracer(id) {
  let currNode = document.getElementById(id);

  const getChildrenTagNames = (node) => {
    let children = node.children;

    return Array.prototype.map.call(children, (childNode) => childNode.tagName);
  };

  let domTracer = [];
  let parent = currNode.parentNode;

  while (currNode.tagName !== 'BODY') {
    domTracer.push(getChildrenTagNames(parent));
    currNode = parent;
    parent = currNode.parentNode;
  };

  return domTracer;
}
