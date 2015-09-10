""" Text Parsing: Alphabetical Order
Write a program that prints the longest alphabetical string within a user-entered series of letters.
The letters do not have to be in sequence (only requirement is alpha order).  
In the case of ties, print the first string occurrence."""
s=raw_input("Enter a series of letters and find the longest series in alphabetical order: ")
print "(Note: any capitalized letters will first be converted to lower case letters",
print "and the answer will be presented in lower case.)"
s=s.lower()
sLen=len(s)
temp_s=longest=s[0]
longest=""
for i in range(1,sLen):
    if ord(s[i])>=ord(s[i-1]):
        temp_s=temp_s+s[i]
    else:
        if len(temp_s)>len(longest):
            longest=temp_s 
            temp_s=s[i]
        else:
            temp_s=s[i]
if len(temp_s)>len(longest):
    longest=temp_s
print "Longest substring in alphabetical order is: "+longest                          
                   
          
         
"""def longest_nondecreasing_substring(s):
    if s is None or len(s) <= 1:
       return s
    longest = test = s[0]

    for i in range(1, len(s)):
        if ord(s[i]) >= ord(s[i - 1]):
            test += s[i]
        else:
            if len(longest) < len(test):
                longest = test
            test = s[i]
    if len(longest) < len(test):
        longest = test
    return longest"""
    