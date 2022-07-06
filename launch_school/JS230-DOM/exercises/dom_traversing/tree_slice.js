function sliceTree(start, end) {
  let bottom = document.getElementById(end);
  let up = document.getElementById(start);

  if (bottom === null || up === null) return;

  let trace = [];
  let parent;
  let connected;

  do {
    parent = bottom.parentNode;
    trace.push(bottom.tagName);

    if (bottom === up) {
      connected = true;
      break;
    }

    bottom = parent;

  } while (parent.tagName !== 'BODY')

  if (connected === true) {
    return trace.reverse();
  }

  return;
}
