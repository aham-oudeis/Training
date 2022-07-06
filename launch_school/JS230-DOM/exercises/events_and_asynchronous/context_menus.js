'use strict';

document.addEventListener('DOMContentLoaded', () => {
  document.getElementById('sub').addEventListener('contextmenu', (e) => {
    e.preventDefault();
    e.stopPropagation();
    alert('sub');
  });

  document.querySelector('main').addEventListener('contextmenu', (e) => {
    e.preventDefault();
    alert('main');
  })
})
