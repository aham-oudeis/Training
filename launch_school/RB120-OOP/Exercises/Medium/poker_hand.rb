class Card
  RANK_VALUES = {ace: 14, jack: 11, queen: 12, king: 13}
  SUIT_VALUES = {diamonds: 0, clubs: 1, hearts: 2, spades: 3}

  include Comparable

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other)
    [rank_value, suit_value] <=> [other.rank_value, other.suit_value]
  end

  def rank_value
    rank.is_a?(String) ? RANK_VALUES[rank.downcase.to_sym] : rank
  end

  def suit_value
    SUIT_VALUES.fetch(suit.downcase.to_sym)
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def ace?
    rank_value == 14
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  attr_reader :deck

  def initialize
    @deck = init_deck
  end

  def init_deck
    RANKS.product(SUITS).map { |rank, suit| Card.new(rank, suit) }.shuffle
  end

  def draw
    @deck = init_deck if deck.empty?
    deck.pop
  end

  def take(num)
    deck.take(num)
  end
end


class PokerHand
  attr_reader :hand

  def initialize(cards)
    @hand = cards.take(5)
  end

  def print
    puts @hand
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end


  # private

  def royal_flush?
    flush? && highest_straight?
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    hand.take(2).any? { |card| rank_count_equal?(card, 4) }
  end

  def full_house?
    three_of_a_kind? && pair?
  end

  def flush?
    test_card = hand.sample
    hand.all? { |card| card.suit == test_card.suit }
  end

  def straight?
    first, last = ranks.minmax
    difference = (first..last).to_a - ranks.sort
    difference.empty?
  end

  def three_of_a_kind?
    hand.take(3).any? { |card| rank_count_equal?(card, 3) }
  end

  def two_pair?
    ranks.uniq.size == 3
  end

  def pair?
    hand.take(4).any? { |card| rank_count_equal?(card, 2) }
  end

  def highest_straight?
    straight? && has_ace?
  end

  def rank_count_equal?(test_card, num)
    hand.count { |card| card.rank == test_card.rank } == num
  end

  def ranks
    hand.map(&:rank_value)
  end

  def has_ace?
    hand.any?(&:ace?)
  end
end

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])

puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'