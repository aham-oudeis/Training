function concat(arr, obj) {
  if (Array.isArray(obj)) {
    return arr.concat(obj);
  } else {
    let newArr = arr.slice();
    newArr.push(obj);
    return newArr;
  }
}

//more concise

let concatSpecial(arr, obj) {
  return [arr, obj].flat();
}
