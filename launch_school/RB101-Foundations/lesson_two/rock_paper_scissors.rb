OPTIONS = ['r', 'p', 's']

def prompt(str)
  puts "==> #{str}"
end

def valid_choice
  puts "Press r for rock, p for paper, and s for scissors."
  choice = gets.chomp.downcase
  if OPTIONS.include?(choice)
    return choice
  end
  puts "Invalid input...Let's try again!"
  valid_choice
end

def win?(user, comp)
  (user == 'r' && comp == 's') ||
    (user == 's' && comp == 'p') ||
    (user == 'p' && comp == 'r')
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

prompt("What's your name?")
name = gets.chomp

intro = <<-MSG
  Hi #{name.capitalize}! Let's play Rock, Paper, Scissors game!
  MSG
prompt(intro)

user_wins = 0
computer_wins = 0
a_tie = 0
game_total = 0

loop do
  user_choice = valid_choice
  computer_choice = OPTIONS.sample

  score = game_eval(user_choice, computer_choice)

  case score
  when 0
    a_tie += 1
    puts "It's a tie!"
  when 1
    user_wins += 1
    puts "You win!"
  else
    computer_wins += 1
    puts "Computer wins!"
  end

  game_total = a_tie + user_wins + computer_wins

  prompt("You won #{user_wins} out of #{game_total} games!")
  prompt("You lucky duck!") if user_wins > computer_wins
  prompt("Breaking even!") if user_wins == computer_wins
  prompt("Better luck next time!") if user_wins < computer_wins

  prompt("Do you want to play again?
    Press Y to calculate again.")
  response = gets.chomp

  if response.downcase().start_with?('y') == false
    prompt("Thank you for playing rock, paper, scissors. Goodbye!")
    break
  end
end
