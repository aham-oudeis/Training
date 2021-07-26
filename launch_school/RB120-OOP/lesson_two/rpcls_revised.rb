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

module Constants
  SET_LIMIT = 5
  NUMBER_OF_MOVES = 5
  WIDTH = 40
  ACTIONS = ['play again', 'show game summary',
             'show past moves', 'quit the game']
  NUM_TO_ACTION = %w(1 2 3 4).zip(ACTIONS).to_h
  WELCOME = "Welcome to Rock, Paper, Scissors, Lizard, Spock game!"\

  RULES = "Rules
  * Rock beats Scissors and Lizard
  * Paper beats Rock and Spock
  * Scissors beats Paper and Lizard
  * Lizard beats Paper and Spock
  * Spock beats Scissors and Rock."

  SHORTHAND = "For this game each one is represented as follows:
    Rock as       r
    Paper as      p
    SCissors as   c
    Lizard as     l
    Spock as      s
  "
  WIN_INFO = "   We shall play #{SET_LIMIT} number of sets in each round.\n"\
  "   Whoever wins more sets in the given round is the winner."
end

module Displayable
  include Constants

  def ask_what_next_until_valid
    display_actions
    keep_asking
  end

  def display_actions
    NUM_TO_ACTION.each do |num, action|
      puts "Enter #{num} to #{action}."
    end
  end

  def join_or(arr)
    return arr.join if arr.size < 2
    [arr[0...(arr.size - 1)].join(', '), arr[-1]].join(', or ')
  end

  def keep_asking
    loop do
      answer = gets.chomp.strip
      return answer.to_i if ['1', '2', '3', '4'].include? answer.downcase
      puts "Sorry, must be #{join_or(NUM_TO_ACTION.keys)}."
    end
  end

  def prompt(str)
    puts "=> #{str}"
  end

  def display_game_intro
    system('clear')
    puts Banner.new(WELCOME, 55)
    puts
    prompt RULES
    puts
    prompt SHORTHAND
    puts WIN_INFO
    puts
  end

  def display_parting_message
    system('clear')
    parting_msg = "Thank you for playing Rock, Papers, Scissors,"\
                  " Lizard, Spock game. Goodbye!"

    puts Banner.new(parting_msg, 65)
  end

  def display_moves
    puts "==> #{name} chose #{move.class}."
  end

  def display_move_history
    system('clear')
    puts "#{name}'s moves:".ljust(WIDTH)
    move_history.each do |round, moves|
      puts "| Round #{round} |" + moves.to_s.rjust(WIDTH)
    end
    puts
  end

  def display_set_verdict(winner)
    verdict =
      if winner
        "So, #{winner.name} won!"
      else
        "So, it's a tie!"
      end
    print verdict + "\n"
  end

  def display_round_result(winner)
    result =
      if winner
        "#{winner.name} won this round!"
      else
        "This round is tied!"
      end

    puts Banner.new(result)
  end

  def display_game_summary
    system('clear')
    puts "Game Summary"
    score_history.each do |round, scores|
      puts "|Round #{round}|  Wins: #{scores.wins}  ||"\
           " Losses: #{scores.losses} || Ties: #{scores.ties}"
    end
    puts
  end

  def display_score
    puts
    puts "|Round #{Score.round}|  Wins: #{score.wins}"\
         "  || Losses: #{score.losses} || Ties: #{score.ties}"
  end

  def play_again?
    answer = nil
    loop do
      puts "==> Would you like to play again? (y/n)"
      answer = gets.chomp.strip
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

class Move
  OPTIONS = { "r" => "rock", "p" => "paper",
              "c" => "scissors", "l" => "lizard",
              "s" => "spock" }

  BEATS = { 'r' => ['c', 'l'],
            'p' => ['r', 's'],
            'c' => ['p', 'l'],
            'l' => ['s', 'p'],
            's' => ['c', 'r'] }

  attr_reader :name

  def initialize
    @name = choice
  end

  def beats?(other)
    BEATS[name].include?(other.name)
  end

  def ties_with?(other)
    name == other.name
  end

  def loses_to?(other)
    !ties_with?(other) && !beats?(other)
  end

  def to_s
    OPTIONS[name].upcase
  end
end

class Rock < Move
  def initialize
    @name = 'r'
  end
end

class Paper < Move
  def initialize
    @name = 'p'
  end
end

class Scissors < Move
  def initialize
    @name = 'c'
  end
end

class Lizard < Move
  def initialize
    @name = 'l'
  end
end

class Spock < Move
  def initialize
    @name = 's'
  end
end

class Quit
  attr_reader :name

  def initialize
    @name = 'q'
  end
end

class Score
  attr_accessor :wins, :ties, :losses, :current_winner, :round_winner

  @@round = 1

  def initialize
    @wins = 0
    @ties = 0
    @losses = 0
    @current_winner = 0
    @round_winner = 0
  end

  def self.next_round
    @@round += 1
  end

  def self.round
    @@round
  end
end

