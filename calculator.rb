# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation
# output results

require 'yaml'

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(key, name='', op='')
  message = messages(key, LANGUAGE)
  puts("=> #{op} #{message} #{name}")

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

puts "Choose a language. English (en) or Japanese (ja)."
LANGUAGE = gets.chomp
MESSAGES = YAML::load_file('calculator.conf')

prompt('welcome_message')

prompt('ask_for_name')

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt('name_error')
  else
    break
  end
end

prompt('greet_by_name', name)

loop do
  number1 = nil
  loop do
    prompt('ask_for_first_number')
    number1 = gets.chomp
    if valid_number?(number1)
      break
    else
      prompt('number_error')
    end
  end

  number2 = nil
  loop do
    prompt('ask_for_second_number')
    number2 = gets.chomp()
    if valid_number?(number2)
      break
    else
      prompt('number_error')
    end
  end

  prompt('ask_for_operator')
  operator = nil
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt('operator_error')
    end
  end

  prompt('in_progress','', operation_to_message(operator))
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

  prompt('result')  
  puts result

  prompt('another?')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('goodbye_message', name)
