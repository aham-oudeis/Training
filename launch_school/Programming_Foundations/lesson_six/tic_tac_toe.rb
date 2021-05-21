require 'pry'

USER_MARK = 'X'
COMPUTER_MARK = 'O'

EMPTY_BOARD = (1..9).each_with_object({}) {|i, h| h[i] = " "}

GAME_INTRO = <<-MSG
  Let's play a Tic Tac Toe game! It is a 2 player game played
  on a 3 x 3 board. Each player takes a turn and marks a square
  on the board.First player to reach 3 squares in a row, including
  diagonals, wins. If all 9 squares are marked and no player has
  3 squares in a row, then the game is a tie.

  The board square is represented by numbers 1 to 9 as follows:
  MSG

# rubocop: disable Metrics/AbcSize
def display_board(input, clr='yes')
  if clr == 'yes'
    system('clear')
    puts "\tYou're #{USER_MARK}. || Computer is #{COMPUTER_MARK}"
  end
  puts "\t       |       |       "
  puts "\t   #{input[1]}   |   #{input[2]}   |   #{input[3]}   "
  puts "\t       |       |       "
  puts "\t-------+-------+-------"
  puts "\t       |       |       "
  puts "\t   #{input[4]}   |   #{input[5]}   |   #{input[6]}   "
  puts "\t       |       |       "
  puts "\t-------+-------+-------"
  puts "\t       |       |       "
  puts "\t   #{input[7]}   |   #{input[8]}   |   #{input[9]}   "
  puts "\t       |       |       \n"
end
# rubocop: enable Metrics/AbcSize

def prompt(str)
  puts "==> #{str}"
end

def introduce_game
  system('clear')
  slot_numbers = EMPTY_BOARD.map { |k, _| [k, k.to_s] }.to_h

  puts GAME_INTRO
  display_board(slot_numbers, 'no')
  puts "\nPick a slot number to place a mark on that position.
You can only place a mark on an empty slot. Press 'q' to quit."
end

def wait_for_enter
  prompt "Press ENTER/RETURN to play."
  sleep_until_enter(gets.chomp)
end

def parting_msg
  prompt("Thank you for playing Tic Tac Toe. Goodbye!")
end

def ask_play_again_or_quit
  print "Press Y to play again; anything else to quit."
  gets.chomp.downcase
end

def sleep_until_enter(response)
  if response.nil?
    sleep
  end
end

def update_board_with_user_choice!(num, board_state)
  board_state[num] = USER_MARK
  board_state
end

def update_board_with_computer_choice!(num, board_state)
  board_state[num] = COMPUTER_MARK
  board_state
end

def get_valid_choice(options)
  loop do
    puts "Your turn. Pick from #{options}"
    choice = gets.chomp.downcase

    if choice == 'q' || options.map(&:to_s).include?(choice)
      return choice == 'q' ? 'q' : choice.to_i
    end
    puts "Invalid input...Let's try again!"
  end
end

def game_eval(board_state)
  win_combinations = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                      [1, 4, 7], [2, 5, 8], [3, 6, 9],
                      [1, 5, 9], [3, 5, 7]]

  user_win =
    win_combinations.any? do |arr|
      arr.all? { |el| board_state[el] == USER_MARK }
    end

  computer_win =
    win_combinations.any? do |arr|
      arr.all? { |el| board_state[el] == COMPUTER_MARK }
    end

  [user_win, computer_win]
end

def display_game_result(board_state)
  if game_eval(board_state)[0]
    puts "\t******* You Won! ********"
  elsif game_eval(board_state)[1]
    puts "\t******* Computer Won! ********"
  else
    puts "\t******* It's a tie! ********"
  end
end

introduce_game
wait_for_enter

loop do
  board_state = EMPTY_BOARD.dup
  display_board(board_state)
  empty_slots = board_state.keys
  user_choice = get_valid_choice(empty_slots)

  loop do
    empty_slots.delete(user_choice)
    break if user_choice == 'q'

    update_board_with_user_choice!(user_choice, board_state)
    display_board(board_state)

    break if game_eval(board_state).any? || empty_slots.empty?

    puts "Computer's turn."
    sleep(1)

    computer_choice = empty_slots.sample
    empty_slots.delete(computer_choice)
    update_board_with_computer_choice!(computer_choice, board_state)
    display_board(board_state)

    break if game_eval(board_state).any? || empty_slots.empty?

    user_choice = get_valid_choice(empty_slots)
  end

  display_game_result(board_state) unless user_choice == 'q'
  break if user_choice == 'q'

  break unless ask_play_again_or_quit == 'y'

  puts "Let's play again!"
  sleep(1)
end

system('clear')

parting_msg
