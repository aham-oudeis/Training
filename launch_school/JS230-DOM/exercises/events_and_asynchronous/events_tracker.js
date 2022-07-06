'use strict';

let tracker = function() {
  let list = [];
  let elements = [];

  return {
    list() {
      return list.slice();
    },
    elements() {
      return elements.slice();
    },
    clear() {
      list = [];
      elements = [];
      return list.length;
    },
    add(event) {
      list.push(event);
      elements.push(event.currentTarget);
    }
  }
}();

let track = function(callback) {
  return function(e) {
    tracker.add(e);
    return callback(e);
  }
}

document.addEventListener('DOMContentLoaded', () => {
  let divRed = document.getElementById('red');
  let divBlue = document.getElementById('blue');
  let divOrange = document.getElementById('orange');
  let divGreen = document.getElementById('green');

  divRed.addEventListener('click', track(event => {
    document.body.style.background = 'red';
  }));

  divBlue.addEventListener('click', track(event => {
    event.stopPropagation();
    document.body.style.background = 'blue';
  }));

  divOrange.addEventListener('click', track(event => {
    document.body.style.background = 'orange';
  }));

  divGreen.addEventListener('click', track(event => {
    document.body.style.background = 'green';
  }));
})
