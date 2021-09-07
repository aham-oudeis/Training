=begin
Components
-construct a way to iterate halfway to the given letter
  -find the height/width of the diamond by finding position of the letter
  -if B, then width is 2 * (B.ord - 64) - 1
  -likewise, width for A, B, C, D would be [1, 3, 5, 7, 9, 11, 13]
  -that's the total length of each string on each line
  -iterate from 1 to letter's position; for B, it would be 2; for A, it would be 1.
  -for each index, find the corresponding letter and the amount of space before and after the letter
    -corresponding letter: (index + 64).char
    -if index is 1: put the letter in the center
    -else, construct a left-half and a right-half.
    -left-half: left-space: how far from the middle of the diamond?
              -- letter's position - index; hence, 0 for 'B' when we are printing upto B
              --letter
              -- right-space: (width / 2) - left_space - 1
  -while constructing, for each index, insert (index + 65).ord
-do the step in reverse
-join the elements into a string and append an empty line at the end

=end

class Diamond
  class << self
    def make_diamond(letter)
      upto_midway = first_half(letter)
      after_midway = upto_midway[0..-2].reverse
      (upto_midway + after_midway).join("\n") + "\n"
    end

    def first_half(letter)
      position = letter.ord - 64
      height = 2 * position - 1

      (1..position).map do |index|
        line_letter = (index + 64).chr

        index == 1 ? line_letter.center(height) : two_halves(index, position, height)
      end
    end

    def two_halves(index, position, height)
      line_letter = (index + 64).chr

      left_space = position - index
      right_space = (height / 2) - left_space - 1
      left_half = (' ' * left_space) + line_letter + (' ' * right_space)
      right_half = (' ' * right_space) + line_letter + (' ' * left_space)

      left_half + " " + right_half
    end
  end
end

puts Diamond.make_diamond('F')