'use strict';

function makeAccount(number) {
  let account = number;
  let balanceTotal = 0;
  let transactions = [];

  return {
    accountNumber() {
      return account;
    },

    balance() {
      return balanceTotal;
    },

    deposit(amount) {
      balanceTotal += amount;
      transactions.push({type: 'deposit', amount: amount});
      return amount;
    },

    withdraw(amount) {
      if (amount > balanceTotal) {
        amount = balanceTotal;
      }

      balanceTotal -= amount;
      transactions.push({type: 'withdraw', amount: amount});
      return amount;
    }
  }
}

function makeBank() {
  let accounts = [];

  return {
    openAccount() {
      let nextNum = accounts.length + 2375629;
      let minted = makeAccount(nextNum);
      accounts.push(minted);
      return minted;
    },

    transfer(source, destination, amount) {
      let send = source.withdraw(amount);
      destination.deposit(send);
      return send;
    }
  }
}

let bank = makeBank();
console.log(bank.accounts);

let source = bank.openAccount();
let destination = bank.openAccount();

console.log(source.deposit(12));
console.log(source.deposit(10));

bank.transfer(source, destination, 32);

console.log(source.balance());
console.log(destination.balance());
