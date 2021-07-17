# def decrease(counter)
#   counter -= 1
# end

# counter = 10

# counter.times do
#   puts counter
#   counter = decrease(counter)
# end

# puts 'LAUNCH!'

# def shout_out_to(name)
#   # name.chars.each { |c| c.upcase! }
#   # the main reason why this doesn't work is that
#   # chars produces a new array and upcase! is called on each
#   # element of that new array, not the original string

#   name.upcase!

#   puts 'HEY ' + name
# end

# shout_out_to('you') # expected: 'HEY YOU'

# def valid_series?(nums)
#   return false if nums.sum != 47

#   odd_count = nums.count { |n| n.odd? }
#   odd_count == 3
# end

# p valid_series?([5, 6, 2, 7, 3, 12, 4, 8])        # should return true
# p valid_series?([1, 12, 2, 5, 16, 6])             # should return false
# p valid_series?([28, 3, 4, 7, 9, 14])             # should return false
# p valid_series?([20, 6, 9, 4, 2, 1, 2, 3])        # should return true
# p valid_series?([10, 6, 19, 2, 6, 4])             # should return false

# def reverse_sentence(sentence)
#   words = sentence.split(' ')
#   reversed_words = []

#   # i = 0
#   # while i < words.length
#   #   reversed_words = [words[i]] + reversed_words
#   #   i += 1
#   # end

#   i = -1
#   while -i <= words.size
#     reversed_words << words[i]
#     i -= 1
#   end

#   reversed_words.join(' ')
# end

# p reverse_sentence('how are you doing')
# # expected output: 'doing you are how'

# CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

# deck = { :hearts   => nil,
#          :diamonds => nil,
#          :clubs    => nil,
#          :spades   => nil }

# def score(card)
#   case card
#   when :ace   then 1
#   when :king  then 13
#   when :queen then 12
#   when :jack  then 11
#   else card
#   end
# end

# # Pick one random card per suit

# player_cards = []

# deck.keys.each do |suit|
#   cards = CARDS.clone.shuffle
#   player_cards << cards.pop
#   deck[suit] = cards
# end

# # Determine the score of the remaining cards in the deck

# sum = deck.reduce(0) do |sum, (_, card_arr)|
#         suit_sum = card_arr.map {|card| score(card)}.reduce(:+)
#         sum += suit_sum
# end

# # sum = deck.reduce(0) do |sum, (_, remaining_cards)|
# #         sum += (remaining_cards.map! {|card| score(card)}.sum)
# # end

# puts sum

# def move(n, from_array, to_array)
#   return if n.zero?
#   to_array << from_array.shift
#   move(n - 1, from_array, to_array)
# end

# # Example

# todo = ['study', 'walk the dog', 'coffee with Tom']
# done = ['apply sunscreen', 'go to the beach']

# move(2, todo, done)

# p todo # should be: ['coffee with Tom']
# p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

def neutralize(sentence)
  words = sentence.split(' ')
  words.reject! {|word| negative?(word)}

  words.join(" ")
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.