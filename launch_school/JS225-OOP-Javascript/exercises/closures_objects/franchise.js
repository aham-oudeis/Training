'use strict';
/*
const franchise = {
  name: 'How to Train Your Dragon',
  allMovies() {
    //since arrow functions inherit the value of this from their lexical scope
    //using an arrow function as a callback returns the desired array
    return [1, 2, 3].map((number) => {
      return `${this.name} ${number}`;
    });
  },
};
*/

const franchise = {
  name: 'How to Train Your Dragon',
  allMovies() {
    return [1, 2, 3].map((function(number) {
      return `${this.name} ${number}`;
    }).bind(this));
  },
};


console.log(franchise.allMovies());
