VALID_CHOICES = %w(rock paper scissors lizard Spock)
BEATS = {rock: ['scissors', 'lizard'],
              paper: ['rock', 'Spock'],
              scissors: ['paper', 'lizard'],
              lizard: ['Spock', 'paper'],
              Spock: ['rock', 'scissors']}

def win?(first, second)
  (first == 'rock' && BEATS[:rock].include?(second)) ||
    (first == 'paper' && BEATS[:paper].include?(second)) ||
    (first == 'scissors' && BEATS[:scissors].include?(second)) ||
    (first == 'lizard' && BEATS[:lizard].include?(second)) ||
    (first == 'Spock' && BEATS[:Spock].include?(second))
end

def display_result(player, computer)
  if win?(player, computer)
    prompt('You won!')
  elsif win?(computer, player)
    prompt('Computer won!')
  else
    prompt("It's a tie!")
  end
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

choice = ''

loop do
  system "clear"
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_result(choice, computer_choice)

  prompt('Do you want to play again? (Y to play)')
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing.")