class Player
  include Displayable
  attr_accessor :name, :move, :move_history, :score, :score_history

  def initialize
    @move_history = Hash.new([])
    @score = Score.new
    @score_history = {}
    determine_name
  end

  def update_move_history
    if move_history[Score.round].empty?
      move_history[Score.round] = [move.name]
    else
      move_history[Score.round] << move.name unless move.name.eql?('q')
    end
  end

  def update_player_score(winner)
    case winner
    when self   then score.wins += 1
    when nil    then score.ties += 1
    else             score.losses += 1
    end
  end

  def update_round_winner
    score.round_winner =
      if score.wins > score.losses
        1
      elsif score.wins < score.losses
        -1
      else
        0
      end
  end

  def update_score_history
    score_history[Score.round] = score
  end

  def update_choice
    choose
    update_move_history unless move.name.eql?('q')
  end
end

class Computer < Player
  def determine_name
    self.name = self.class.to_s
  end

  def choose
    self.move = options.sample.new
  end
end

class ComputerPersonalities < Computer
  FREQUENCY_OF_CHOICE = 5
  attr_accessor :options, :dislikes, :loves

  def initialize(dislikes, loves)
    @loves = loves
    @dislikes = dislikes
    @options = chooses_from(dislikes, loves)
    super()
  end

  private

  def chooses_from(dislikes, loves)
    moves = [Rock, Paper, Scissors, Lizard, Spock]
    selection = moves.reject { |option| option.eql?(dislikes) }
    FREQUENCY_OF_CHOICE.times { selection << loves }
    selection
  end
end

class Petra < ComputerPersonalities
  def initialize
    super(Lizard, Rock)
  end
end

class Sauran < ComputerPersonalities
  def initialize
    super(Spock, Lizard)
  end
end

class Chartam < ComputerPersonalities
  def initialize
    super(Scissors, Paper)
  end
end

class Cutter < ComputerPersonalities
  def initialize
    super(Lizard, Scissors)
  end
end

class Vulcan < ComputerPersonalities
  def initialize
    super(Lizard, Spock)
  end
end

class Omega < ComputerPersonalities
  def initialize
    super(Paper, Spock)
  end
end

class Human < Player
  OBJECTS = { 'r' => Rock, 'p' => Paper, 'c' => Scissors,
              'l' => Lizard, 's' => Spock, 'q' => Quit }

  def determine_name
    designator = ''
    loop do
      print "==> Please enter your name. "
      designator = gets.chomp.strip
      break if designator.match?(/[a-z]/i)
    end
    self.name = designator.capitalize
  end

  def choose
    self.move = valid_choice
  end

  def valid_choice
    puts
    puts "==> Please choose r, p, c, l, or s. Or Q to quit."
    choice = gets.chomp.strip.downcase
    valid = OBJECTS[choice]

    return OBJECTS[choice].new if valid

    puts "Sorry, Invalid Choice. Try again!"

    valid_choice
  end
end

class RPCLSGame
  include Displayable
  attr_accessor :human, :computer, :current_winner, :round

  def initialize
    display_game_intro
    @human = Human.new
    @computer = [Petra, Sauran, Vulcan, Chartam, Cutter, Omega].sample.new
    @current_winner = nil
    @round = 0
  end

  def play
    game_loop
    display_parting_message
  end

  private

  def increment_round
    @round += 1
  end

  def game_loop
    loop do
      one_round_with_result
      loop do
        to_do = ask_what_next_until_valid
        return if to_do == 4
        break if to_do == 1
        to_do == 3 ? human.display_move_history : human.display_game_summary
      end
      score_reset
    end
  end

  def one_round_with_result
    play_set(SET_LIMIT)
    update_round_result
    store_round_score
    display_round_result(round_winner) unless human.move.name == 'q'
  end

  def play_set(num)
    system('clear')
    num.times do |_|
      play_one_game
      return nil if human.move.name.eql?('q')
    end
  end

  def play_one_game
    display_game_header
    human.update_choice
    return if human.move.name.eql?('q')
    computer.update_choice
    determine_current_winner
    update_score(current_winner)
    display_verdict(current_winner)
    sleep_until_enter
    system('clear')
  end

  def players
    [human, computer]
  end

  def display_game_header
    display_players
    human.display_score
  end

  def display_players
    puts "\t\t#{human.name} vs. #{computer.name}"
  end

  def determine_current_winner
    self.current_winner =
      if human.move.beats?(computer.move)
        human
      elsif computer.move.beats?(human.move)
        computer
      end
  end

  def round_winner
    players.select { |player| player.score.wins > player.score.losses }.pop
  end

  def display_record
    players.each(&:display_move_history)
    display_score
  end

  def update_score(winner)
    players.each { |player| player.update_player_score(winner) }
  end

  def display_verdict(winner)
    players.each(&:display_moves)
    display_set_verdict(winner)
  end

  def select_set_winner
    players.select { |player| player.current_winner == 1 }.pop
  end

  def update_round_result
    players.each(&:update_round_winner)
  end

  def store_round_score
    players.each(&:update_score_history)
  end

  def score_reset
    players.each do |player|
      player.update_score_history
      player.score = Score.new
    end
    Score.next_round
  end
end

RPCLSGame.new.play
