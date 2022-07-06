function randomizer(callbackList) {
  let durationSeconds = 2 * callbackList.length;

  const randomTime = () => Math.floor(Math.random() * durationSeconds * 1000);

  let secondsElapsed = 0;

  const loggerId = setInterval(() => {
    secondsElapsed++;
    console.log(secondsElapsed);

    if (secondsElapsed >= durationSeconds) {
      clearInterval(loggerId);
    }
  }, 1000);

  callbackList.forEach(callback => {
    setTimeout(callback, randomTime());
  })
}
