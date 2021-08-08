class Card
  RANK_VALUES = {ace: 14, jack: 11, queen: 12, king: 13}
  SUIT_VALUES = {diamonds: 0, clubs: 1, hearts: 2, spades: 3}

  include Comparable

  attr_reader :rank, :suit

  def initialize(arr)
    @rank = arr.first
    @suit = arr.last
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
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  attr_reader :deck

  def initialize
    @deck = init_deck
  end

  def init_deck
    RANKS.product(SUITS).map { |card| Card.new(card) }.shuffle
  end

  def draw
    @deck = init_deck if deck.empty?
    deck.pop
  end
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.