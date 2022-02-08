function slice(array, begin, end) {
  if (end > array.length) {
    end = array.length;
  }

  let collection = [];

  for (let i = begin; i < end; i++) {
    collection.push(array[i]);
  }

  return collection;
}

function splice(arr, start, deleteCount, ...items) {
  if (start > arr.length) {
    start = arr.length;
  }

  let splicedArr = arr.slice(start, (start + deleteCount));
  let remainderElements = arr.slice(start + deleteCount);

  arr.length = start;

  if (items.length > 0) {
    for (let i = 0; i < items.length; i++) {
      arr.push(items[i]);
    }
  }

  for (let i = 0; i < remainderElements.length; i++) {
    arr.push(remainderElements[i]);
  };

  return splicedArr;
}
