function nodesToArr() {
  let arr = [];

  const generateArr = (node, array) => {
    let containerForChildren = [];
    array.push(node.tagName, containerForChildren);

    let children = Array.from(node.children);

    children.forEach((child, idx) => {
      containerForChildren[idx] = [];

      generateArr(child, containerForChildren[idx]);
    });
  }

  generateArr(document.body, arr);

  return arr;
 }
