'use strict';

function isItemAvailable(itemId, transactions) {
  let selectTransactions = transactions.filter(({id}) => id === itemId);
  const availabeQuantity = (acc, {movement, quantity}) => {
    if (movement === 'in') {
      return acc + quantity;
    } else {
      return acc - quantity;
    }
  };

  let inStock = selectTransactions.reduce(availabeQuantity, 0);

  return inStock > 0;
}

const transactions = [ { id: 101, movement: 'in',  quantity:  5 },
                       { id: 105, movement: 'in',  quantity: 10 },
                       { id: 102, movement: 'out', quantity: 17 },
                       { id: 101, movement: 'in',  quantity: 12 },
                       { id: 103, movement: 'out', quantity: 15 },
                       { id: 102, movement: 'out', quantity: 15 },
                       { id: 105, movement: 'in',  quantity: 25 },
                       { id: 101, movement: 'out', quantity: 18 },
                       { id: 102, movement: 'in',  quantity: 22 },
                       { id: 103, movement: 'out', quantity: 15 }, ];

console.log(isItemAvailable(101, transactions));     // false
console.log(isItemAvailable(105, transactions));     // true
