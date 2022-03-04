function sum(num) {
  return String(num).split('').reduce((total, item) => total + Number(item), 0);
}

console.log(sum(23));
console.log(sum(489));
console.log(sum(123456789));
