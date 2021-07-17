def letter_case_count(str)
  count_hash = {}
  count_hash[:lowercase] = str.chars.select {|i| ('a'..'z').include?(i)}.size
  count_hash[:uppercase] = str.chars.select {|i| ('A'..'Z').include?(i)}.size
  count_hash[:neither] = str.length - count_hash[:lowercase] - count_hash[:uppercase]
  count_hash
end

p letter_case_count('abCdef 123') #== { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }