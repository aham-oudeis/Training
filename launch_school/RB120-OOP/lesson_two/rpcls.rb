class Banner
  SIZE = 60
  attr_reader :message, :width

  def initialize(message, width=SIZE)
    @message = message
    @width = width
  end

  def to_s
    [horizontal_rule, empty_line, message_line,
     empty_line, horizontal_rule].flatten.join("\n")
  end

  private

  def horizontal_rule
    "+-#{'-' * width}-+"
  end

  def empty_line
    "| #{' ' * width} |"
  end

  def message_line
    @message.chars.each_slice(width).map do |slices|
      "| " + slices.join.center(width) + " |"
    end
  end
end

module Changeable
  class Move
    OPTIONS = { "r" => "rock", "p" => "paper",
                "c" => "scissors", "l" => "lizard",
                "s" => "spock" }

    LOSES_TO = { 'r' => ['c', 'l'],
                 'p' => ['r', 's'],
                 'c' => ['p', 'l'],
                 'l' => ['s', 'p'],
                 's' => ['c', 'r'] }

    attr_reader :name

    def initialize(choice)
      @name = choice
    end

    def wins_over?(other)
      LOSES_TO[name].include?(other.name)
    end

    def ties_with?(other)
      name == other.name
    end

    def loses_to?(other)
      !ties_with?(other) && !wins_over?(other)
    end

    def to_s
      OPTIONS[name].upcase
    end
  end

  class Score
    attr_accessor :wins, :ties, :losses, :current_winner

    @@round = 0
    @@summary = {}

    def initialize
      @wins = 0
      @ties = 0
      @losses = 0
      @current_winner = nil
      @@round += 1
    end

    def self.summary
      @@summary
    end

    def self.round
      @@round
    end

    def self.store_info(score)
      summary[round] = score
    end
  end
end

module Displayable
  include Changeable

  SET_LIMIT = 5
  NUMBER_OF_MOVES = 5
  WIDTH = 25
  INTRO = <<-MSG
Welcome to Rock, Paper, Scissors, Lizard, Spock game!

  Rules: Rock crushes Scissors cuts Paper
  covers Rock crushes Lizard poisons Spock
  smashes Scissors decapitates Lizard eats
  Paper disproves Spock vaporizes Rock.

  For this game each one is represented as follows:
    Rock as       r
    Paper as      p
    SCissors as   c
    Lizard as     l
    Spock as      s

We shall play #{SET_LIMIT} number of sets in each round.

MSG

  def display_game_intro
    system('clear')
    display_welcome_message
  end

  def display_welcome_message
    puts INTRO
  end

  def display_parting_message
    system('clear')
    parting_msg = "Thank you for playing Rock, Papers, Scissors,"\
                  " Lizard, Spock game. Goodbye!"

    puts Banner.new(parting_msg, 65)
  end

  def display_history
    puts "#{name}'s choices:".ljust(WIDTH) +
         history[Score.round].to_s.rjust(WIDTH)
  end

  def display_moves
    puts "==> #{name} chose #{move}."
  end

  def display_record
    [human, computer].each(&:display_history)
    display_score
  end

  def display_verdict
    [human, computer].each(&:display_moves)
    display_winner
  end

  def display_winner
    verdict =
      if score.current_winner
        "So, #{score.current_winner.name} won!"
      else
        "So, it's a tie!"
      end
    print verdict + "\n"
  end

  def display_round_result
    display_record
    result =
      if score.wins == score.losses
        "****** This round is tied! ******"
      elsif score.wins > score.losses
        "****** #{human.name} won this round! ******"
      else
        "****** #{computer.name} won this round! ******"
      end
    puts Banner.new(result)
  end

  def display_round_info
    Score.summary.each do |round, scores|
      puts "|Round #{round}|  Wins: #{scores.wins}  ||"\
           " Losses: #{scores.losses} || Ties: #{scores.ties}"
    end
  end

  def display_score
    puts
    display_round_info
    puts "|Round #{Score.round}|  Wins: #{score.wins}"\
         "  || Losses: #{score.losses} || Ties: #{score.ties}"
  end

  def play_again?
    answer = nil
    loop do
      puts "==> Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n."
    end
    answer.downcase == 'y'
  end

  def sleep_until_enter
    puts
    print "Press ENTER to continue..."
    response = gets.chomp
    sleep unless response
  end
