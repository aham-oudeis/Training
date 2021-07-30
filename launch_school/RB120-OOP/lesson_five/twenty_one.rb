require 'io/console'

LIMIT = 21

module CoreTools
  class Banner
    SIZE = IO.Console.winsize.last
    attr_reader :message, :width

    def initialize(message, width=SIZE)
      @message = message
      @width = width
    end

    def to_s
      [horizontal_rule, empty_line, message_line,
       empty_line, horizontal_rule].join("\n")
    end

    private

    def horizontal_rule
      "+-#{'-' * width}-+"
    end

    def empty_line
      "| #{' ' * width} |"
    end

    def message_line
      @message.split("\n").map do |slices|
        "| " + slices.center(width) + " |"
      end
    end
  end

  def clear
    system('clear')
  end

  def join_or(arr)
    return arr.join if arr.size < 2
    [arr[0...(arr.size - 1)].join(', '), arr[-1]].join(', or ')
  end

  def prompt(str)
    puts "=> #{str}"
  end
end

module Displayable
  include GameConstants
  include CoreTools

  def ask_until_valid(options)
    display_to_do(options)
    keep_asking_until_valid(options)
  end

  def display_to_do(options)
    options.each do |num, action|
      puts "Enter #{num}:  #{action}."
    end
  end

  def display_game_intro
    clear
    puts Banner.new(INTRO, 65)
    prompt Q_TO_QUIT
    puts T_TO_TOGGLE
    puts
  end

  def display_board
    board.print
    puts
  end

  def display_game_header
    clear
    display_players
    display_score
    puts
  end

  def display_players
    puts "\t\t#{human} vs. #{computer}"
  end

  def display_winner
    verdict = (winner ? "#{current_player} won!" : "It's a tie!")
    prompt verdict
  end

  def display_set_verdict(winner)
    verdict =
      if winner
        "So, #{winner} won!"
      else
        "So, it's a tie!"
      end
    print verdict + "\n"
  end

  def display_round_verdict
    clear
    verdict =
      if score.round_winner
        "#{score.round_winner} won this round!"
      else
        "This round is tied!"
      end

    puts Banner.new(verdict)
  end

  def display_game_summary
    clear
    puts "Game Summary"
    puts "No round completed yet" if history.empty?
    history.each do |round, score_data|
      puts "|Round #{round}|  Wins: #{score_data.wins}  ||"\
           " Losses: #{score_data.losses} || Ties: #{score_data.ties}"
    end
    puts
  end

  def display_score
    puts
    puts "|Round #{round}|  Wins: #{score.wins}"\
         "  || Losses: #{score.losses} || Ties: #{score.ties}"
  end

  def display_parting_message
    clear
    puts Banner.new(PARTING_MSG, 65)
  end

  def keep_asking_until_valid(options)
    loop do
      answer = gets.chomp.strip
      return answer if options.keys.include? answer.downcase
      puts "Sorry, must be #{join_or(options.keys)}."
    end
  end

  def sleep_until_enter
    puts
    print "Press ENTER to continue..."
    response = gets.chomp
    sleep unless response
  end
end

class Score
  attr_accessor :wins, :ties, :losses, :round, :round_winner

  def initialize(round)
    @wins = 0
    @ties = 0
    @losses = 0
    @round_winner = nil
    @round = round
  end
end

class Card
  NAMES = %w(Ace 2 3 4 5 6 7 8 9 10 Jack Queen King)
  VALUES = NAMES.zip([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10]).to_h

  attr_reader :suit, :name, :value

  def initialize(hash)
    @suit = hash[:suit]
    @name = hash[:name]
    @value = value # I have to think about the benefits of doing this
  end

  def value
    VALUES[name]
  end

  def ace?
    name == 'Ace'
  end

  def to_s
   "[#{suit}, #{name}]"
  end
end

class Deck
  SUITS = ['♣', '♦', '♥', '♠']

  attr_accessor :cards

  def initialize
    @cards = init_cards
    mix_up
  end

  def init_cards
    SUITS.product(Card::NAMES).map { |f, c| Card.new({suit: f, name: c}) }
  end

  def mix_up
    rand(1..5).times { cards.shuffle! }
  end

  def deal
    cards.pop
  end

  def show
    puts cards
  end
end

class Participant
  attr_accessor :name

  def initialize
    @name = determine_name
  end

  def to_s
    name
  end
end

class Player < Participant
  def determine_name
    designator = ''
    loop do
      print "==> Please enter your name. "
      designator = gets.strip
      break if designator.match?(/[a-z]/i)
    end
    self.name = designator.capitalize
  end

  def hit_or_stay
    prompt "Please choose H to hit or S to stay. Or, Q to quit."
    options = ['h', 's', 'q']
    choice = gets.strip.downcase
    valid = options.include?(choice)

    return choice if valid
    puts "Sorry, Invalid Choice. Try again!"

    hit_or_stay
  end
end

class Dealer < Participant
  def initialize
    super
    @mark = COMPUTER_MARKER
  end

  def determine_name
    self.name = ["Omega", "Pinnochio", "Mario", "Pal"].sample
  end

  def hit_or_stay
    deal_till_seventeen
  end

  def deal_till_seventeen
  end
end

class TwentyOneGame
  attr_reader :dealer, :player, :deck

  def initialize
    @dealer = Dealer.new
    @player = Player.new
    @deck = Deck.new
    @history = {}
    @round = 1
    @score = Score.new(round)
    @winner = nil
  end

  def play
    game_loop
    display_parting_message
  end

  private

  def game_loop
    loop do
      one_round
      loop do
        to_do = ask_until_valid(GAME_MENU).to_i
        return nil if to_do == 3
        break if to_do == 1
        display_game_summary if to_do == 2
      end
    end
  end

  def one_round
    SET_LIMIT.times do |_|
      play_one_set
      return nil if current_player.nil?
    end
    update_round_winner
    display_round_verdict unless current_player.nil?
    prepare_next_round
  end

  def play_one_set
    start_new_board
    one_set_loop
    return if current_player.nil?
    update_score
    clear
    display_game_header
    display_board
    display_winner
    sleep_until_enter
  end

  def one_set_loop
    self.current_player = human
    loop do
      display_game_header
      display_board
      update_board_with_choice
      return if current_player.nil?
      update_winner if board.winner?(current_player)
      return if winner || board_full?
      switch(current_player)
    end
  end

  def prepare_next_round
    store_round_score
    next_round
    reset_score
  end
end
