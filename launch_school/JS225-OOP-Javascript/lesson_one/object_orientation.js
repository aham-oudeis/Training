'use strict';

let scissorsId = 0;
let scissorsName = 'Scissors';
let scissorsStock = 8;
let scissorsPrice = 10;

let drillId = 1;
let drillName = 'Cordless Drill';
let drillStock = 15;
let drillPrice = 45;

function createItem(id, name, stock, price) {
  return {
    id,
    name,
    stock,
    price,
    describe() {
      const p = (str) => console.log('=>', string);
      p(`Name: ${this.name}`);
      p(`Id: ${this.id}`);
      p(`Price: ${this.price}`);
      p(`Stock: ${this.stock}`);
    },
    setPrice(amount) {
      if (amount < 0) {
        console.log('Invalid Price');
      } else {
        this.price = amount;
      }
    }
  }
}

let scissors = createItem(0, 'Scissors', 8, 10);
let cordlessDrill = createItem(1, 'Cordless Drill', 15, 45);

function updatePrice(obj, newPrice) {
  if (newPrice < 0) console.log('The price is invalid');
  if (newPrice >= 0) {
    obj.price = newPrice;
  }
}
