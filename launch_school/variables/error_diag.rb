=begin
if a variable is initialized outside a method, 
changed by calling a method
and called again, it should show the changed value
but if the variable is initialized inside a bloc,
then calling it outsiide the block should throw an error
=end

x = 0
3.times {x += 1}
puts x

y = 0
3.times {
  y += 1
  z = y
}
puts z