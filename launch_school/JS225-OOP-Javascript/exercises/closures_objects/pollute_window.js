'use strict';


const greeter = function () {
  var name = 'Naveed';
  var greeting = 'hello';

  return {
  message: `${greeting} ${name}!`,
  sayGreetings() {
    console.log(this.message);
    }
  }
}();

greeter.sayGreetings();
