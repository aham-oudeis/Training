def center_of(str)
  mid_idx = str.size / 2
  str.size.odd? ? str[mid_idx + 1] : str[mid_idx - 1, 2]
end

p center_of('I love ruby') #== 'e'
center_of('Launch School') == ' '
p center_of('Launch') #== 'un'
center_of('Launchschool') == 'hs'
center_of('x') == 'x'