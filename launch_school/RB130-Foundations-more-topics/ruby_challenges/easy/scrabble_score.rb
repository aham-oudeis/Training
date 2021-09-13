class Scrabble
  SCORES = { %w(A E I O U L N R S T) =>  1,
             %w(D G) => 2,
             %w(B C M P) => 3,
             %w(F H V W Y) => 4,
             %w(K) => 5,
             %w(J X) => 8,
             %w(Q Z) => 10 }.freeze

  def initialize(word)
    @word = (word ? word : '')
  end

  def score
    @word.strip.upcase.chars.reduce(0) do |sum, item|
      sum += SCORES.find { |key, _| key.include?(item) }.last
    end
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end

p Scrabble.new("Cabbage").score