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

def display_board(input=EMPTY_BOARD)
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

def game_intro()
  slot_numbers = { 1=>"1", 2=>"2", 3=>"3", 4=>"4", 5=>"5", 6=>"6",
    7=>"7", 8=>"8", 9=>"9"}

  puts "  Let's play a Tic Tac Toe game! It is a 2 player game played
  on a 3 x 3 board. Each player takes a turn and marks a square
  on the board.First player to reach 3 squares in a row, including
  diagonals, wins. If all 9 squares are marked and no player has
  3 squares in a row, then the game is a tie.

  The board square is represented by numbers 1 to 9 as follows:"

  display_board(slot_numbers)
  puts "\n"
  puts "  You can only place a mark on an empty slot."
end

def continue_game()
  puts "  Press ENTER/RETURN to continue."
  sleep_until_enter(gets.chomp)
  system('clear')
end

def prompt(str)
  puts "==> #{str}"
end

def parting_msg
  prompt("Thank you for playing Tic Tac Toe. Goodbye!")
end

def play_again_or_quit
  puts("\nPress Y to play again; anything else to quit.")
end

def sleep_until_enter(response)
  if response.nil?
    sleep
  end
end

def update_board(num, sym, board_state)
  board_state[num] = sym
  board_state
end

def get_valid_choice(options)
  loop do
    puts "Your turn."
    choice = gets.chomp.downcase

    return choice if options.include?(choice) || choice == 'q'
    puts "Invalid input...Let's try again!"
  end
end

def game_eval(board_state)
  three_sq_rows = [
    [board_state[1], board_state[2], board_state[3]],
    [board_state[4], board_state[5], board_state[6]],
    [board_state[7], board_state[8], board_state[9]],
    [board_state[1], board_state[4], board_state[7]],
    [board_state[2], board_state[5], board_state[8]],
    [board_state[3], board_state[6], board_state[9]],
    [board_state[1], board_state[5], board_state[9]],
    [board_state[3], board_state[5], board_state[8]],
  ]

  user_win = three_sq_rows.any? {|arr| arr.all? {|el| el == 'X'}}
  computer_win = three_sq_rows.any? {|arr| arr.all? {|el| el == 'O'}}

  [user_win, computer_win]
end

def play_game(board_state)
  valid_inputs = %w(1 2 3 4 5 6 7 8 9)

  game_intro()
  continue_game()
  puts "Pick a slot number to place a mark on that position."
  user_choice = get_valid_choice(valid_inputs)

  loop do
    loop do
      exit_condition = game_eval(board_state).any? ||
                              valid_inputs.empty? ||
                                user_choice == 'q'

      valid_inputs.delete(user_choice)

      update_board(user_choice.to_i, 'X', board_state)
      display_board(board_state)
      break if exit_condition

      puts "Computer's turn."
      sleep(3)
      system('clear')

      computer_choice = valid_inputs.sample
      update_board(computer_choice.to_i, 'O', board_state)
      valid_inputs.delete(computer_choice)
      display_board(board_state)
      break if exit_condition

      user_choice = get_valid_choice(valid_inputs)
    end

    if game_eval(board_state)[0]
      puts "You Won!"
    elsif game_eval(board_state)[1]
      puts "Computer Won!"
    else
      puts "It's a tie!"
    end

    puts("\nPress Y to play again; anything else to quit.")
    quit_or_not = gets.chomp.downcase
    break if quit_or_not != 'y'
  end
end

initial_board = EMPTY_BOARD.dup
play_game(initial_board)
# display_board(update_board(3, initial_board))