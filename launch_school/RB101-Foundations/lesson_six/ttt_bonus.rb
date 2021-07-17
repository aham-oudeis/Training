USER_MARK = 'XX'
COMPUTER_MARK = '∆∆'
EMPTY_MARKER = " "
NUMBER_OF_SETS = [3, 5, 7, 9]
BOX_HEIGHT = 4
MIN_BOARD_SIZE = 3
MAX_BOARD_SIZE = 9

GAME_INTRO = <<~MSG
  Let's play a Tic Tac Toe game! It is a 2 player game played
  on a square board. Each player takes a turn and marks a square
  on the board. First player to reach across the board, including
  diagonals, wins. If all square-slots are marked and no player has
  reached across the square, then the game is a tie.

  Once the game starts, press 'Q/q' anytime to quit the game.
  MSG

########################################################
# Methods for getting user inputs
#########################################################

def get_board_size
  loop do
    prompt "Please input the board size between #{MIN_BOARD_SIZE}"\
           " and #{MAX_BOARD_SIZE}."
    size = gets.chomp

    return size.to_i if ('3'..MAX_BOARD_SIZE.to_s).include?(size)

    if size.to_i > MAX_BOARD_SIZE
      puts "Number too big for a screen!"
    elsif size.between?('0', '2')
      puts "That's too small!"
    else
      puts "Ooops! Invalid input!"
    end
  end
end

def get_valid_choice(options)
  loop do
    prompt "Your turn! Pick #{join_or(options)}"
    choice = gets.chomp.downcase

    if choice == 'q' || options.map(&:to_s).include?(choice)
      return choice == 'q' ? 'q' : choice.to_i
    end
    puts "Invalid input...Let's try again!"
  end
end

def get_number_of_sets
  puts "\nPlease input the number of sets you want to play in a given round."
  loop do
    prompt "Pick #{join_or(NUMBER_OF_SETS)}.\n"

    num = gets.chomp

    return num.to_i if NUMBER_OF_SETS.map(&:to_s).include?(num)

    puts "Ooops! Invalid input!"
  end
end

def choose_from(player, board, board_size)
  if player == 'user'
    open_slots = board.select { |k, v| k == v.to_i }.keys
    get_valid_choice(open_slots)
  else
    sleep(1)
    computer_chooses(board, board_size)
  end
end

def sleep_until_enter
  prompt "Press ENTER to continue..."
  response = gets.chomp
  if response.nil?
    sleep
  end
end

def get_who_goes_first
  prompt "Enter 'F' to play for first or any other key to go second."
  who_first = gets.chomp.downcase
  (who_first == 'f' ? 'user' : 'computer')
end

def ask_play_again_or_quit
  prompt "Press Y to play again; anything else to quit."
  gets.chomp.downcase
end

########################################################
# Methods for small shortcuts
#########################################################

def clear_screen
  system('clear')
end

def prompt(str)
  puts "==> #{str}"
end

def parting_msg
  prompt("Thank you for playing Tic Tac Toe. Goodbye!")
end

def join_or(arr)
  if arr.size > 1
    arr[..-2].join(", ") + " or #{arr[-1]}"
  else
    arr[0]
  end
end

def initialize_board(board_size)
  total_slots = (board_size**2)
  (1..total_slots).map { |k| [k, format('%2d', k)] }.to_h
end

########################################################
# Destructive methods
#########################################################

def update_board!(num, board, player)
  board[num] = if player == 'user'
                 USER_MARK
               else
                 COMPUTER_MARK
               end
end

def update_score!(score, round, winner)
  case winner
  when :user
    score[round][:user] += 1
  when :computer
    score[round][:computer] += 1
  else
    score[round][:tie] += 1
  end
end

def determine_winner!(board, board_size)
  if there_a_winner(board, board_size)[:user]
    :user
  elsif there_a_winner(board, board_size)[:computer]
    :computer
  else
    ''
  end
end

def initialize_round!(score, round)
  score[round] = { user: 0, computer: 0, tie: 0 }
end

def switch!(player)
  if player == 'user'
    'computer'
  else
    'user'
  end
end

########################################################
# Methods for boolena evaluations
#########################################################

def board_full?(board)
  board.all? { |k, v| k != v.to_i }
end

def a_win_possible?(mark, arr, board)
  board_size = sqrt(board.size)
  (arr.count { |el| board[el] == mark }) == (board_size - 1) &&
    (arr.count { |el| el == board[el].to_i }) == 1
end

def about_to_lose?(board, board_size)
  win_combinations = win_combinations(board_size)
  win_combinations.any? do |arr|
    a_win_possible?(USER_MARK, arr, board)
  end
end

def about_to_win?(board, board_size)
  win_combinations = win_combinations(board_size)
  win_combinations.any? do |arr|
    a_win_possible?(COMPUTER_MARK, arr, board)
  end
end

def middle_square_available?(board, board_size)
  if board_size.odd?
    middle_square = (board.size / 2) + 1
    board[middle_square].to_i == middle_square
  end
end

def game_end?(board, winner)
  !winner.empty? || board_full?(board)
end

def won?(mark, board, board_size)
  win_combinations = win_combinations(board_size)

  win_combinations.any? do |arr|
    arr.all? { |el| board[el] == mark }
  end
