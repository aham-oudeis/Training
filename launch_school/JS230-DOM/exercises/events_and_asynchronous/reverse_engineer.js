//refactor the following code
document.querySelector('html').addEventListener('click', () => {
  document.querySelector('#container').style = 'display: none';
});

document.querySelector('#container').addEventListener('click', event => {
  event.stopPropagation();
});

//refactored code

document.querySelector('html').addEventListener('click', (e) => {
  if (e.target.id === 'container') return;
  e.target.style = 'display: none';
});
