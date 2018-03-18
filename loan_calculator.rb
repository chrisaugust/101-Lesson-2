# this program takes 3 pieces of input (loan amount, APR, and duration) and returns monthly payment amount,
# the formula used to calculate monthly payment is as follows:
# m = p * (j / (1 -(1+j)**(-n)))
# where m = monthly payment
#	p = loan amount
#	j = monthly interest rate
#	n = loan duration in months
#
# some helper functions
#
# convert years to months
def duration_in_months(years)
	years*12
end

# validate user input
def is_valid?(user_input)
  user_input.to_s.empty? || user_input.to_f < 0 ? false : true
end

# convert apr to monthly interest rate as a decimal value
def apr_to_mpr(apr)
	(apr/12)/100
end

# this is the crucial function for this program
# it takes three arguments (amount, montly interest rate, 
# and duration in months) and returns monthly payment amount
def monthly_payment(amount, monthly_interest, duration_in_months)
  monthly_payment = amount * (monthly_interest / (1 - (1 + monthly_interest)**(-duration_in_months)))
end

# begin program
loop do
  system "clear"
  puts "Welcome to Loan Calculator"
  puts "--------------------------\n"

  loan_amount = ''
  loop do
    puts "How much is your loan in dollars?"
    loan_amount = gets.chomp.to_f
    break if is_valid?(loan_amount)
    puts "Loan amount must be a positive number
          (and not higher than 100 since it's a percentage)."
  end


  puts "And how much is the APR?"
  apr = ''
  loop do
    apr = gets.chomp.to_f
    break if is_valid?(apr) && apr <= 100
    puts "APR must be a positive number."
  end

  puts "Finally, what is the duration of the loan in years?"
  duration_in_years = ''
  loop do  
    duration_in_years = gets.chomp.to_f
    break if is_valid?(duration_in_years)
    puts "The loan duration must be a positive number."
  end

  monthly_interest_rate = apr_to_mpr(apr)
  duration_in_months = duration_in_months(duration_in_years)
  monthly_payment = monthly_payment(loan_amount, monthly_interest_rate, duration_in_months)

  puts "Your monthly payment is $#{format('%02.2f', monthly_payment)}" 
  puts "--------------------------\n"
  puts "Would you like to calculate monthly payments for another loan? (Y to continue)"
  another_loan_calculation = gets.chomp.downcase
  break if another_loan_calculation != 'y'
end

puts "Thanks for using Loan Calculator"
