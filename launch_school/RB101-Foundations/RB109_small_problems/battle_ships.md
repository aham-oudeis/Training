



```ruby
def update_damages!(board, coordinate, boats_state)  
  attack = get_attack(board, coordinate)

  if boats_state[attack][:damages] == boats_state[attack][:total] - 1
    boats_state[attack][:sunk] += 1
    boats_state[attack][:damages] = 0
  else
    boats_state[attack][:damages] += 1
  end
end

def get_attack(board, coordinate)
  x = -coordinate.last
  y = coordinate.first - 1

 	board[x][y]
end

def count_damaged(boats)
  boats.count {|k, v| v[:damages] > 0 }
end

def count_sunk(boats)
 	boats.reduce(0) {|sum, (k, v)| sum += v[:sunk] }
end

def untouched?(boat)
  boat[:damages].zero? && boat[:sunk].zero?
end

def count_untouched(boats)
  boats.count { |k, v| untouched?(v)}
end

def count_points(boat_condition)
 (boat_condition['sunk'] * 1) +
 (boat_condition['damaged'] * 0.5) + 
 (boat_condition['not_touched'] * -1)
end

def update_tally!(boat_condition, boats)
  boat_condition['sunk'] = count_sunk(boats)
  boat_condition['damaged'] = count_damaged(boats)
  boat_condition['not_touched'] = count_untouched(boats)
  boat_condition['points'] = count_points(boat_condition)
end

def initialize_all(boats, board)
  initial_state = boats.map {|i| [i, {total: 0, damages: 0, sunk: 0}]}.to_h
  boats.each_with_object(initial_state) do |i, hash| 
    hash[i][:total] = board.flatten.count(i)
  end
end

def damaged_or_sunk(board, attacks)
	boats = board.flatten.uniq.reject(&:zero?)

  boats_state = initialize_all(boats)
	
  boat_condition = { 'sunk' => 0, 'damaged' => 0 , 
    								 'not_touched' => 0, 'points' => 0 }

  attacks.each do |attack|
    update_damages!(board, attack, boats_state)
  end

  update_tally!(boat_condition, boats_state)

  boat_condition
end
```

