class Player
  CHOICES = ['rock', 'paper', 'scissors']

  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    designator = ''
    loop do
      puts "Please enter your name."
      designator = gets.chomp
      break unless designator.empty?
    end
    self.name = designator.capitalize
  end

  def choose
    self.move = valid_choice
  end

  def valid_choice
    puts "Please choose rock, paper, or scissors:"
    choice = gets.chomp.strip.downcase
    return choice if CHOICES.include?(choice)
    puts "Sorry, Invalid Choice. Try again!"

    valid_choice
  end
end

class Computer < Player
  def set_name
    self.name = ["Hal", "Pal", "Alpha", "Omega"].sample
  end

  def choose
    self.move = CHOICES.sample
  end
end

class RPSGame
  WIN_COMBINATIONS = { 'rock' => 'scissors',
                       'scissors' => 'paper',
                       'paper' => 'rock' }

  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def play
    system('clear')
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      break unless play_again?
      system('clear')
    end
    display_goodbye_message
  end

  private

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, #{human.name}!"\
    " You're playing against #{computer.name}."
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Papers, Scissors. Goodbye!"
  end

  def display_moves
    puts
    puts "==> #{human.name} chose #{human.move}."\
    " #{computer.name} chose #{computer.move}."
    puts
  end

  def display_winner
    if human.move == computer.move
      puts "\t******It's a tie!******"
    elsif WIN_COMBINATIONS[human.move] == computer.move
      puts "\t******#{human.name} won!******"
    else
      puts "\t******#{computer.name} won!******"
    end
    puts
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n."
    end
    answer.downcase == 'y'
  end
end

RPSGame.new.play
