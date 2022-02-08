function missing(arr) {
  let missingElements = [];
  let len = arr.length;

  if (len < 2) { return missingElements }

  for (let i = 0; i < len - 1; i++) {
    let nextElement = arr[i] + 1;
    while (arr.indexOf(nextElement) === -1) {
      missingElements.push(nextElement);
      nextElement += 1;
    }
  }

  return missingElements;
}

// better solution

let missing = (arr) => {
  //if arr were not to be sorted, we could start by sorting it
  let lowest = arr[0];
  let highest = arr.slice(-1)[0];

  let missingElements = [];

  for (let i = lowest; i < highest; i ++) {
    if (arr.includes(i)) continue;
    missingElements.push(i);
  }

  return missingElements;
}

missing([-3, -2, 1, 5]);                  // [-1, 0, 2, 3, 4]
missing([1, 2, 3, 4]);                    // []
missing([1, 5]);                          // [2, 3, 4]
missing([6]);                             // []
