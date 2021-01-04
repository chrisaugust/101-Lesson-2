# Loan Calculator
#
# This program takes 3 pieces of input (loan amount, APR, and duration)
# and calculates monthly payment amount
#
# The formula used to calculate monthly payment is as follows:
# m = p * (j / (1 -(1+j)**(-n)))
# where m = monthly payment
# p = loan amount
# j = monthly interest rate
# n = loan duration in months
#
# Some helper functions
#
def display_welcome
   system 'clear' 
   puts 'Welcome to Loan Calculator'
   puts '--------------------------'
end

def retrieve_loan_amount
  loan_amount = ''
  loop do
    puts 'How much is your loan in dollars?'
    loan_amount = gets.chomp.to_f
    break if valid?(loan_amount)
    error_message
  end
  loan_amount
end

def retrieve_apr
  puts 'How much is the APR?'
  apr = ''
  loop do
    apr = gets.chomp.to_f
    break if valid?(apr) && apr <= 100
    error_message
  end
  apr
end

def retrieve_duration
  puts 'What is the duration of the loan in years?'
  duration_in_years = ''
  loop do
    duration_in_years = gets.chomp.to_f
    break if valid?(duration_in_years)
    error_message 
  end
  duration_in_years
end

def display_payment(monthly_payment)
  puts "Your monthly payment is $#{format('%02.2f', monthly_payment)}"
end

def another_calculation?
  puts 'Would you like to calculate payments for another loan? (Y to continue)'
  another_loan_calculation = gets.chomp.downcase
  return another_loan_calculation == 'y'
end

def display_goodbye
  puts 'Thanks for using Loan Calculator'
  puts 'Goodbye!'
end

# convert years to months
def duration_in_months(years)
  years * 12
end

# validate user input
def valid?(user_input)
  ((user_input.to_s.empty?) || (user_input.to_f < 0) || (/[[:space:]]/.match(user_input.to_s))) ? false : true
end

def error_message
  puts "There was a problem with the number you entered."
  puts """Please try again with a valid number 
          - no letters or words
          - no whitespace
          - no negative numbers"""
end

# convert apr to monthly interest rate as a decimal value
def apr_to_mpr(apr)
  (apr / 12) / 100
end

# This is the main function
# it takes three arguments (amount, montly interest rate,
# and duration in months) and returns monthly payment amount
def monthly_payment(amount, monthly_interest, duration_in_months)
  amount * (monthly_interest /
           (1 - (1 + monthly_interest)**-duration_in_months))
end

# Begin program
display_welcome
loop do
  loan_amount = retrieve_loan_amount
  apr = retrieve_apr
  duration_in_years = retrieve_duration

  monthly_interest_rate = apr_to_mpr(apr)
  duration_in_months = duration_in_months(duration_in_years)
  monthly_payment = monthly_payment(loan_amount, monthly_interest_rate, 
                                    duration_in_months)
  display_payment(monthly_payment)
  break unless another_calculation?
end

display_goodbye
