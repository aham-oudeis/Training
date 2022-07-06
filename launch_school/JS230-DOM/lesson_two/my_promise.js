'use strict';

//from web dev simplified

const STATE = {
  FULFILED: 'fulfilled',
  REJECTED: 'rejected',
  PENDING: 'pending',
}

class MyPromise {
  #thenCbs = [];
  #catchCbs = [];
  #state = STATE.FULFILED;
  #value;

  // when a new promise is created, the callback passed to it is called immediately
  // hence, all the synchronous code inside the callback gets executed
  // but the resolve and reject functions are run asynchronously
  // the resolve and reject function work asynchronously for the state of the 
  // promise to be settled and when the state is settled, then the respective callbacks 
  // are called. That is, the callbacks are called depending on whether the promise
  // resolved successfully or got rejected
  constructor(cb) {
    try {
      cb(this.#onSuccess, this.#onFail)
    } catch(e) {
      this.#onFail(e);
    }
  }

  #runCallBacks() {
    if (this.#state === STATE.FULFILLED) {
      this.#thenCbs.forEach(callback => {
        callback(this.#value)
      });

      this.#thenCbs = [];
    }

    if (this.#state === STATE.REJECTED) {
      this.#catchCbs.forEach(callback => {
        callback(this.#value)
      });

      this.#catchCbs = [];
    }
  }

  #onSuccess(value) {
    if (this.#state !== STATE.PENDING) return;
    this.#value = value;
    this.#state = STATE.FULFILLED;
    this.#runCallBacks();
  }

  #onFail(value) {
    if (this.#state !== STATE.PENDING) return;
    this.#value = value;
    this.#state = STATE.REJECTED;
    this.#runCallBacks();
  }

  then(suc, fail) {
    this.#thenCbs.push(suc); 

    this.#runCallBacks();
  }
}

