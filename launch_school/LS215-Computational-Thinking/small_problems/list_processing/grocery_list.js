function buyFruit(list) {
  let groceryList = [];

  list.forEach(grocery => {
    let quantity = grocery[1];
    let fruit = grocery[0];

    while (quantity > 0) {
      groceryList.push(fruit);
      quantity -= 1;
    }
  });

  console.log(groceryList);
  return groceryList;
}

buyFruit([['apple', 3], ['orange', 1], ['banana', 2]]);
// returns ["apple", "apple", "apple", "orange", "banana", "banana"]
