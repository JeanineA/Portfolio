# -*- coding: utf-8 -*-
  
balance=4213.0
annualInterestRate=0.2
monthInt=annualInterestRate/12

guess=(balance+(balance*annualInterestRate)-(balance*0.10))/12
Total=0.0
print guess
for i in range(1,13):
    MinPay=guess
    Total+=MinPay
    #formatMP='{:.2f}'.format(MinPay)
    print "Month: " +str(i)
    #print "Minimum monthly payment: "+str(formatMP)
    balance=balance-MinPay
    balance=balance+(balance*monthInt)
    formatBal='{:.2f}'.format(balance)
    print "Remaining balance: "+str(formatBal)
  
#formatTot='{:.2f}'.format(Total)
#print "Total paid: "+str(formatTot) 
#print "Remaining balance: "+str(formatBal)



    