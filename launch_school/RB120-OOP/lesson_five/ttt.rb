module GameConstants
  SET_LIMIT = 3
  EMPTY_MARKER = "  "
  COMPUTER_MARKER = "OO"
  HUMAN_MARKER = "XX"
  PLAYER_MARKERS = [COMPUTER_MARKER, HUMAN_MARKER]
  SQUARE_SIZE = 8
  SIZE_OPTION = ['Board size 3', 'Board size 5', 'Board size 7']
  PLAY_SUMMARY_EXIT = ['Play again', 'Show game summary', 'Quit the game']
  SQ_NUMS = ['Show square numbers', 'Do not show square numbers']
  GAME_MENU = %w(1 2 3).zip(PLAY_SUMMARY_EXIT).to_h
  SHOW_BOARD_NUMBERS = %w(1 2).zip(SQ_NUMS).to_h
  BOARD_SIZES = %w(3 5 7).zip(SIZE_OPTION).to_h
  INTRO = "Welcome to Tic Tac Toe! You can play on board size 3, 5, or 7.\n\n"\
        "Rules: \n"\
        "The board consists of 9, 25, or 49 squares. Each player\n "\
        "takes turn to place their marker on the available square.\n\n"\
        "To Win:\n"\
        "The player who places their marker on a straight line across\n"\
        "the board wins. We shall play #{SET_LIMIT} sets in one round.\n"\
        "By the end of the round, the player to win the higher number\n"\
        "of sets in the round is the winner."

  Q_TO_QUIT = "During the game, you can enter Q to quit the game."
  T_TO_TOGGLE = "   Or, T to show/hide square numbers."
  PARTING_MSG = "Thank you for playing Tic Tac Toe! Goodbye!"
end

module CoreTools
  class Banner
    SIZE = 60
    attr_reader :message, :width

    def initialize(message, width=SIZE)
      @message = message
      @width = width
    end

    def to_s
      [horizontal_rule, empty_line, message_line,
       empty_line, horizontal_rule].join("\n")
    end

    private

    def horizontal_rule
      "+-#{'-' * width}-+"
    end

    def empty_line
      "| #{' ' * width} |"
    end

    def message_line
      @message.split("\n").map do |slices|
        "| " + slices.center(width) + " |"
      end
    end
  end

  def prompt(str)
    puts "=> #{str}"
  end

  def clear
    system('clear')
  end

  def join_or(arr)
    return arr.join if arr.size < 2
    [arr[0...(arr.size - 1)].join(', '), arr[-1]].join(', or ')
  end
end

module Displayable
  include GameConstants
  include CoreTools

  def ask_until_valid(options)
    display_to_do(options)
    keep_asking_until_valid(options)
  end

  def display_to_do(options)
    options.each do |num, action|
      puts "Enter #{num}:  #{action}."
    end
  end

  def determine_board_size
    clear
    puts "Hi, #{human}! Please choose the board size."
    ask_until_valid(BOARD_SIZES).to_i
  end

  def display_game_intro
    clear
    puts Banner.new(INTRO, 65)
    prompt Q_TO_QUIT
    puts T_TO_TOGGLE
    puts
  end

  def display_board
    board.print
    puts
  end

  def display_game_header
    clear
    display_players
    display_score
    puts
  end

  def display_players
    puts "\t\t#{human} vs. #{computer}"
  end

  def display_winner
    verdict = (winner ? "#{current_player} won!" : "It's a tie!")
    prompt verdict
  end

  def display_set_verdict(winner)
    verdict =
      if winner
        "So, #{winner} won!"
      else
        "So, it's a tie!"
      end
    print verdict + "\n"
  end

  def display_round_verdict
    clear
    verdict =
      if score.round_winner
        "#{score.round_winner} won this round!"
      else
        "This round is tied!"
      end

    puts Banner.new(verdict)
  end

  def display_game_summary
    clear
    puts "Game Summary"
    puts "No round completed yet" if history.empty?
    history.each do |round, score_data|
      puts "|Round #{round}|  Wins: #{score_data.wins}  ||"\
           " Losses: #{score_data.losses} || Ties: #{score_data.ties}"
    end
    puts
  end

  def display_score
    puts
    puts "|Round #{round}|  Wins: #{score.wins}"\
         "  || Losses: #{score.losses} || Ties: #{score.ties}"
  end

  def keep_asking_until_valid(options)
    loop do
      answer = gets.chomp.strip
      return answer if options.keys.include? answer.downcase
      puts "Sorry, must be #{join_or(options.keys)}."
    end
  end

  def sleep_until_enter
    puts
    print "Press ENTER to continue..."
    response = gets.chomp
    sleep unless response
  end

  def display_parting_message
    clear
    puts Banner.new(PARTING_MSG, 65)
  end
