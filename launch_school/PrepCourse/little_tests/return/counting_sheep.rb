# def count_sheep
#   5.times do |sheep|
#     puts sheep
#   end
#   10
# end

# puts count_sheep

# def count_sheep
#   5.times do |sheep|
#     puts sheep
#     if sheep >= 2
#       return
#     end
#   end
# end

# p count_sheep

# def tricky_number
#   if true
#     number = 1
#   else
#     2
#   end
# end

# puts tricky_number

# stoplight = ['green', 'yellow', 'red'].sample

# case stoplight
# when 'green'
#   puts 'Go!'
# when 'red'
#   puts "Stop!"
# else
#   puts 'Slow down!'
# end

# stoplight = ['green', 'yellow', 'red'].sample

# puts "Go!" if stoplight == 'green'
# puts "Stop" if stoplight == 'red'
# puts "Slow down!" if stoplight == 'yellow'

# status = ['awake', 'tired'].sample

# alert =
# if status == 'awake'
#   "Be productive!"
# else
#   "Go to sleep!"
# end
# p alert

stoplight = ['green', 'yellow', 'red'].sample

case stoplight
when 'green'  then puts 'Go!'
when 'yellow' then puts 'Slow down!'
else               puts 'Stop!'
end

