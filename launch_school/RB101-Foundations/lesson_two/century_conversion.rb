def suffixes(num)
  special_sufs = {0 => 'th', 1 => 'st', 2 => 'nd', 3 => 'rd'}
  num_str = num.to_s

  last_digit = num_str[-1].to_i
  
  if num_str[-2].to_i == 1 || last_digit > 3
    'th'    
  else
    special_sufs[last_digit]
  end
end

def century(num)
  century = num.divmod(100)
  which_century = (century[1] == 0 ? century[0] : century[0] + 1)

  which_century.to_s + suffixes(which_century)
end

puts  century(10)
puts  century(2001)
puts  century(1965) == '20th'
puts  century(256) == '3rd'
puts  century(5) == '1st'
puts  century(10103) == '102nd'
puts  century(1052) == '11th'
puts  century(1127) == '12th'
puts  century(11201) == '113th'