function concat(...args) {
  let collection = [];

  for (let i = 0; i < args.length; i++) {
    if (Array.isArray(args[i])) {
      args[i].forEach( x => collection.push(x));
    } else {
      collection.push(args[i]);
    }
  }

  return collection;
}
