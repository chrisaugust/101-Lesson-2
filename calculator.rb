# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation
# output results

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(number)
  number.to_i != 0
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt("Welcome to Calculator!")
prompt("What's your name?")

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

prompt("Hello #{name}!")

loop do
  number1 = nil
  loop do
    prompt("What's the first number?")
    number1 = gets.chomp
    if valid_number?(number1)
      break
    else
      prompt("Something was wrong. Try again with a number (and not 0).")
    end
  end

  number2 = nil
  loop do
    prompt("What's the second number?")
    number2 = gets.chomp()
    if valid_number?(number2)
      break
    else
      prompt("Something was wrong. Try again with a number (and not 0).")
    end
  end

  operator_prompt = <<-MSG
  What operation would you like to perform?
  1 for add
  2 for subtract
  3 for multiply
  4 for divide
  MSG
  prompt(operator_prompt)
  operator = nil
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3, or 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two number...")

  result =  case operator
            when "1"
              number1.to_i + number2.to_i
            when "2"
              number1.to_i - number2.to_i
            when "3"
              number1.to_i * number2.to_i
            when "4"
              number1.to_f / number2.to_f
            end

  prompt("The result is: " + result.to_s)

  prompt("Would you like to perform another calculation?
         (Y to calculate again)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you, #{name}, for using the calculator. Bye.")
