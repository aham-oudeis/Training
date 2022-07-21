'use strict';

function findItems() {
  let listOfInputs = Array.from(document.querySelectorAll('input'));
  let checked = [];
  let unchecked = [];

  listOfInputs.forEach(inputEl => {
    let text = inputEl.parentNode.textContent.trim();
    if (inputEl.checked) checked.push(text);
    if (!inputEl.checked) unchecked.push(text);
  });

  return [checked, unchecked];
}

/*
document.addEventListener('DOMContentLoaded', () => {
  let outerUl = document.querySelector('ul');

  function walkList(node=outerUl) {
    if (node.tagName === 'LI') console.log(node.firstChild.textContent.trim());

    let children = node.children;

    for (let idx = 0; idx < children.length; idx++) {
      walkList(children[idx]);
    }
  }

  walkList();
})
*/

document.addEventListener('DOMContentLoaded', () => {
  function rewrite() {
    let h2 = document.body.querySelector('h2');
    let frontPageDiv = document.body.querySelector('.front-page');
    let existingParagraph = frontPageDiv.lastElementChild;

    let h1 = document.createElement('h1');
    h1.textContent = "The Day's News";

    document.body.replaceChild(h1, h2);

    let article = document.createElement('article');
    article.classList.add('breaking');
    let firstParagraph = document.createElement('p');
    let secondParagraph = document.createElement('p');

    firstParagraph.textContent = "Fire breaks out at the old factory";

    let link = document.createElement('a');
    link.setAttribute('href', '/stories/15');
    link.textContent = "Read More";

    secondParagraph.appendChild(link);
    article.appendChild(firstParagraph);
    article.appendChild(secondParagraph);

    frontPageDiv.insertBefore(article, existingParagraph);
  }

  rewrite();
})
