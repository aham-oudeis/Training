'use strict';

import debounce from './debounce.js';

class Autocomplete {
  #url;
  #input;
  #listUI;
  #overlay;
  bestMatchIndex;
  visible = false;
  matches = [];

  constructor() {
    this.#input = document.querySelector('input');
    this.#url = '/countries?matching=';

    this.wrapInput();
    this.createUI();
    this.bindEvents();
    this.reset();
  }

  draw() {
    while (this.#listUI.lastChild) {
      this.#listUI.removeChild(this.#listUI.lastChild);
    }

    if (!this.visible) {
      this.overlay.textContent = '';
      return;
    }

    if (this.bestMatchIndex !== null && this.matches.length !== 0) {
      let selected = this.matches[this.bestMatchIndex];
      this.overlay.textContent = this.generateOverlayContent(this.input.value, selected);
    } else {
      this.overlay.textContent = '';
    }

    this.matches.forEach(match => {
      let li = document.createElement('li');
      li.classList.add('autocomplete-ui-choice');

      li.textContent = match.name;
      this.#listUI.appendChild(li);
    });
  }

  generateOverlayContent(value, match) {
    let end = match.name.substr(value.length);
    return value + end;
  }

  reset() {
    this.visible = false;
    this.matches = [];
    this.bestMatchIndex = null;

    this.draw();
  }

  bindEvents() {
    this.#input.addEventListener('input', this.valueChanged.bind(this));
  } 

  fetchMatches(query, callback) {
    let request = new XMLHttpRequest();

    request.addEventListener('load', () => {
      callback(request.response);
    });

    request.open('GET', `${this.#url}${encodeURIComponent(query)}`);
    request.responseType = 'json';
    request.send();
  }

  valueChanged() {
    let value = this.#input.value;

    if (value.length > 0) {
      const drawMatches = matches => {
        this.visible = true;
        this.matches = matches;
        this.bestMatchIndex = 0;
        this.draw();
      };

      this.fetchMatches(value, drawMatches);
    } else  {
      this.reset();
    }
  } 

  wrapInput() {
    let wrapper = document.createElement('div');
    wrapper.classList.add('autocomplete-wrapper');
    this.#input.parentNode.appendChild(wrapper);
    wrapper.appendChild(this.#input);
  }
  
  createUI() {
    let listUI = document.createElement('ul');
    listUI.classList.add('autocomplete-ui');
    this.#input.parentNode.appendChild(listUI);
    this.#listUI = listUI;

    let overlay = document.createElement('div');
    overlay.classList.add('autocomplete-overlay');
    overlay.style.width = `${this.#input.clientWidth}px`;

    this.#input.parentNode.appendChild(overlay);
    this.#overlay = overlay;
  }
}
/*
import debounce from './debounce.js';

const Autocomplete = {
  wrapInput: function() {
    let wrapper = document.createElement('div');
    wrapper.classList.add('autocomplete-wrapper');
    this.input.parentNode.appendChild(wrapper);
    wrapper.appendChild(this.input);
  },

  createUI: function() {
    let listUI = document.createElement('ul');
    listUI.classList.add('autocomplete-ui');
    this.input.parentNode.appendChild(listUI);
    this.listUI = listUI;

    let overlay = document.createElement('div');
    overlay.classList.add('autocomplete-overlay');
    overlay.style.width = `${this.input.clientWidth}px`;

    this.input.parentNode.appendChild(overlay);
    this.overlay = overlay;
  },

  bindEvents: function() {
    this.input.addEventListener('input', this.valueChanged);
    this.input.addEventListener('keydown', this.handleKeydown.bind(this));
    this.listUI.addEventListener('click', this.handleMouseClick.bind(this));
  },

  handleKeydown: function(event) {
    switch(event.key) {
      case 'ArrowDown':
        console.log('User pressed ArrowDown');
        event.preventDefault();
        if (this.selectedIndex === null ||
          this.selectedIndex === this.matches.length - 1) {
          this.selectedIndex = 0;
        } else {
          this.selectedIndex += 1;
        }

        this.bestMatchIndex = null;
        this.draw();
        break;
      case 'ArrowUp':
        console.log('User pressed ArrowUp');
        event.preventDefault();
        if (this.selectedIndex === null || this.selectedIndex === 0) {
          this.selectedIndex = this.matches.length - 1;
        } else {
          this.selectedIndex -= 1;
        }
        this.bestMatchIndex = null;
        this.draw();
        break;
      case 'Tab':
        if (this.bestMatchIndex !== null && this.matches.length !== 0) {
          this.input.value = this.matches[this.bestMatchIndex].name;
          event.preventDefault();
        }
        this.reset();
        break;
      case 'Enter':
        this.reset();
        break;
      case 'Escape':
        this.input.value = this.previousValue;
        this.reset();
        break;
    }
  },

  handleMouseClick: function(event) {
    this.input.value = event.target.textContent;
    this.reset();
  },

  fetchMatches: function(query, callback) {
    let request = new XMLHttpRequest();

    request.addEventListener('load', () => {
      callback(request.response);
    });

    request.open('GET', `${this.url}${encodeURIComponent(query)}`);
    request.responseType = 'json';
    request.send();
  },

  draw: function() {
    while (this.listUI.lastChild) {
      this.listUI.removeChild(this.listUI.lastChild);
    }

    if (!this.visible) {
      this.overlay.textContent = '';
      return;
    }

    if (this.bestMatchIndex !== null && this.matches.length !== 0) {
      let selected = this.matches[this.bestMatchIndex];
      this.overlay.textContent = this.generateOverlayContent(this.input.value, selected);
    } else {
      this.overlay.textContent = '';
    }

    this.matches.forEach((match, index) => {
      let li = document.createElement('li');
      li.classList.add('autocomplete-ui-choice');

      if (index === this.selectedIndex) {
        li.classList.add('selected');
        this.input.value = match.name;
      }
      li.textContent = match.name;
      this.listUI.appendChild(li);
    });
  },

  generateOverlayContent: function(value, match) {
    let end = match.name.substr(value.length);
    return value + end;
  },

  reset: function() {
    this.visible = false;
    this.matches = [];
    this.bestMatchIndex = null;
    this.selectedIndex = null;
    this.previousValue = null;

    this.draw();
  },

  valueChanged: function() {
    let value = this.input.value;
    this.previousValue = value;

    if (value.length > 0) {
      this.fetchMatches(value, matches => {
        this.visible = true;
        this.matches = matches;
        this.bestMatchIndex = 0;
        this.selectedIndex = null;
        this.draw();
      });
    } else {
      this.reset();
    }
  },

  init: function() {
    this.input = document.querySelector('input');

    this.url = '/countries?matching=';

    this.listUI = null;
    this.overlay = null;

    this.visible = false;
    this.matches = [];

    this.wrapInput();
    this.createUI();

    this.valueChanged = dobounce(this.valueChanged.bind(this), 300);

    this.bindEvents();

    this.reset();
  }
};

document.addEventListener('DOMContentLoaded', () => {
  Autocomplete.init();
})

*/

document.addEventListener('DOMContentLoaded', () => {
  new Autocomplete() 
})
