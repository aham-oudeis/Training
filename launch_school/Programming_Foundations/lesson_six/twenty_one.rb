require 'pry'
FULL_DECK = %w(Ace Two Three Four Five Six Seven Eight Nine Ten Jack
               Queen King).product(%w(Hearts Diamonds Spades Clubs))
CARD_VALUE = %w(Two Three Four Five Six Seven Eight Nine Ten Jack
                Queen King Ace).zip((2..10).to_a + [10, 10, 10, 11]).to_h
ALTERNATE_ACE_VALUE = 1
ACE_VALUE_DIFF = 10
MAX_TOTAL = 21
MIN_TOTAL = 17
NUMBER_OF_SETS = [3, 5, 7, 9]
MAX_ROUNDS_TO_DISPLAY = 5
PARTING_MSG = "Thank you for playing Twenty-One. Goodbye!"
GAME_INTRO = <<~MSG
Let's play TWENTY-ONE!

It's played with a normal 52-card deck. The goal of Twenty-One
is to try to get as close to 21 as possible, without going over.
If you go over 21, it's a "bust" and you lose.

The numbers 2 through 10 are worth their face value. The jack, queen,
and king are each worth 10, and the ace can be worth 1 or 11.

You go first. You and the dealer are dealt two cards. You can see
one of the dealer's cards. You can decide to either "hit" or "stay".
A hit means 'Get Another Card'. If the total exceeds 21, then
you are busted and you lose. A stay means 'I will hold now'.
Then it's dealer turns. If the dealer busts, you win. Otherwise,
whoever is closer to twenty-one wins.
MSG

########################################################################
# little helper methods
########################################################################
def initialize_deck
  FULL_DECK.dup.shuffle
end

def prompt(str)
  puts "==> #{str}"
end

def clear_screen
  system('clear')
end

def framed(msg)
  frame_length = msg.size + 4
  row_border = "\t" + "*" * frame_length
  col_border = "\t" + "*" + " " * (frame_length - 2) + '*'
  puts
  puts row_border
  puts col_border
  puts "\t*" + " #{msg} " + "*"
  puts col_border
  puts row_border
end

def join_or(arr)
  if arr.size > 1
    arr[..-2].join(", ") + " or #{arr[-1]}"
  else
    arr[0]
  end
end

########################################################################
# Methods for getting user-input
########################################################################

def sleep_until_enter
  prompt "Press ENTER to continue..."
  response = gets.chomp
  if response.nil?
    sleep
  end
end

def get_number_of_sets
  puts "\nPlease input the number of sets you want to play in a given round."
  loop do
    prompt "Pick #{join_or(NUMBER_OF_SETS)}.\n"

    num = gets.chomp

    return num.to_i if NUMBER_OF_SETS.map(&:to_s).include?(num)

    puts "Ooops! Invalid input!"
  end
end

def get_hit_or_stay
  loop do
    puts
    prompt "Hit or Stay? Press H/h to hit, S/s to stay. Q/q to quit."
    choice = gets.chomp.downcase

    if ['h', 's', 'q'].include?(choice)
      return choice
    end
    puts "Invalid input...Let's try again!"
  end
end

def ask_play_again_or_quit
  prompt "Press Y to play another round; anything else to quit."
  gets.chomp.downcase
end

########################################################################
# Methods for displaying output
########################################################################

def print_both_first_cards(user_cards, dealer_cards)
  # first picks the number, last picks the color of the card
  print "\t#{user_cards.first.first} of #{user_cards.first.last}".ljust(30)
  print "#{dealer_cards.first.first} of #{dealer_cards.first.last}".rjust(30) +
        "\n"
end

def puts_only(user_cards, index)
  puts "\t#{user_cards[index].first} of #{user_cards[index].last}".ljust(30)
end

def print_one_computer_card(user_cards, dealer_cards, index)
  if index == 0
    print_both_first_cards(user_cards, dealer_cards)
  else
    puts_only(user_cards, index)
  end
end

def fill_user_column(user_cards, index)
  if user_cards[index].nil?
    print "\t ".ljust(30)
  else
    # first picks the number, last picks the color of the card
    user_card =
      "\t#{user_cards[index].first} of #{user_cards[index].last}"
    print user_card.ljust(30)
  end
end

def fill_dealer_column(dealer_cards, index)
  if dealer_cards[index].nil?
    print "\n"
  else
    dealer_card =
      "#{dealer_cards[index].first} of #{dealer_cards[index].last}"

    print dealer_card.rjust(30) + "\n"
  end
end

def print_both_cards(user_cards, dealer_cards, index)
  fill_user_column(user_cards, index)
  fill_dealer_column(dealer_cards, index)
end

def print_card_each(user_cards, dealer_cards, index, player)
  if player == :user
    print_one_computer_card(user_cards, dealer_cards, index)
  else
    print_both_cards(user_cards, dealer_cards, index)
  end
end

# rubocop: disable Metrics/AbcSize
def display_cards_in_play(game_state, player)
  clear_screen
  user_cards = game_state[:user][:cards]
  user_total = game_state[:user][:total]
  dealer_cards = game_state[:dealer][:cards]
  dealer_total = (player == :user ? " " : game_state[:dealer][:total])
  seperator = "\t".ljust(60, "_")

  puts "\tYour Cards:".ljust(30) + "||" + "Dealer Cards:".rjust(28)
  puts seperator
  lines = [user_cards.size, dealer_cards.size].max

  lines.times do |index|
    print_card_each(user_cards, dealer_cards, index, player)
  end

  puts seperator
  puts "Total:\t" + user_total.to_s.ljust(30) + "||" +
       dealer_total.to_s.rjust(27)
