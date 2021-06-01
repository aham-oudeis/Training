



```ruby
def upddate_damages!(board, coordinate, boats_state)
  x = -coordinate.last
  y = coordinate.first - 1

  attack = board[x][y]

  if attack.zero?
    boats_state[attack][:misses] += 1
  elsif boats_state[attack][:damages] == boats_state[attack][:total] - 1
    boats_state[attack][:sunk] += 1
    boats_state[attack][:damages] = 0
  else
    boats_state[attack][:damages] += 1
  end
end

def update_tally!(boat_condition, boats_state)
  misses = boats_state[0][:misses]
  boats_only = boats_state.reject {|k, v| k.zero?}
  damaged_boats = boats_only.count {|k, v| v[:damages] > 0 }
  sunk = boats_only.reduce(0) {|sum, (k, v)| sum += v[:sunk] }
  untouched = boats_only.count { |k, v| v[:damages].zero? && v[:sunk].zero? && !v[:total].zero? }
  points = (sunk * 1) + (damaged_boats * 0.5) + (untouched * -1)

  boat_condition['sunk'] = sunk
  boat_condition['damaged'] = damaged_boats
  boat_condition['not_touched'] = untouched
  boat_condition['points'] = points
end

def damaged_or_sunk(board, attacks)

  boat_one = board.flatten.count(1)
  boat_two = board.flatten.count(2)
  boat_three = board.flatten.count(3)

  boats_state = { 0 => {misses: 0},
                  1 => {total: boat_one, damages: 0, sunk: 0},
  				  			2 => {total: boat_two, damages: 0, sunk: 0},
  				  			3 => {total: boat_three, damages: 0, sunk: 0} }

  boat_condition = { 'sunk' => 0, 'damaged' => 0 , 'not_touched' => 0, 'points' => 0 }

  attacks.each do |attack|
    upddate_damages!(board, attack, boats_state)
  end

  update_tally!(boat_condition, boats_state)

  boat_condition
end
```

