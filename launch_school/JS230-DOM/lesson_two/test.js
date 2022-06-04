'use strict';

function displayAlert(event) {
  let message = document.getElementById('message').value;
  alert(message);
}

document.addEventListener('DOMContentLoaded', () => {
  let button = document.getElementById('alert');
  button.addEventListener('click', displayAlert);
});

let promise = new Promise((res, rej) => {
  let a;

  setTimeout(() => {
    a = Math.floor(Math.random() * 10) + 1;

    if (a <= 5) {
      res(a);
    } else {
      rej('number is larger than 5')
    }
  }, 3000);
});

//promise.then((value) => console.log("the random number is " + value))
//     .catch((value) => console.log("error, error " + value));

async function checkRandom() {
  try {
    let num = await promise;
    console.log("The random number is " + num);
  } catch(error) {
    console.log("error, error " + error);
  }
}

checkRandom();

console.log(promise);

setTimeout(() => console.log(promise), 3000)
