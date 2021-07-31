module CoreTools
  class Banner
    SIZE = 65
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
      "#-#{'-' * width}-#"
    end

    def empty_line
      "# #{' ' * width} #"
    end

    def message_line
      @message.split("\n").map do |slices|
        "# " + slices.center(width) + " #"
      end
    end
  end

  def clear
    system('clear')
  end

  def prompt(str)
    puts "=> #{str}"
  end

  def join_or(arr)
    return arr.join if arr.size < 2
    [arr[0...(arr.size - 1)].join(', '), arr[-1]].join(', or ')
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
  NAMES = [' 2', ' 3', ' 4', ' 5', ' 6', ' 7', ' 8', ' 9', '10',
           " J", " Q", " K", " A"]
  VALUES = NAMES.zip([2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11]).to_h

  attr_reader :suit, :name

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
  def deal
    cards.pop
  end

  def show
    puts cards
  end

  private

  SUITS = ['♣', '♦', '♥', '♠']

  attr_accessor :cards

  def initialize
    @cards = init_cards
    mix_up
  end

  def init_cards
    SUITS.product(Card::NAMES).map { |f, c| Card.new({ suit: f, name: c }) }
  end

  def mix_up
    rand(1..5).times { cards.shuffle! }
  end
end

class Participant
  MAX_VALUE = 21
  MIN_VALUE = 17
  attr_accessor :name, :hit, :quit
  attr_reader :hand

  def hand_total
    temp_total = hand_values.sum
    num_of_aces.times do
      return temp_total if temp_total <= MAX_VALUE
      temp_total -= 10
    end
    temp_total
  end

  def show_hand
    hand.join(' ')
  end

  def stay?
    !hit
  end

  def busted?
    hand_total > MAX_VALUE
  end

  def to_s
    name
  end

  def quit?
    @quit
  end

  private

  include CoreTools

  def initialize
    @name = determine_name
    @hand = []
    @hit = true
    @quit = false
  end

  def hand_values
    hand.map(&:value)
  end

  def num_of_aces
    hand_values.count(11)
  end
end

class Player < Participant
  def determine_name
    designator = ''
    loop do
      prompt " Please enter your name. "
      designator = gets.strip
      break if designator.match?(/[a-z]/i)
    end
    self.name = designator.capitalize
  end

  def ask_hit_or_stay
    prompt "Please choose H to hit or S to stay. Or, Q to quit."
    options = ['h', 's', 'q']
    choice = gets.strip.downcase
    valid = options.include?(choice)
    @hit = (choice == 'h')
    @quit = (choice == 'q')
    return if valid
    puts "Sorry, Invalid Choice. Try again!"

    ask_hit_or_stay
  end

  def hit?
    @hit
  end
end

class Dealer < Participant
  def determine_name
    self.name = ["Omega", "Pinnochio", "Mario", "Pal"].sample
  end

  def hit?
    @hit = less_than_seventeen?
  end

  def less_than_seventeen?
    hand_total < MIN_VALUE
  end
end

