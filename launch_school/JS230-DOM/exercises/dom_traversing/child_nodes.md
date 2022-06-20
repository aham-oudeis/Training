how many child nodes does each of the element have?

```html
<div id="1">
  <h1 id="2">Hello, <em id="3">World</em></h1>
  <p id="4">
    Welcome to wonderland. This is an
    <span id="5">awesome</span> place.
  </p>
  <a href="#" id="6"><strong id="7">Enter</strong></a>
  <div id="8"><p id="9"><a href="#" id="10">Go back</a></p></div>
</div>
```

div with id 1 has the following children, including non element nodes:
1. empty text node before h1
2. h1
  h1 has following child nodes:
  -text node
  -em node, which in turn has
    -text node
3. empty text node after and before p
4. p
  p has the following children nodes:
  -text node that includes the line break and the text bc they are contiguous
  -span element
  -another text node
5. empty text node after p and before a
6. anchor node, i.e, a
  a has the following children nodes:
  -strong element, which has the following 
    -text element
7. empty text node after a and before div with id 8
8. div with id 8
  div8 has the following children nodes:
  -p element, which in term has:
    -a element
9. another empty text node bc of the line break

write code that returns the number of direct and indirect child nodes for a 
given parent node as an array
```javascript
function childNodes(num) {
  let targetNode = document.querySelector(`#d${num}`);

  const numOfChildren = (node) => {
    return node.childNodes.length;
  };

  const numOfDescendants = (node, total=0) => {
    let directChildren = node.childNodes;

    if (directChildren === 0) return total;

    return Array.prototype.reduce.call(directChildren, (acc, curr) => {
      return acc + numOfDescendants(curr);
    }, directChildren.length); 
  }

  let directChildren = numOfChildren(targetNode);

  return [directChildren, numOfDescendants(targetNode) - directChildren];
}

childNodes(1);
//=> [9, 12]
childNodes(2);
//=> [3, 1]
childNodes(9);
//[1, 1]
```