end

module Customizable
  class ComputerPersonalities
    FREQUENCY_OF_CHOICE = 15
    attr_accessor :title, :options, :loves, :hates

    def initialize(dislikes, loves, title)
      @loves = loves
      @dislikes = dislikes
      @title = title
      @options = chooses_from(dislikes, loves)
    end

    def choose
      options.sample
    end

    private

    def chooses_from(dislikes, loves)
      combinations = Changeable::Move::OPTIONS.keys.combination(3)
      selection =
        combinations.reject { |list| list.include?(dislikes) }.flatten
      FREQUENCY_OF_CHOICE.times { selection << loves }
      selection
    end
  end

  class Petra < ComputerPersonalities
    def initialize
      super('l', 'r', "Petra")
    end
  end

  class Sauran < ComputerPersonalities
    def initialize
      super('s', 'l', "Sauran")
    end
  end

  class Chartam < ComputerPersonalities
    def initialize
      super('c', 'p', "Chartam")
    end
  end

  class Cutter < ComputerPersonalities
    def initialize
      super('l', 'c', "Cutter")
    end
  end

  class Vulcan < ComputerPersonalities
    def initialize
      super('l', 's', "Vulcan")
    end
  end

  class Omega < ComputerPersonalities
    def initialize
      super('p', 's', "Omega")
    end
  end

  class Player
    include Changeable
    include Displayable
    attr_accessor :name, :move, :history, :personality

    def initialize
      @history = Hash.new([])
      determine_name
    end

    def update_history
      if history[Score.round].empty?
        history[Score.round] = [move.name]
      else
        history[Score.round] << move.name unless move.name.eql?('q')
      end
    end
  end

  class Computer < Player
    def initialize
      @personality =
        [Petra, Sauran, Chartam, Cutter, Vulcan, Omega].sample.new
      super
    end

    def determine_name
      self.name = personality.title
    end

    def choose
      self.move = Move.new(personality.choose)
      update_history
    end
  end

  class Human < Player
    def determine_name
      designator = ''
      loop do
        print "==> Please enter your name. "
        designator = gets.chomp
        break unless designator.empty?
      end
      self.name = designator.capitalize
    end

    def choose
      self.move = Move.new(valid_choice)
      update_history
    end

    def valid_choice
      puts
      puts "==> Please choose r, p, c, l, or s. Or Q to quit."
      choice = gets.chomp.strip.downcase
      valid = Move::OPTIONS[choice] || choice.eql?('q')

      return choice if valid

      puts "Sorry, Invalid Choice. Try again!"

      valid_choice
    end
  end
end

class RPCLSGame
  include Customizable
  include Displayable
  attr_accessor :human, :computer, :score

  def initialize
    display_game_intro
    @human = Human.new
    @computer = Computer.new
    @score = Score.new
  end

  def play
    game_loop
    display_parting_message
  end

  private

  def game_loop
    loop do
      play_unless_quit
      display_round_result unless human.move.name.eql?('q')
      break unless play_again?
      Score.store_info(score)
      score_reset
    end
  end

  def play_unless_quit
    system('clear')
    SET_LIMIT.times do |_|
      play_one_game
      return nil if human.move.name.eql?('q')
    end
  end

  def play_one_game
    display_record
    human.choose
    return if human.move.name.eql?('q')
    computer.choose
    update_score
    display_verdict
    sleep_until_enter
    system('clear')
  end

  def update_score
    update_winner
    adjust_score
  end

  def update_winner
    score.current_winner =
      if (human.move).wins_over?(computer.move)
        human
      elsif (computer.move).wins_over?(human.move)
        computer
      end
  end

  def adjust_score
    case score.current_winner
    when human      then score.wins += 1
    when computer   then score.losses += 1
    else                 score.ties += 1
    end
  end

  def score_reset
    self.score = Score.new
  end
end

RPCLSGame.new.play