end
# rubocop: enable Metrics/AbcSize

def display_dealing_to(player)
  current_player = (player == :user ? 'you' : 'the dealer')
  prompt "Dealing another card to #{current_player} ..."
  sleep(1)
  system('clear')
end

def display_round_result(score, round)
  if score[round][:user] > score[round][:dealer]
    prompt "You won Round #{round}!"
  elsif score[round][:user] < score[round][:dealer]
    prompt "Dealer won Round #{round}!"
  else
    prompt "Round #{round} is tied!"
  end
end

def display_game_stats(score, round)
  puts
  starting_num = if round < MAX_ROUNDS_TO_DISPLAY
                   1
                 else
                   (round - (MAX_ROUNDS_TO_DISPLAY - 1))
                 end
  (starting_num..round).each do |i|
    puts "< Round #{i} > Wins: #{score[i][:user]} ||"\
    " Losses: #{score[i][:dealer]} || Ties: #{score[i][:tie]}\n"
  end
end

def display_game(winner)
  puts
  puts case winner
       when 'user'      then "\t******* You Won! ********".center(60)
       when 'dealer'    then "\t******* Dealer won! *******".center(60)
       else                  "\t******* It's a tie! *******".center(60)
       end
  puts
end

def display_busted(player)
  prompt "You busted!" if player == :user
  prompt "Dealer busted!" if player == :dealer
end

########################################################################
# Methods for evaluations
########################################################################

def possible_sums(cards)
  card_value_array = cards.map { |sub_arr| CARD_VALUE[sub_arr.first] }
  ace_count = card_value_array.count(11)

  (0..ace_count).each_with_object([]) do |i, arr|
    arr << (card_value_array.sum - (i * ACE_VALUE_DIFF))
  end
end

def busted?(cards)
  possible_sums(cards).select { |sum| sum <= MAX_TOTAL }.empty?
end

def cards_sum(cards)
  if busted?(cards)
    possible_sums(cards).min
  else
    possible_sums(cards).select { |sum| sum <= MAX_TOTAL }.max
  end
end

def winner(game_state)
  user_total = game_state[:user][:total]
  dealer_total = game_state[:dealer][:total]

  score = user_total <=> dealer_total

  if game_state[:dealer][:busted] == 'y'
    'user'
  elsif game_state[:user][:busted] == 'y'
    'dealer'
  elsif score == 1
    'user'
  elsif score == -1
    'dealer'
  else
    ''
  end
end

########################################################################
# Mutating Methods
########################################################################

def update_cards_total!(game_state, *players)
  players.each do |player|
    cards = game_state[player][:cards]
    game_state[player][:total] = cards_sum(cards)
  end
end

def deal_two_cards!(game_state, deck)
  game_state[:user][:cards] = deck.pop(2)
  game_state[:dealer][:cards] = deck.pop(2)
end

def update_score!(score, round, winner)
  case winner
  when 'user'
    score[round][:user] += 1
  when 'dealer'
    score[round][:dealer] += 1
  else
    score[round][:tie] += 1
  end
end

def initialize_round!(score, round)
  score[round] = { user: 0, dealer: 0, tie: 0 }
end

########################################################################
# Start Game
########################################################################

clear_screen
puts GAME_INTRO
sets_to_play = get_number_of_sets
round = 1
set = 1
score = {}
initialize_round!(score, round)

loop do
  deck = initialize_deck
  to_do = ''
  game_state = { user: { cards: nil, total: 0, busted: 'n' },
                 dealer: { cards: nil, total: 0, busted: 'n' } }

  deal_two_cards!(game_state, deck)
  update_cards_total!(game_state, :user, :dealer)

  player = :user
  current_cards = game_state[player][:cards]
  display_cards_in_play(game_state, player)
  display_game_stats(score, round)

  loop do
    break if to_do == 'q'

    if player == :user
      to_do = get_hit_or_stay
      current_cards.push(deck.pop) unless %w(s q).include?(to_do)
    else
      break if game_state[player][:total] >= MIN_TOTAL
      sleep(2)
      current_cards.push(deck.pop) unless cards_sum(current_cards) >= MIN_TOTAL
    end

    update_cards_total!(game_state, player)
    player = :dealer if to_do == 's'
    current_cards = game_state[player][:cards]
    unless player == :dealer && current_cards.size == 2 || to_do == 'q'
      display_dealing_to(player)
    end
    display_cards_in_play(game_state, player)
    display_game_stats(score, round)

    if busted?(current_cards)
      game_state[player][:busted] = 'y'
      break
    end
  end

  break if to_do == 'q'

  winner = winner(game_state)
  update_score!(score, round, winner)
  display_cards_in_play(game_state, player)
  display_game_stats(score, round)
  display_busted(player) if busted?(current_cards)
  display_game(winner)

  set += 1
  sleep_until_enter unless set > sets_to_play

  if set > sets_to_play
    display_round_result(score, round)
    break unless ask_play_again_or_quit == 'y'
    puts "Let's play again!"
    round += 1
    initialize_round!(score, round)
    set = 1
  end
end
clear_screen
framed(PARTING_MSG)
