class Card
  VALUES = {ace: 14, jack: 11, queen: 12, king: 13}

  include Comparable

  attr_reader :rank, :suit, :value

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @value = determine_value
  end

  def <=>(other)
    value <=> other.value
  end

  def determine_value
    rank.is_a?(String) ? VALUES[rank.downcase.to_sym] : rank
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

cards = [Card.new(2, 'Hearts'),
  Card.new(10, 'Diamonds'),
  Card.new('Ace', 'Clubs')]
puts cards

puts cards.min == Card.new(2, 'Hearts')
puts cards.max == Card.new('Ace', 'Clubs')

cards = [Card.new(5, 'Hearts')]
puts cards.min == Card.new(5, 'Hearts')
puts cards.max == Card.new(5, 'Hearts')

cards = [Card.new(4, 'Hearts'),
  Card.new(4, 'Diamonds'),
  Card.new(10, 'Clubs')]
puts cards.min.rank == 4
puts cards.max == Card.new(10, 'Clubs')

cards = [Card.new(7, 'Diamonds'),
  Card.new('Jack', 'Diamonds'),
  Card.new('Jack', 'Spades')]
puts cards.min == Card.new(7, 'Diamonds')
puts cards.max.rank == 'Jack'

cards = [Card.new(8, 'Diamonds'),
  Card.new(8, 'Clubs'),
  Card.new(8, 'Spades')]
puts cards.min.rank == 8
puts cards.max.rank == 8

# Further Exploration

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
    rank.is_a?(String) ? VALUES[rank.downcase.to_sym] : rank
  end

  def suit_value
    SUIT_VALUES.fetch(suit.downcase.to_sym)
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

cards = [Card.new(4, 'Hearts'),
  Card.new(4, 'Diamonds')]
puts cards.min
puts cards.max