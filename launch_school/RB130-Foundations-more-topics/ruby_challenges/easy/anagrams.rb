class Anagram
  def initialize(word)
    @word = word
    @sorted_chars = @word.downcase.chars.sort
  end

  def match(arr)
    arr.select { |item| anagram?(item)}
  end

  def anagram?(string)
    string.downcase != @word &&
    string.downcase.chars.sort == @sorted_chars
  end
end