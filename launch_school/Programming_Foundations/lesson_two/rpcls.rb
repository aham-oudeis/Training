OPTIONS = ['r', 'p', 'c', 'l', 's']
OPTIONS_FULL = { "r" => "ROCK", "p" => "PAPER", "c" => "SCISSORS",
                 "l" => "LIZARD", "s" => "SPOCK" }

def prompt(str)
  puts "==> #{str}"
end

def valid_choice
  prompt "Press one of the following keys: r, p, c, l, s"
  choice = gets.chomp.downcase
  if OPTIONS.include?(choice)
    return choice
  end
  puts "Invalid input...Let's try again!"
  valid_choice
end

def win?(user, comp)
  user_win_combs = [['r', 'c'], ['r', 'l'], ['p', 'r'], ['p', 's'],
                    ['c', 'p'], ['c', 'l'], ['l', 's'], ['l', 'p'],
                    ['s', 'c'], ['s', 'r']]

  user_win_combs.include?([user, comp])

  # ['c', 'l'].include?(comp) && user == 'r' ||
  #   ['r', 's'].include?(comp) && user == 'p' ||
  #   ['p', 'l'].include?(comp) && user == 'c' ||
  #   ['s', 'p'].include?(comp) && user == 'l' ||
  #   ['c', 'r'].include?(comp) && user == 's'
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
    prompt "It's a tie!"
  when 1
    prompt "You win!"
  else
    prompt "Computer wins!"
  end
end

prompt("What's your name?")
name = gets.chomp

intro = <<-MSG
Hi #{name.capitalize}! Let's play Rock, Paper, Scissors, Lizard, Spock game!

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
  
  MSG
prompt(intro)

round = 0
sets = 0
user_wins = 0
computer_wins = 0
a_tie = 0
game_total = {}

loop do
  prompt("Round #{round + 1}") if sets % 5 == 0
  user_choice = valid_choice
  computer_choice = OPTIONS.sample

  sets += 1

  prompt("You chose #{OPTIONS_FULL[user_choice]} and computer chose #{OPTIONS_FULL[computer_choice]}")

  score = game_eval(user_choice, computer_choice)
  score_msg(score)

  case score
  when 0
    a_tie += 1
  when 1
    user_wins += 1
  else
    computer_wins += 1
  end

  game_total["Round #{round + 1}"] = ["#{user_wins} wins", "#{computer_wins} losses", "#{a_tie} ties"]
  round += (sets / 5)

  if sets % 5 == 0
    tally = <<-MSG 
Wins: #{user_wins}  |  Losses: #{computer_wins}  |  Ties: #{a_tie}
    MSG
    prompt(tally)
    prompt("Round #{round} is tied!") if computer_wins == user_wins
    prompt("You won round Round #{round}!") if user_wins > computer_wins
    prompt("Computer won Round #{round}!") if computer_wins > user_wins
    prompt("Press Y to play again.")
    response = gets.chomp
    if response.downcase().start_with?('y') == false
      game_total.each do |k, v|
        v1 = v[0]
        v2 = v[1]
        v3 = v[2]
        puts(k + ": " + v1 + " | " + v2 + " | "+ v3)
      end

      prompt("You played #{round} rounds.")
      prompt("Thank you for playing Rock, Paper, Scissors, Spock, Lizard.
    Goodbye!")
      break
    end

  sets = 0
  user_wins = 0
  computer_wins = 0
  a_tie = 0
  end
end
