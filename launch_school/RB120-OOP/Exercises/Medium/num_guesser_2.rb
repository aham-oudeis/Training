class GuessingGame
  attr_reader :number, :times, :range

  def initialize(low, high)
    @range = (low..high)
    @number = rand(100)
    @times = Math.log2(@range.size).to_i + 1
  end

  def play
    reset
    return out_of_guesses if times.zero?
    display_remaining_guesses
    guess = ask_until_valid
    return winner if guess == number
    system('clear')
    evaluate(guess)
    play
  end

  def display_remaining_guesses
    correct_noun = (times == 1 ? "guess" : "guesses")
    puts "You have #{times} #{correct_noun} remaining."
  end

  def ask_until_valid
    guess = nil
    loop do
      print "Enter a number between #{range.first} and #{range.last}: "
      guess = gets.strip.to_i
      break if range.include?(guess)
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
    @number = rand(range)
  end
end

game = GuessingGame.new(500, 1500)
game.play