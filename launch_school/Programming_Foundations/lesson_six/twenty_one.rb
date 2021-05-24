=begin
**Problem**
-structure a two user_cards game, where the computer_cards will be the dealer and user_cards the user_cards
-keep track of all the cards in the deck, cards in user_cards's hands, and with the computer_cards
-remove the cards from the deck that are dealt
-show one of dealer's cards to the user_cards (no need for the other way?)
-the user_cards can either 'hit' or 'stay'
-detect if the playe has busted
-keep the loop for 'hit' or 'stay' untill 'stay' or 'busted'
-once 'stay', go to the dealer
-for the dealer, 'hit' until 17; if the computer_cards busts, the user_cards wins
-if the computer_cards does not bust, then reveal both cards to see who won
-a clarification would be helpful here: does ace have a variable value or one of the aces must carry the value of 10? For instance, a person has ace and 5, then ace and 10.
-i shall assume that in such a case the person is not busted, but has 17 total.

**Data Structure and Algorithsm**
-There are two ways implementing a deck of cards:
  --nested array wiith 52 items, each item with the number and color
  --hash with 4 keys, with each key containing 13 items
-I feel like a nested array would be a good way to implement a deck because
  it allows for shuffling of cards
-now that we have a nested array for a deck of card, we can deal 2 cards to the user_cards and 2 cards to the dealer
-that means we can pop four cards (does it matter if we deal alternatively or at once?)
-two cards goes to the user_cards and two goes to the computer_cards
-one of the two cards of the computer_cards is visible to the user_cards
  --do we want to show a random card or the card of particular index?
-we display the user's cards to the user and show on the side one of dealer cards
-start a loop and give the user_cards an option to 'hit' or 'stay'
-break the loop if the user hits 'stay' or the user is busted
-define the method busted?(cards) to add the value of the user's card
-if the card is an ace, then
  --choose ace = 11 unless it adss up to 22 or greater
  --choose ace = 1 if the total adds up to 22 or greater
-then calculate the total; if the sum adds more than 21, it's a bust
-since we need to keep track of the sum of numbers, we need to have a hash that maps
  the numbers to their integer values
-then once the user stays, go to the dealer
-hit  untill 17; if it hits 17 or greater, stay unless it is a bust.
=end
require 'pry'
FULL_DECK = %w(Ace Two Three Four Five Six Seven Eight Nine Ten Jack
  Queen King).product(%w(Hearts Diamonds Spades Clubs))
CARD_VALUE = %w(Two Three Four Five Six Seven Eight Nine Ten Jack
  Queen King Ace).zip((2..10).to_a + [10, 10, 10, 11]).to_h
ALTERNATE_ACE_VALUE = 1
ACE_VALUE_DIFF = 11 - 1
MAX_TOTAL = 21

def initialize_deck
  FULL_DECK.dup
end

def prompt(str)
  puts "==> #{str}"
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

def shuffle!(deck, num)
  num.times {deck.shuffle!}
end

def print_one_computer_card(arr1, arr2, index)
  if index ==  0
    print "\t#{arr1[index].first} of #{arr1[index].last}".ljust(30)
    print "#{arr2.first.first } of #{arr2.first.last}".rjust(30) + "\n"
  else
    puts "\t#{arr1[index].first} of #{arr1[index].last}".ljust(30)
  end
end

def print_both_cards(arr1, arr2, index)
  print "\t#{arr1[index].first} of #{arr1[index].last}".ljust(30) unless arr1[index].nil?
  print "\t ".ljust(30) if arr1[index].nil?
  if arr2[index].nil?
    print "\n"
  else
    print "#{arr2[index].first } of #{arr2[index].last}".rjust(30) + "\n"
  end
end

def display_card(arr1, arr2, show = 'no')
  clear_screen
  puts "\tYour Cards:".ljust(30) + "||" + "Dealer Cards:".rjust(28)
  puts "\t".ljust(60, "_")
  lines = [arr1.size, arr2.size].max

  lines.times do |index|
    show == 'no' ? print_one_computer_card(arr1, arr2, index) :
                   print_both_cards(arr1, arr2, index)
  end
  puts
end

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

def winner(user_cards, computer_cards)
  score = cards_sum(user_cards) <=> cards_sum(computer_cards)

  if busted?(computer_cards)
    'user'
  elsif busted?(user_cards)
    'computer'
  elsif score == 1
    'user'
  elsif score == -1
    'computer'
  else
    ''
  end
end

def display_game_eval(winner)
  prompt case winner
         when 'user'      then "You won!"
         when 'computer'  then "Computer won!"
         else                  "It's tied!"
         end
end

def ask_play_again_or_quit
  prompt "Press Y to play again; anything else to quit."
  gets.chomp.downcase
end

def clear_screen
  system('clear')
end

def prompt(str)
  puts "==> #{str}"
end

def parting_msg
  prompt("Thank you for playing Twenty-One. Goodbye!")
end

def display_busted(player)
  prompt "You busted!" if player == :user
  prompt "Computer busted!" if player == :computer
end

loop do
  deck = initialize_deck
  shuffle!(deck, 5)
  user_cards = deck.pop(2)
  computer_cards = deck.pop(2)
  display_card(user_cards, computer_cards)
  winner, to_do = ''
  player, player_cards = :user, user_cards

  loop do
    if player == :user
      to_do = get_hit_or_stay
      user_cards.push(deck.pop) unless to_do == 's'
      display_card(user_cards, computer_cards)
    else
      sleep(2)
      computer_cards.push(deck.pop) unless cards_sum(computer_cards) >= 17
      display_card(user_cards, computer_cards, 'yes')
      break if cards_sum(computer_cards) >= 17
    end

    display_busted(player) if busted?(player_cards)
    break if busted?(player_cards) || to_do == 'q'

    if to_do == 's'
      player = :computer
      player_cards = computer_cards
      display_card(user_cards, computer_cards, 'yes')
    end
  end

  break if to_do == 'q'

  winner = winner(user_cards, computer_cards)
  display_game_eval(winner)
  break unless ask_play_again_or_quit == 'y'
end

parting_msg
# display_one_card(computer_cards)
