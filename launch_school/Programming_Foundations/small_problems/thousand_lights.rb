def which_are_on(number)
  switches = (1..number).to_a
  switch_status = switches.product([false]).to_h
  passes = 1

  loop do

    1.upto(number).each do |idx|
      switch_status[idx] = !switch_status[idx] if idx % passes == 0
    end

    passes += 1
    break if passes > number
  end

  switch_status.select {|num, state| state == true}.keys
end

p which_are_on(10)