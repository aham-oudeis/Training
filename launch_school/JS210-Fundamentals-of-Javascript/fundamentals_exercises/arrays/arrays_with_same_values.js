function areArraysEqual(arr1, arr2) {
  if (arr1.length !== arr2.length) {
    return false;
  }

  arr1 = arr1.slice().sort();
  arr2 = arr2.slice().sort();

  for (let i = 0; i < arr1.length; i++) {
    if (arr1[i] !== arr2[i]) {
      return false;
    }
  }

  return true;
}

//since sort is a rather expensive operation, we could also check if each element is in the other
//array and keep deleting the found element.  That way, we make sure that [1, 1, 2, 2, 2] does
//not equal to [1, 1, 1, 2, 2]. Every time there is a match, delete the found element from that
// index. Given the profilic use of deletion of the element, it might also be a rather expensive
// operation.
//

