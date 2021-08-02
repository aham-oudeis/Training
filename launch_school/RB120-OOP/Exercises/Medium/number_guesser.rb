class GuessingGame
  attr_reader :number, :times

  def initialize
    @number = rand(100)
    @times = 7
  end

  def play
    reset
    return out_of_guesses if times.zero?
    puts "You have #{times} guesses remaining."
    guess = ask_until_valid
    return winner if guess == number
    system('clear')
    evaluate(guess)
    play
  end

  def ask_until_valid
    guess = nil
    loop do
      print "Enter a number between 1 and 100: "
      guess = gets.strip.to_i
      break if (1..100).include?(guess)
      print "Invalid guess. "
    end
    guess
  end

  def evaluate(guess)
    @times -= 1
    message = (guess < number ? "Number too low." : "Number too high.")
    puts message
  end

  def out_of_guesses
    puts "You are out of guesses. You lost!"
  end

  def winner
    puts "That's the number! You won!"
  end

  def reset
    @number = rand(100)
  end
end

game = GuessingGame.new
game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 104
# Invalid guess. Enter a number between 1 and 100: 50
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 75
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 85
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 0
# Invalid guess. Enter a number between 1 and 100: 80

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 81
# That's the number!

# You won!

# game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 50
# Your guess is too high.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 25
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 37
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 31
# Your guess is too low.

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 34
# Your guess is too high.

# You have 2 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have 1 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have no more guesses. You lost!