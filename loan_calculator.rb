# this program takes 3 pieces of input (loan amount, APR, and duration) and returns monthly interest and loan duration in months
# formula used to calculate monthly payment is as follows:
# m = p * (j / (1 -(1+j)**(-n)))
# where m = monthly payment
#	p = loan amount
#	j = monthly interest rate
#	n = loan duration in months
# so the program will return the values for j and n
# 
# input values will be floats
# output values will be floats
#
# algorithm
# convert loan duration from years to months 
# convert APR to monthly interest rate
# plug p, j, and n values into the monthly payment formula
# display monthly payment value to user
# 
# helper functions

def duration_in_months(years)
	years*12
end

# the following returns mpr as a decimal value

def apr_to_mpr(apr)
	(apr/12)/100
end

# this is the crucial function for this program,
# a function that takes three arguments (amount, montly interest rate, 
# and duration in months) and returns monthly payment amount

def monthly_payment(amount, monthly_interest, duration_in_months)
  monthly_payment = amount * (monthly_interest / (1 - (1 + monthly_interest)**(-duration_in_months)))
end

# begin program logic

puts "Welcome to Loan Calculator"
puts "--------------------------\n"

loop do
puts "To begin, please answer the following questions:"

puts "How much is your loan in dollars?"
loan_amount = gets.chomp.to_f

puts "And how much is the APR?"
apr = gets.chomp.to_f

puts "Finally, what is the duration of the loan in years?"
duration_in_years = gets.chomp.to_f

monthly_interest_rate = apr_to_mpr(apr)
duration_in_months = duration_in_months(duration_in_years)
monthly_payment = monthly_payment(loan_amount, monthly_interest_rate, duration_in_months)

puts "Your monthly payment is: " + monthly_payment.to_s
puts "--------------------------\n"
puts "Would you like to calculate monthly payments for another loan? (Y to continue)"
another = gets.chomp.downcase
break if another != 'y'
end

puts "Thanks for using Loan Calculator"
