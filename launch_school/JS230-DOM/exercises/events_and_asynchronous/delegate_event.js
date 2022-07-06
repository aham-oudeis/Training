'use strict';

function delegateEvent(parentElement, selector, eventType, callback) {
  if (parentElement) {
    parentElement.addEventListener(eventType, (e) => {
      e.stopPropagation();
      let validTargets = parentElement.querySelectorAll(selector);
      validTargets = Array.prototype.slice.call(validTargets);

      if (validTargets.includes(e.target)) return callback(e);
    });

    return true;
  }
}

