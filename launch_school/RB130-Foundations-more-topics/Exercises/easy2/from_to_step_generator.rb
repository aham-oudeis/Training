def step(start, finish, step)
  current = start
  while current <= finish
    yield(current)
    current += step
  end
  [start..finish, step]
end

p step(1, 10, 3) { |value| puts "value = #{value}" }