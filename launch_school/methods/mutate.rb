a = [1, 3, 4, 7, 8, 5]

# a method that modifies its argument permanently

def mutate(arr)
  arr.pop
end

def no_mutate(arr)
  arr.last
end

p "Before mutate method: #{a}"
mutate(a)
p "After mutate method: #{a}"

p "Before no_mutate method: #{a}"
no_mutate(a)
p "After no_mutate method: #{a}"

