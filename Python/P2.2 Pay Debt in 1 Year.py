"""
Paying off Debt in 1 Year
write a program that calculates the minimum fixed monthly payment needed in order pay off
a credit card balance within 12 months. 
The program should print out one line: 
the lowest monthly payment that will pay off all debt in under 1 year. 
"""

balance=int(raw_input("Enter the balance of the credit card you wish to pay off in 1 year: "))
annualInterestRate=float(raw_input("Enter the annual interest rate as a decimal (ie; enter .18 for 18%): "))
monthlyInterestRate = (annualInterestRate/12)
monthlyPayment = 0
newbalance = balance
while newbalance > 0:
    monthlyPayment += 10
    newbalance = balance
    month = 1

    while month <= 12 and newbalance > 0:
        newbalance -= monthlyPayment
        interest = monthlyInterestRate * newbalance
        newbalance += interest
        month += 1
    newbalance = round(newbalance,2)

formatpay='{:.2f}'.format(monthlyPayment)
print "Lowest Payment: "+ str(formatpay)   