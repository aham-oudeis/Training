hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}


hsh.each do |k, v|
  v.each do |word|
    word.each_char do |letter|
      p letter if %(a e i o u).include?(letter)
    end
  end
end
