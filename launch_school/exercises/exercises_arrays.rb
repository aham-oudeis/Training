# # 1

# Array(1..10).each {|i| p i}

# # 2

# Array(1..10).each {|i| p i if i > 5}

# # 3 

# odd_num = Array(1..10).select {|i| p i if i % 2 != 0}

# # 4

og_arr = Array(1..10)

og_arr.push(11)
p og_arr
p "added 11 to the end"

og_arr.unshift(0)
p og_arr
p "added 0 at the beginning"

# # 5
og_arr.pop()
p og_arr
p "removed 11"

# # 6
og_arr.push(3)
p og_arr
p "added 3"

# # 7
og_arr.uniq!
p og_arr
p "removed duplicates"
