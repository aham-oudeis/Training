document.addEventListener('DOMContentLoaded', () => {
  const LOWER_BOUND = 1;
  const UPPER_BOUND = 100;

  const randomNumber = (lower, upper) => {
    return Math.floor(Math.random() * upper) + lower;
  };

  let displayParagraph = document.querySelector('p');
  let submitForm = document.querySelector('fieldset')
                           .lastElementChild;
  let inputBox = submitForm.previousElementSibling;
  let newGameLink = document.querySelector('a');

  let answer;
  let numberOfGuess;

  const displayMsg = (message) => {
    displayParagraph.textContent = message;
  };

  const resetInput = () => {
    inputBox.value = "";
  };
  const newGame = () => {
    let prompt = `Create a number from ${LOWER_BOUND} to ${UPPER_BOUND}`;
    answer = randomNumber(LOWER_BOUND, UPPER_BOUND);
    numberOfGuess = 0;
    displayMsg(prompt);
    resetInput();
  };

  newGame();

  const resultMsg = (guess) => {
    guess = parseInt(guess);

    const isValidGuess = () => {
      return guess < 100 && guess > 0;
    };

    if (!isValidGuess()) {
      return "Invalid input. Please enter a number from 1 to 100";
    }

    if (guess > answer) {
      return `My number is less than ${guess}`
    }

    if (guess < answer) {
      return `My number is higher than ${guess}`
    }

    if (guess === answer) {
      return `You guessed it! It took you ${numberOfGuess} guesses.`
      submitForm.disabled = true;
    }
  };

  submitForm.addEventListener('click', (event) => {
    event.preventDefault();
    let guessInput = inputBox.value;

    numberOfGuess++;
    displayMsg(resultMsg(guessInput));
    resetInput();
  });

  newGameLink.addEventListener('click', (event) => {
    event.preventDefault();
    newGame();
  });
})
