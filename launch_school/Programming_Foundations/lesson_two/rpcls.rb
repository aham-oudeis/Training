OPTIONS = ['r', 'p', 'c', 'l', 's']
OPTIONS_FULL = { "r" => "ROCK", "p" => "PAPER", "c" => "SCISSORS",
                 "l" => "LIZARD", "s" => "SPOCK" }
SET_LIMIT = 5

intro = <<-MSG
Let's play Rock, Paper, Scissors, Lizard, Spock game!

  Rules: Rock crushes Scissors cuts Paper
  covers Rock crushes Lizard poisons Spock
  smashes Scissors decapitates Lizard eats
  Paper disproves Spock vaporizes Rock.

  For this game each one is represented as follows:
    Rock as       r
    Paper as      p
    SCissors as   c
    Lizard as     l
    Spock as      s
  
  We shall play #{SET_LIMIT} number of sets in each round.

  Press ENTER to continue. or, Q to quit.
  MSG

def prompt(str)
  puts "==> #{str}"
end

def parting_msg
  prompt("Thank you for playing Rock, Paper, Scissors, Lizard, Spock.
    Goodbye!")
end

def play_again_get_summary_or_quit
  puts("\nPress Y to play again (S for game summary); anything else to quit.")
end

def sleep_until_enter(response)
  if response.nil?
    sleep
  end
end

def get_valid_choice
  choice = ''

  loop do
    prompt "Press one of the following keys: r, p, c, l, s"
    choice = gets.chomp.downcase
    break if OPTIONS.include?(choice)
    puts "Invalid input...Let's try again!"
  end

  choice
end

def who_chose_what(user_choice, computer_choice)
  user_choice_name = OPTIONS_FULL[user_choice]
  computer_choice_name = OPTIONS_FULL[computer_choice]
  prompt("You chose #{user_choice_name} and computer chose #{computer_choice_name}.")
end

def win?(user, comp)
  user_win_combs = [['r', 'c'], ['r', 'l'], ['p', 'r'], ['p', 's'],
                    ['c', 'p'], ['c', 'l'], ['l', 's'], ['l', 'p'],
                    ['s', 'c'], ['s', 'r']]

  user_win_combs.include?([user, comp])
end

def game_eval(user, comp)
  if user == comp
    0
  elsif win?(user, comp)
    1
  else
    -1
  end
end

def score_msg(num)
  case num
  when 0
    "It's a tie!"
  when 1
    "You win!"
  else
    "Computer wins!"
  end
end

def display_who_wins(user_score, comp_score, round)
  if comp_score == user_score
    prompt "Round #{round} is tied!"
  elsif user_score > comp_score
    prompt "You won round Round #{round}!"
  else
    prompt "Computer won Round #{round}!"
  end
end

def display_round_result(wins, loss, ties)
  tally = <<-MSG
  \nWins: #{wins}  |  Losses: #{loss}  |  Ties: #{ties}\n
      MSG
  puts(tally)
end

def display_game_summary(game_data)
  game_data.each do |k, v|
    puts("\n #{k} : Wins #{v[:wins]} | Losses #{v[:losses]} | Ties #{v[:ties]}")
  end
end

# start game
prompt(intro)

continue_or_not = gets.chomp

if continue_or_not.downcase != 'q'
  system('clear')
  round = 0
  sets = 0
  user_wins = 0
  computer_wins = 0
  a_tie = 0
  update_game_results = {}

  loop do
    # clear the sets data when the number of sets hits the SET_LIMIT
    if sets % SET_LIMIT == 0
      sets = 0
      user_wins = 0
      computer_wins = 0
      a_tie = 0
      system('clear')
    end

    puts("\n***   Round #{round + 1}   ***") if sets % SET_LIMIT == 0
    user_choice = get_valid_choice
    computer_choice = OPTIONS.sample
    sets += 1

    score = game_eval(user_choice, computer_choice)
    eval_msg = score_msg(score)

    who_chose_what(user_choice, computer_choice)
    prompt(eval_msg)

    case score
    when 0
      a_tie += 1
    when 1
      user_wins += 1
    else
      computer_wins += 1
    end

    update_game_results["Round #{round + 1}"] =
      { wins: user_wins, losses: computer_wins, ties: a_tie }

    # add 1 to the round when sets reaches the SET_LIMIT
    round += (sets / SET_LIMIT)

    if sets % SET_LIMIT == 0
      prompt("Tallying score for round #{round}...")
      sleep(1)
      display_round_result(user_wins, computer_wins, a_tie)
      display_who_wins(user_wins, computer_wins, round)

      play_again_get_summary_or_quit
      response = gets.chomp

      if response.downcase().start_with?('s')
        system('clear')
        display_game_summary(update_game_results)

        puts "\n Press Enter to continue playing..."

        sleep_until_enter(gets.chomp)

      elsif response.downcase().start_with?('y') == false
        parting_msg
        break
      end
    end
  end
else
  parting_msg
end
