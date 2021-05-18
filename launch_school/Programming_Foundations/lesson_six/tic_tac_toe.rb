require 'pry'

USER_MARk = 'X'
COMPUTER_MARK = 'O'

EMPTY_BOARD = {
  1=>" ",
  2=>" ",
  3=>" ",
  4=>" ",
  5=>" ",
  6=>" ",
  7=>" ",
  8=>" ",
  9=>" "
}

def display_board(input=EMPTY_BOARD, clear = 'yes')
  system('clear') if clear == 'yes'

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
  puts "\t       |       |       "
end

def prompt(str)
  puts "==> #{str}"
end

def game_intro()
  slot_numbers = { 1=>"1", 2=>"2", 3=>"3", 4=>"4", 5=>"5", 6=>"6",
    7=>"7", 8=>"8", 9=>"9"}

  puts "Let's play a Tic Tac Toe game! It is a 2 player game played
on a 3 x 3 board. Each player takes a turn and marks a square
on the board.First player to reach 3 squares in a row, including
diagonals, wins. If all 9 squares are marked and no player has
3 squares in a row, then the game is a tie.

The board square is represented by numbers 1 to 9 as follows:"

  display_board(slot_numbers, 'no')
  puts "\n"
  puts "Pick a slot number to place a mark on that position.
You can only place a mark on an empty slot."
end

def continue_game()
  prompt "Press ENTER/RETURN to play."
  sleep_until_enter(gets.chomp)
end

def parting_msg
  prompt("Thank you for playing Tic Tac Toe. Goodbye!")
end

def ask_play_again_or_quit
  puts("\nPress Y to play again; anything else to quit.")
  gets.chomp.downcase
end

def sleep_until_enter(response)
  if response.nil?
    sleep
  end
end

def update_board_with_user_choice!(num, board_state)
  board_state[num] = USER_MARk
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
      return choice = (choice == 'q' ? 'q' : choice.to_i)
    end
    puts "Invalid input...Let's try again!"
  end
end

def game_eval(board_state)
  win_possibility = [
                      [1, 2, 3],
                      [4, 5, 6],
                      [7, 8, 9],
                      [1, 4, 7],
                      [2, 5, 8],
                      [3, 6, 9],
                      [1, 5, 9],
                      [3, 5, 7],
                    ]

  user_win = win_possibility.any? {|arr| arr.all? {|el| board_state[el] == USER_MARk}}
  computer_win = win_possibility.any? do |arr|
                    arr.all? {|el| board_state[el] == COMPUTER_MARK}
                 end

  [user_win, computer_win]
end

def display_game_result(board_state)
  if game_eval(board_state)[0]
    puts "You Won!"
  elsif game_eval(board_state)[1]
    puts "Computer Won!"
  else
    puts "It's a tie!"
  end
end

def game_loop()
  loop do
    board_state = EMPTY_BOARD.dup
    display_board(board_state)
    empty_slots = board_state.keys
    user_choice = get_valid_choice(empty_slots)

    loop do
      break if (empty_slots.empty? || user_choice == 'q')

      empty_slots.delete(user_choice)

      update_board_with_user_choice!(user_choice, board_state)
      display_board(board_state)

      break if game_eval(board_state).any?

      puts "Computer's turn."
      sleep(1)

      computer_choice = empty_slots.sample
      update_board_with_computer_choice!(computer_choice, board_state)
      empty_slots.delete(computer_choice)
      display_board(board_state)

      break if game_eval(board_state).any?

      user_choice = get_valid_choice(empty_slots)
    end

    display_game_result(board_state) unless user_choice == 'q'

    break unless ask_play_again_or_quit == 'y'

    puts "Let's play again!"
    sleep(1)
  end
end

def play_game()
  game_intro()
  continue_game()
  game_loop()
  parting_msg
end

play_game()
# display_board(update_board!(3, initial_board))