end

########################################################
# Methods for calculations
#########################################################

def sqrt(num)
  Math.sqrt(num)
end

def there_a_winner(board, board_size)
  { user: won?(USER_MARK, board, board_size),
    computer: won?(COMPUTER_MARK, board, board_size) }
end

def win_rows(board_size)
  total_slots = (board_size**2)
  (1..total_slots).each_slice(board_size).to_a
end

def win_cols(arr)
  arr.transpose
end

def win_diagonals(arr)
  left_diagonal = []
  right_diagpnal = []

  left_index = 0
  right_index = -1

  arr.each do |_|
    left_diagonal << arr[left_index][left_index]
    right_diagpnal << arr[left_index][right_index]
    left_index   += 1
    right_index  -= 1
  end
  [left_diagonal, right_diagpnal]
end

def win_combinations(board_size)
  horizontal = win_rows(board_size)
  vertical = win_cols(horizontal)
  diagonal = win_diagonals(horizontal)

  horizontal + vertical + diagonal
end

def find_losing_square(board, board_size)
  win_combinations = win_combinations(board_size)
  (win_combinations.select do |arr|
    a_win_possible?(USER_MARK, arr, board)
  end).flatten.find { |item| board[item] != USER_MARK }
end

def find_winning_square(board, board_size)
  win_combinations = win_combinations(board_size)
  (win_combinations.select do |arr|
    a_win_possible?(COMPUTER_MARK, arr, board)
  end).flatten.find { |item| board[item] != COMPUTER_MARK }
end

def find_middle_square(board)
  (board.size / 2) + 1
end

def find_random_square(board)
  board.select { |k, v| k == v.to_i }.keys.sample
end

def computer_chooses(board, board_size)
  if about_to_win?(board, board_size)
    find_winning_square(board, board_size)
  elsif about_to_lose?(board, board_size)
    find_losing_square(board, board_size)
  elsif middle_square_available?(board, board_size)
    find_middle_square(board)
  else
    find_random_square(board)
  end
end

########################################################
# Methods for displaying messages and results
#########################################################

def display_player_sign
  system('clear')
  prompt "You're #{USER_MARK}. || Computer is #{COMPUTER_MARK}"
end

# rubocop: disable Metrics/AbcSize, Metrics/MethodLength
def display_board(board_size, board, clr = 'yes')
  board_height = (BOX_HEIGHT * board_size) - 1
  display_player_sign if clr == 'yes'

  row_separator = "#{'---------+' * (board_size - 1)}----------"
  col_separator = "#{'         |' * (board_size - 1)}          "

  (1..board_height).each do |num|
    if num % BOX_HEIGHT == 0
      puts row_separator

    elsif num % (BOX_HEIGHT / 2) == 0
      start_row = ((num / BOX_HEIGHT) * board_size) + 1
      end_row = start_row + (board_size - 1)

      start_row.upto(end_row) do |idx|
        print "    #{board[idx]}   |" unless idx % board_size == 0
        print "    #{board[idx]}   \n" if idx % board_size == 0
      end

    else
      puts col_separator
    end
  end
end
# rubocop: enable Metrics/AbcSize, Metrics/MethodLength

def display_slot_numbers(board_size, board)
  clear_screen
  puts "You can pick a slot number to place your mark on that position."
  puts "The board square-slots are represented by numbers as follows:\n"
  display_board(board_size, board, 'no')
end

def display_overall(score, round)
  (1..round).each do |i|
    puts "< Round #{i} > Wins: #{score[i][:user]} ||"\
    " Losses: #{score[i][:computer]} || Ties: #{score[i][:tie]}\n"
  end
end

def display_round_result(score, round)
  if score[round][:user] > score[round][:computer]
    prompt "You won this round!"
  elsif score[round][:user] < score[round][:computer]
    prompt "Computer won this round!"
  else
    prompt "This round is tied!"
  end
end

def display_game_result(board, board_size)
  if there_a_winner(board, board_size)[:user]
    puts "******* You Won! ********"
  elsif there_a_winner(board, board_size)[:computer]
    puts "******* Computer Won! ********"
  else
    puts "******* It's a tie! ********"
  end
end

########################################################
# Start Game
#########################################################

clear_screen
puts GAME_INTRO

board_size = get_board_size
board = initialize_board(board_size)
display_slot_numbers(board_size, board)

sets_to_play = get_number_of_sets
player = get_who_goes_first
choice = ''

round = 1
set = 1
score = {}
initialize_round!(score, round)

loop do
  winner = ''
  board = initialize_board(board_size)
  display_board(board_size, board)

  loop do
    break if choice == 'q'
    display_overall(score, round)
    choice = choose_from(player, board, board_size)

    update_board!(choice, board, player)
    display_board(board_size, board)
    player = switch!(player)

    winner = determine_winner!(board, board_size)
    break if game_end?(board, winner)
  end

  break if choice == 'q'
  display_game_result(board, board_size)
  sleep_until_enter
  update_score!(score, round, winner)
  display_round_result(score, round)

  set += 1

  if set > sets_to_play
    break unless ask_play_again_or_quit == 'y'
    puts "Let's play again!"
    round += 1
    initialize_round!(score, round)
    set = 1
  end
end

parting_msg
