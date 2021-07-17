# def swap_name(str)
#   str.split.reverse.join(", ")
# end

# p swap_name('Joe Roberts') == 'Roberts, Joe'

# def sequence(num1, num2)
#   1.upto(num1).map {|num| num * num2}
# end

# p sequence(5, 1) == [1, 2, 3, 4, 5]
# p sequence(4, -7) == [-7, -14, -21, -28]
# p sequence(3, 0) == [0, 0, 0]
# p sequence(0, 1000000) == []

# def get_grade(n1, n2, n3)
#   avg = [n1, n2, n3].sum / 3
#   case avg
#   when 90..100 then 'A'
#   when 80...90 then 'B'
#   when 70...80 then 'C'
#   when 60...70 then 'D'
#   else              'F'
#   end
# end

# p get_grade(95, 90, 930) #== "A"
# p get_grade(50, 50, 95) == "D"

# def buy_fruit(arr)
#   new_arr = []
#   arr.each do |(item, number)|
#     1.upto(number) {new_arr << item}
#   end
#   new_arr
# end

def buy_fruit(arr)
  arr.map {|item, count| [item] * count}.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) #==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

