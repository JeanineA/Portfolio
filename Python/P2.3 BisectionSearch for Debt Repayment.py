"""
Paying off Debt in 1 Year
write a program that calculates the minimum fixed monthly payment needed in order pay off
a credit card balance within 12 months. Payment amount should be a multiple of $10.
The program should print out one line showing the  
lowest monthly payment that will pay off all debt in under 1 year. 
"""
#balance=int(raw_input("Enter the balance of the credit card you wish to pay off in 1 year: "))
#annualInterestRate=float(raw_input("Enter the annual interest rate as a decimal (ie; enter .18 for 18%): "))
balance=999999
annualInterestRate=0.18
monthlyInterestRate = (annualInterestRate/12)

low=balance/12
high=(balance*(1+monthlyInterestRate)**12)/12.0

guess=(low+high)/2
leftover=balance
precision=0.01
while(leftover>=precision):
    guess = (low + high)/2
    print "low is: "+str(low)
    print "high is: "+str(high)
    for i in range(1,13):
        print "============="
        print "month "+str(i)
        print "payment is: "+str(guess)
        newbalance=leftover-guess    
        print "new balance is :"+str(newbalance)
        leftover=newbalance+(newbalance*monthlyInterestRate)
        print "leftover is :"+str(leftover)
    if leftover < 0:
        print "payment is high"
        high=guess
        print "new range high is :"+str(high)
        leftover=balance
    elif leftover > precision: 
        low=guess
        print "payment is low"
        print "new range low is: "+str(low) 
        leftover=balance
print "Lowest Payment: %.2f" %(guess)          

formatpay='{:.2f}'.format(guess)
print "Lowest Payment: "+ str(formatpay)          
                    
                                        
            
"""while newbalance > 0:
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
print "Lowest Payment: "+ str(formatpay)"""   