class TwentyOneGame
  def play
    game_loop
    display_parting_message
  end

  private

  include CoreTools

  MAX_NUM_SETS = 5
  INTRO = "Let's play TWENTY-ONE!\n\n"\
  "It's played with a normal 52-card deck.\n"\
  "The goal of Twenty-One is to try to get as close\n"\
  "to 21 as possible, without going over.\n"\
  "If you go over 21, it's a 'bust' and you lose.\n\n"\
  "The numbers 2 through 10 are worth their face value.\n"\
  "The Jack, Queen, and King are each worth 10,\n"\
  "and the Ace can be worth 1 or 11.\n\n"\
  "You play first. You and the dealer are dealt two cards.\n"\
  "You can see one of the dealer's cards.\n"\
  "You can decide to either 'hit' or 'stay'.\n\n"\
  "A hit means 'Get Another Card'. If the total exceeds 21,\n"\
  "then you are busted and you lose.\n"\
  "A stay means 'I will hold now'.\n"\
  "Then it's dealer turn. If the dealer busts, you win.\n\n"\
  "Otherwise, whoever is closer to twenty-one wins."

  PLAY_SUMMARY_EXIT = ['Play again', 'Show game summary', 'Quit the game']
  GAME_MENU = %w(1 2 3).zip(PLAY_SUMMARY_EXIT).to_h
  PARTING_MSG = "Thank you for playing Twenty One! Goodbye!"

  attr_reader :dealer, :player, :deck, :round
  attr_accessor :history, :score, :winner, :current_participant

  def initialize
    display_game_intro
    @dealer = Dealer.new
    @player = Player.new
    @deck = Deck.new
    @history = {}
    @round = 1
    @score = Score.new(round)
    @winner = nil
    @current_participant = nil
  end

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
    MAX_NUM_SETS.times do |_|
      play_one_set
      return nil if current_participant.quit?
    end
    update_round_winner
    display_round_verdict unless current_participant.quit?
    prepare_next_round
  end

  def play_one_set
    kickstart_new_set
    deal_two_cards
    @current_participant = player
    one_set_loop
    current_participant.quit? ? return : update_winner
    display_game_after_set
  end

  def one_set_loop
    loop do
      clear
      display_game_header
      display_cards
      hit_or_stay
      deal_one_card if current_participant.hit?
      break if set_over?
      switch_to_dealer if player_turn_over?
    end
  end

  def display_game_intro
    puts Banner.new(INTRO, 60)
  end

  def display_game_after_set
    clear
    update_score
    display_game_header
    display_cards
    display_busted if current_participant.busted?
    display_winner
    sleep_until_enter
  end

  def ask_until_valid(options)
    display_to_do(options)
    keep_asking_until_valid(options)
  end

  def set_over?
    current_participant.quit? || current_participant.busted? ||
      (current_participant == dealer && dealer.stay?)
  end

  def player_turn_over?
    current_participant == player && dealer_turn?
  end

  def display_to_do(options)
    options.each do |num, action|
      puts "Enter #{num}:  #{action}."
    end
  end

  def display_game_header
    display_players
    display_score
    puts
  end

  def display_players
    puts "\t[Dealer]: #{dealer}  vs. [Player]: #{player}"
    puts "_" * 65
  end

  def display_score
    puts
    puts "|Round #{round}|  Wins: #{score.wins}"\
         "  || Losses: #{score.losses} || Ties: #{score.ties}"
  end

  def display_busted
    prompt "#{current_participant} busted!"
  end

  def keep_asking_until_valid(options)
    loop do
      answer = gets.chomp.strip
      return answer if options.keys.include? answer.downcase
      puts "Sorry, must be #{join_or(options.keys)}."
    end
  end

  def hit_or_stay
    player.ask_hit_or_stay if current_participant == player
  end

  def deal_two_cards
    [dealer, player].each do |contestant|
      contestant.hand << deck.deal << deck.deal
    end
  end

  def deal_one_card
    current_participant.hand << deck.deal
  end

  def display_cards
    dealer_turn? ? show_both_cards : show_one_dealer_card
    puts
  end

  def dealer_turn?
    player.busted? || player.stay?
  end

  def display_winner
    verdict = (winner ? "#{winner} won!" : "It's a tie!")
    prompt verdict
  end

  def display_round_verdict
    clear
    verdict =
      if score.round_winner
        "#{score.round_winner} won this round!"
      else
        "This round is tied!"
      end

    puts Banner.new(verdict, 45)
  end

  def display_game_summary
    clear
    puts "Game Summary for #{player}"
    puts "No round completed yet" if history.empty?
    history.each do |round, score_data|
      puts "|Round #{round}|  Wins: #{score_data.wins}  ||"\
           " Losses: #{score_data.losses} || Ties: #{score_data.ties}"
    end
    puts
  end

  def display_parting_message
    clear
    puts Banner.new(PARTING_MSG, 65)
  end

  def show_one_dealer_card
    puts "#{format_name(dealer)}: #{dealer.hand.first} [** **] | **"
    puts "#{format_name(player)}: #{player.show_hand}"\
         " | #{player.hand_total}"
  end

  def format_name(participant)
    participant.to_s.ljust(10)
  end

  def show_both_cards
    [dealer, player].each do |member|
      puts "#{member.to_s.ljust(10)}: #{member.show_hand}"\
           " | #{member.hand_total}"
    end
  end

  def switch_to_dealer
    @current_participant = dealer
  end

  def next_round
    @round += 1
  end

  def store_round_score
    history[round] = score
  end

  def sleep_until_enter
    puts
    print "Press ENTER to continue..."
    response = gets.chomp
    sleep unless response
  end

  def update_winner
    hand_diff = player.hand_total - dealer.hand_total
    self.winner =
      if player.busted? then dealer
      elsif dealer.busted? then player
      elsif hand_diff < 0 then dealer
      elsif hand_diff > 0 then player
      end
  end

  def update_score
    case winner
    when player then score.wins += 1
    when dealer then score.losses += 1
    else             score.ties += 1
    end
  end

  def update_round_winner
    win_loss_diff = score.wins - score.losses
    score.round_winner =
      if win_loss_diff > 0
        player
      elsif win_loss_diff < 0
        dealer
      end
  end

  def prepare_next_round
    store_round_score
    next_round
    reset_score
  end

  def kickstart_new_set
    reset_deck
    reset_hands
    reset_winner
    reset_player_state
  end

  def reset_player_state
    [dealer, player].each do |member|
      member.hit = true
      member.quit = false
    end
  end

  def reset_score
    self.score = Score.new(round)
  end

  def reset_deck
    @deck = Deck.new
  end

  def reset_hands
    [player.hand, dealer.hand].each(&:clear)
  end

  def reset_winner
    @winner = nil
  end

  def to_s
    "Twenty One Card Game"
  end
end

TwentyOneGame.new.play
