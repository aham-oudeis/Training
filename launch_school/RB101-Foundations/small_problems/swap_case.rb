def swapcase(str)
  swap_proc = proc {|char| if char == char.downcase then char.upcase else char.downcase end}
  str.chars.map(&swap_proc).join('')    
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
