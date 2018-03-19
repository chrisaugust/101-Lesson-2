VALID_CHOICES = %w(rock paper scissors lizard Spock)
ABBREVIATIONS = %w(r p s l sp)
BEATS = { rock:      ['scissors', 'lizard'],
          paper:     ['rock', 'Spock'],
          scissors:  ['paper', 'lizard'],
          lizard:    ['Spock', 'paper'],
          Spock:     ['rock', 'scissors'] }

def win?(first, second)
  (first == 'rock' && BEATS[:rock].include?(second)) ||
    (first == 'paper' && BEATS[:paper].include?(second)) ||
    (first == 'scissors' && BEATS[:scissors].include?(second)) ||
    (first == 'lizard' && BEATS[:lizard].include?(second)) ||
    (first == 'Spock' && BEATS[:Spock].include?(second))
end

def display_result(player, computer)
  if win?(player, computer)
    prompt('You won this round!')
  elsif win?(computer, player)
    prompt('Computer won this round!')
  else
    prompt("This round is a tie!")
  end
end

def display_score(player_wins, computer_wins)
  prompt("Your score is #{player_wins}; Computer's score is #{computer_wins}")
  puts
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def convert(word_or_letter)
  case word_or_letter.downcase
  when 'r'
    'rock'
  when 'p'
    'paper'
  when 's'
    'scissors'
  when 'l'
    'lizard'
  when 'sp'
    'Spock'
  else
    word_or_letter
  end
end

loop do
  system "clear"
  computer_wins = 0
  player_wins = 0
  round_number = 1

  choice = ''

  prompt("ROCK PAPER SCISSORS LIZARD SPOCK")
  until computer_wins == 5 || player_wins == 5
    prompt("Round #{round_number}")
    prompt("--------------------")

    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}")
      prompt("Type whole word, or just the first letter (sp for Spock)")
      user_input = Kernel.gets().chomp()

      if VALID_CHOICES.include?(user_input) ||
         ABBREVIATIONS.include?(user_input)
        choice = convert(user_input)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    prompt("You chose: #{choice}; Computer chose: #{computer_choice}")
    puts

    if win?(choice, computer_choice)
      player_wins += 1
    elsif win?(computer_choice, choice)
      computer_wins += 1
    end
    round_number += 1

    display_result(choice, computer_choice)

    display_score(player_wins, computer_wins)

    if player_wins == 5
      prompt("You win the match!")
    elsif computer_wins == 5
      prompt("Computer wins the match!")
    end
  end

  prompt('Do you want to play another match? (y or n)')
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing.")
