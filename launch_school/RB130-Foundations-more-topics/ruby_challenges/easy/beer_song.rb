class BeerSong
  class << self
    def verses(num, down_to = nil)
      down_to = down_to ? down_to : num
      down_to = 0 if down_to < 0

      full_verse = []
      while num >= down_to
        full_verse += [verse(num)]
        num  -= 1
      end
      full_verse.join("\n")
    end

    def lyrics
      verses(99, 0)
    end

    def verse(num)
      case num
      when 0 then zero_bottle
      when 1 then one_bottle
      when 2 then two_bottles
      else        bottles(num)
      end
    end

    def zero_bottle
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
        "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end

    def one_bottle
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
        "Take it down and pass it around, no more bottles of beer on the wall.\n"
    end

    def two_bottles
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
        "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    end

    def bottles(num)
      "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
        "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"
    end
  end
end