end

module Updatable
  def mark_slot(player, number)
    board.slots[number].value = player.mark
  end

  def next_round
    @round += 1
  end

  def reset_score
    self.score = Score.new(round)
  end

  def start_new_board
    self.board = Board.new(board_size)
    self.winner = nil
  end

  def store_round_score
    history[round] = score
  end

  def switch(player)
    self.current_player = (player == human ? computer : human)
  end

  def update_board_with_choice
    choice = acquire_slot_number
    if choice == 'q'
      self.current_player = nil
      return
    elsif choice == 't'
      switch_board_numbers
    end
    mark_slot(current_player, choice.to_i) unless choice == 't'
  end

  def update_round_winner
    win_loss_diff = score.wins - score.losses
    score.round_winner =
      if win_loss_diff > 0
        human
      elsif win_loss_diff < 0
        computer
      end
  end

  def update_winner
    self.winner = current_player
  end

  def update_score
    case winner
    when human    then score.wins += 1
    when computer then score.losses += 1
    else               score.ties += 1
    end
  end
end

class Score
  attr_accessor :wins, :ties, :losses, :round, :round_winner

  def initialize(round)
    @wins = 0
    @ties = 0
    @losses = 0
    @round_winner = nil
    @round = round
  end
end

class Square
  attr_accessor :value

  def initialize(value)
    @value = value
  end

  def unmarked?
    empty? || numbered?
  end

  def marked?
    !unmarked?
  end

  def marked_by?(player)
    value == player.mark
  end

  def numbered?
    value.match?(/\d/)
  end

  def empty?
    value.match?(/#{GameConstants::EMPTY_MARKER}/)
  end

  def to_s
    value
  end
end

class Board
  include GameConstants
  attr_reader :size
  attr_accessor :slots, :winning_square, :losing_square

  def initialize(num)
    @size = num
    @slots = init_slots(size**2)
    @winning_square = nil
    @losing_square = nil
  end

  def print
    size.times { |index| print_row(index) }
  end

  def winner?(player)
    winning_combos.any? do |line|
      line.all? { |position| slots[position].marked_by?(player) }
    end
  end

  def squares_numbered?
    slots.values.any?(&:numbered?)
  end

  def unmarked_slots
    slots.select { |_, square| square.unmarked? }.keys.map(&:to_s)
  end

  def full?
    slots.values.all? { |square| PLAYER_MARKERS.include?(square.value) }
  end

  def toggle
    squares_numbered? ? remove_board_numbers : insert_board_numbers
  end

  def select_optimal_square(player)
    if about_to_win?(player)
      find_winning_square(player)
    elsif about_to_lose?(player)
      find_losing_square(player)
    elsif middle_square_available?
      find_middle_square
    else
      find_random_square
    end
  end

  private

  def winning_combos
    slots_matrix + slots_matrix.transpose +
      diagonal(slots_matrix) + diagonal(slots_matrix.reverse)
  end

  def about_to_lose?(player)
    winning_combos.any? do |arr|
      possible_to_lose?(player, arr)
    end
  end

  def about_to_win?(player)
    winning_combos.any? do |arr|
      possible_to_win?(player, arr)
    end
  end

  def middle_square_available?
    middle_square = ((size ** 2) / 2.0).ceil
    slots[middle_square].unmarked? if size.odd?
  end

  def find_losing_square(player)
    losing_line(player).find { |key| slots[key].unmarked? }
  end

  def losing_line(player)
    winning_combos.find { |arr| possible_to_lose?(player, arr) }
  end

  def find_winning_square(player)
    winning_line(player).find { |key| slots[key].unmarked? }
  end

  def winning_line(player)
    winning_combos.find { |arr| possible_to_win?(player, arr) }
  end

  def find_middle_square
    ((size ** 2) / 2.0).ceil
  end

  def find_random_square
    unmarked_slots.sample
  end

  def possible_to_win?(player, arr)
    one_unmarked_square?(arr) &&
      all_other_squares_owned?(player, arr)
  end

  def all_other_squares_owned?(player, arr)
    arr.count { |key| slots[key].marked_by?(player) } == size - 1
  end

  def one_unmarked_square?(arr)
    arr.one? { |key| slots[key].unmarked? }
  end

  def all_other_squares_taken?(player, arr)
    total_taken_squares =
      arr.count do |key|
        slots[key].marked? &&
          slots[key].value != player.mark
      end
    total_taken_squares == size - 1
  end

  def possible_to_lose?(player, arr)
    one_unmarked_square?(arr) &&
      all_other_squares_taken?(player, arr)
  end

  def slots_matrix
    slots.keys.each_slice(size).to_a
  end

  def diagonal(slots_matrix)
    diagonal = []
    slots_matrix.each_with_index do |array, idx|
      diagonal << array[idx]
    end
    [diagonal]
  end

  def init_slots(num)
    (1..num).each_with_object({}) do |key, all_slots|
      all_slots[key] = Square.new(format("%2d", key))
    end
  end

  def empty_line
    ([" " * SQUARE_SIZE] * size).join("|")
  end

  def double_empty_lines
    2.times { empty_line }
  end

  def separator
    (["-" * SQUARE_SIZE] * size).join("+")
  end

  def slot_line(index)
    "   #{rows[index].join(gap_between_slots)}   "
  end

  def rows
    slots.values.each_slice(size).to_a
  end

  def gap_between_slots
    ([" " * ((SQUARE_SIZE / 2) - 1)] * 2).join("|")
  end

  def print_row(index)
    puts [empty_line, slot_line(index), empty_line]
    puts separator unless index == size - 1
  end

  def insert_board_numbers
    slots.each do |key, square|
      slots[key].value = format("%2d", key) if square.empty?
    end
  end

  def remove_board_numbers
    slots.each do |key, square|
      slots[key].value = EMPTY_MARKER if square.numbered?
    end
  end
end

class Player
  include GameConstants
  include CoreTools
  attr_accessor :name
  attr_reader :mark

  def initialize
    @name = determine_name
  end

  def to_s
    name
  end
end

class Human < Player
  def initialize
    super
    @mark = HUMAN_MARKER
  end

  def determine_name
    designator = ''
    loop do
      print "==> Please enter your name. "
      designator = gets.chomp.strip
      break if designator.match?(/[a-z]/i)
    end
    self.name = designator.capitalize
  end

  def valid_choice(board)
    options = board.unmarked_slots
    puts
    prompt "Please choose #{join_or(options)} to place your marker."
    choice = gets.chomp.strip
    extended_options = options + ['q', 't']
    valid = extended_options.include?(choice)
    return choice if valid
    puts "Sorry, Invalid Choice. Try again!"

    valid_choice(board)
  end
end

class Computer < Player
  def initialize
    super
    @mark = COMPUTER_MARKER
  end

  def determine_name
    self.name = ["Omega", "Pinnochio", "Mario", "Pal"].sample
  end

  def valid_choice(board)
    board.select_optimal_square(self)
  end
end

class TTTGame
  private

  include GameConstants
  include Displayable
  include Updatable

  attr_reader :human, :computer, :board_size
  attr_accessor :board, :winner, :current_player, :score, :history, :round

  def initialize
    display_game_intro
    @human = Human.new
    @computer = Computer.new
    @board_size = determine_board_size
    @board = Board.new(board_size)
    @history = {}
    @round = 1
    @score = Score.new(round)
    @winner = nil
    @current_player = nil
  end

  public

  def play
    game_loop
    display_parting_message
  end

  private

  def game_loop
    loop do
      one_round
      loop do
        to_do = ask_until_valid(GAME_MENU).to_i
        return nil if to_do == 3
        break if to_do == 1
        display_game_summary if to_do == 2
      end
    end
  end

  def one_round
    SET_LIMIT.times do |_|
      play_one_set
      return nil if current_player.nil?
    end
    update_round_winner
    display_round_verdict unless current_player.nil?
    prepare_next_round
  end

  def play_one_set
    start_new_board
    one_set_loop
    return if current_player.nil?
    update_score
    clear
    display_game_header
    display_board
    display_winner
    sleep_until_enter
  end

  def one_set_loop
    self.current_player = human
    loop do
      display_game_header
      display_board
      update_board_with_choice
      return if current_player.nil?
      update_winner if board.winner?(current_player)
      return if winner || board_full?
      switch(current_player)
    end
  end

  def acquire_slot_number
    current_player.valid_choice(board)
  end

  def board_full?
    board.full?
  end

  def choose_who_goes_first; end

  def open_slots
    board.unmarked_slots
  end

  def players
    [human, computer]
  end

  def prepare_next_round
    store_round_score
    next_round
    reset_score
  end

  def switch_board_numbers
    board.toggle
    display_game_header
    display_board
    update_board_with_choice
  end
end

TTTGame.new.play
