# def multiply(a, b)
#   a * b
# end

# def add(a, b)
#   a + b
# end

# puts add(2, 2) == 4
# puts add(5, 4) == 9
# puts multiply(add(2, 2), add(5, 4)) == 36

names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

def name(names)
  names.sample 
end

def activity(activities)
  activities.sample
end

def sentence(x, y)
  x + " went " + y + " today."
end

puts sentence(name(names), activity(activities))
