#Q.1Q1: Write a Python program to print the following string in a specific format
a = 'Twinkle, twinkle ,little star,\n	How I wonder what you are!\n		Up above the world so high,\n		Like a diamond in the sky.\nTwinkle, twinkle ,little star,\n	How I wonder what you are'
print(a)
print('\n')

#Q.2: Write a Python program to calculate the length of a string.
l = len(a)
print('\n')

#Q.3: Write a Python program to sum all the items in a list.
sum(a)
print('\n')

#Q.4: Write a Python program to get the largest number from a list.
a=[6,5,1,1,8,5]
max(a)

#Q.5: Write a Python program to get the smallest number from a list.
min(a)

#Q.6: Write a Python program to display the first and last colors from the following list.
var = raw_input("input : ")
list1 = var.split(',') #this is list
list2 = tuple(list2)   #this is tuple

#Q.7: Write a Python program to display the first and last colors from the following list.
color_list = ["Red","Green","White","Black"]
color_list[0]
color_list[-1]

#Q.8: Write a Python program to print the following:
b = "a string that you \"don\'t\" have to escape\n\
This\n\
is a ....... multi-line\n\
heredoc string --------> example"
print(b)

#Q.9: Write a Python program to print out a set containing all the colors from a list which are not present in another list
color_list_1 = set(["White", "Black", "Red"]) 
color_list_2 = set(["Red", "Green"])
color_list_1 - color_list_2

#Q.10: Write a Python program to display your details like name, age, address in three different lines.
c = "Name = Prasad Tanaji Ovhal\n\age = 23\n\Add = Ramnagar Pune"
print(c)

#Q.11: Write a Python program to compute the future value of a specified principal amount, rate of interest, and number of years. Output Value should be rounded upto two decimal places only.
p = float(raw_input("principle amount:"))
r = float(raw_input("rate of interest:"))
N = float(raw_input("number of years:"))
interest = p*r*N/100
print("%8.2f"%(interest))

#Q.12: Write a Python program to compute the distance between the points (x1, y1) and (x2, y2).
a = input("Enter the cordinate of point A")
b = input("Enter the cordinate of point B")
import math
math.sqrt(((a[0] - b[0])**2) + ((a[1] - b[1])**2))

#Q.13: Write a Python program to get a string made of the first 2 and the last 2 chars from a given a string.
d = "prasad"
e = d[0:2] + d[-2:]
print(e)

#Q.14: a Python program to get a string from a given string where all occurrences of its first char have been changed to '$', except the first char itself.
f = "restart"
frev = f[::-1]
dolf = frev.replace(f[0],"$",1)
fnew = dolf[::-1]

#Q.15: Write a Python program to get a single string from two given strings, separated by a space and swap the first two characters of each string.
a = 'abc'
b = 'xyz'
b.replace(b[-1],a[-1]) + ' ' + a.replace(a[-1],b[-1])

#Q.16: Write a Python program to add 'ing' at the end of a given string (length should be at least 3). If the given string is already ends with 'ing' then add 'ly' instead.
string = raw_input("enter string : ")
if string[-3:]!='ing':
	string + 'ing'
else:
	string.replace('ing','ly')
	
#Q.17:  Write a Python program to change a given string to a new string where the first and last chars have been exchanged.
p = 'prasad'
p1 = p.replace(p[-1],p[0]) 
p2 = p.replace(p1[0],p[-1],1)

#Q.18: Write a Python program to get a string made of 4 copies of the last two characters of a specified string (length must be at least 2). 
py1 = 'python'
py2 = 'Exercises'
(py1[-2:])*4
(py2[-2:])*4

#Q.19: Write a Python program to add key to a dictionary.
Sample_Dictionary = {0: 10, 1: 20}
Sample_Dictionary[2] = 30
Sample_Dictionary

#Q.20: Write a Python program to concatenate following dictionaries to create a new one.
dic1={1:10, 2:20}
dic2={3:30, 4:40}
dic3={5:50,6:60}
dict = {}
dict.update(dic1)
dict.update(dic2)
dict.update(dic3)
dict

