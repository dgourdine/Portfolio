#! /usr/bin/python

# Creator: David Gourdine
# Date: 4/17/14
# Class: ITEC - 345 

# Purpose: Create a custom script for your server 



# Overview: Pt 1. 
# 
# 1. Create a 'Mad Libs' like game which asks the user to enter a series of nouns, verbs
# adjectives, adverbs, plural nouns, past tense verbs, etc....
#
# 2. Generates a paragraph which is syntactically correct but semantically ridiculous 
#

# Instructions: 
#
# 1. Create a file called LAB3.py
#
# 2. prompt the user for about 10 words or phrases and store each result in a "Dictionary"
#	   * There should be a function dedicated to the task of acquiring the user input. 
#
# 3. After the input has been entered, display the resulting *story* back to the user
# 	   * You should have a function dedicated to the task of displaying the output "story"
#
# 4. Use multiple print statements 
#
# 5. Make sure that your functions are well commented! 



# Overview: Pt 2. 
# 
#  - After the user enters all of their words, ask the user if they would like to display
#    all of their entries in 
#
# 1. Upper - Case
# 2. lower - case
# 3. Capitalized - case
# 4. Reversed words 
#
#



	
def welcomePrompt():  # Instructs the user on what to do
	
	print " " # prints an empty space when the program is output to the screen
	print "Welcome to my mad lib generator!" # welcomes the user
	print " " # prints an empty space
	print ("After Responding to Each Prompt, click enter") #instructions 
	print " "  # prints an empty space
	
	


def madlib(): # ask the user to enter values to fill into the mad lib Dictionary

	madLibDict = {} # defines 'madLibDict' as a dictionary
	
	# words that will fill the mad lib dictionary 
	
	madLibDict["adj1"] = raw_input("1.  Enter an adjective: ")
	madLibDict["noun1"] = raw_input("2.  Enter a noun: ")
	madLibDict["number1"] = raw_input("3.  Enter a number: ")
	madLibDict["bodyPart"] = raw_input("4.  Enter a body part that ends in 's' : ")
	madLibDict["verb"] = raw_input("5.  Enter a past tense verb: ")
	madLibDict["place"] = raw_input("6.  Enter a place: ")
	madLibDict["Name"] = raw_input("7.  Enter a name: ")
	madLibDict["number2"] = raw_input("8.  Enter another number: ")
	madLibDict["adjective2"] = raw_input("9.  Enter another adjective: ")
	madLibDict["pluralNoun2"] = raw_input("10. Enter another plural noun: ")
	madLibDict["phrase"] = raw_input("11. Enter a phrase: ")
	
	
	return madLibDict
	
	print " "  	# prints an empty space 
	
	
	
def printDict (madLibDict): # prints the regular madLib   
	
	print " Here is your mad lib......."
	print " "            
	print "Last night I dreamed that I was a", madLibDict["adj1"], madLibDict["noun1"], 
	print "with", madLibDict["number1"], madLibDict["bodyPart"],". I then", 
	print madLibDict["verb"],"to", madLibDict["place"], "with my friend" 
	print madLibDict["Name"],", and ate", madLibDict["number2"], madLibDict["adjective2"], 		 	 
	print madLibDict["pluralNoun2"],"." " After we finished eating", madLibDict["Name"], 			
	print "yelled", "\"", madLibDict["phrase"], "\" ","and I woke up from my dream."
	
	print " "   # prints an empty space 
	print "-----------------------------------------------------------" # line separator
	
			         
def printDictUpper (madLibDict): # prints mad lib values in all uppercase
	
	print " Here is your mad lib (in uppercase) ......."
	print " "            
	print "Last night I dreamed that I was a", madLibDict["adj1"].upper(), madLibDict["noun1"].upper(), 
	print "with", madLibDict["number1"].upper(), madLibDict["bodyPart"].upper(),". I then", 
	print madLibDict["verb"].upper(),"to", madLibDict["place"].upper(), "with my friend" 
	print madLibDict["Name"].upper(),", and ate", madLibDict["number2"].upper(), madLibDict["adjective2"].upper(), 		 	 
	print madLibDict["pluralNoun2"].upper(),"." " After we finished eating", madLibDict["Name"].upper(), 			
	print "yelled", "\"", madLibDict["phrase"].upper(), "\" ","and I woke up from my dream."
	
	print " "   # prints an empty space 
	print "-----------------------------------------------------------" # line separator


def printDictLower (madLibDict): # prints mad lib values in all lowercase
	
	print " Here is your mad lib (in lowercase)......."
	print " "            
	print "Last night I dreamed that I was a", madLibDict["adj1"].lower(), madLibDict["noun1"].lower(), 
	print "with", madLibDict["number1"].lower(), madLibDict["bodyPart"].lower(),". I then", 
	print madLibDict["verb"].lower(),"to", madLibDict["place"].lower(), "with my friend" 
	print madLibDict["Name"].lower(),", and ate", madLibDict["number2"].lower(), madLibDict["adjective2"].lower(), 		 	 
	print madLibDict["pluralNoun2"].lower(),"." " After we finished eating", madLibDict["Name"].lower(), 			
	print "yelled", "\"", madLibDict["phrase"].lower(), "\" ","and I woke up from my dream."
	
	print " "   # prints an empty space 
	print "-----------------------------------------------------------" # line separator
	
	
def printDictTitle (madLibDict): # prints mad lib values with the first letters in uppercase
	
	print " Here is your mad lib (in capital letters)......."
	print " "            
	print "Last night I dreamed that I was a", madLibDict["adj1"].title(), madLibDict["noun1"].title(), 
	print "with", madLibDict["number1"].title(), madLibDict["bodyPart"].title(),". I then", 
	print madLibDict["verb"].title(),"to", madLibDict["place"].title(), "with my friend" 
	print madLibDict["Name"].title(),", and ate", madLibDict["number2"].title(), madLibDict["adjective2"].title(), 		 	 
	print madLibDict["pluralNoun2"].title(),"." " After we finished eating", madLibDict["Name"].title(), 			
	print "yelled", "\"", madLibDict["phrase"].title(), "\" ","and I woke up from my dream."
	
	print " "   # prints an empty space 
	print "-----------------------------------------------------------" # line separator


def printDictReverse (madLibDict): # prints mad lib values with the all capital letters
	
	print " Here is your mad lib (in reverse)......."
	print " "            
	print "Last night I dreamed that I was a", madLibDict["adj1"][::-1], madLibDict["noun1"][::-1], 
	print "with", madLibDict["number1"][::-1], madLibDict["bodyPart"][::-1],". I then", 
	print madLibDict["verb"][::-1],"to", madLibDict["place"][::-1], "with my friend" 
	print madLibDict["Name"][::-1],", and ate", madLibDict["number2"][::-1], madLibDict["adjective2"][::-1], 		 	 
	print madLibDict["pluralNoun2"][::-1],"." " After we finished eating", madLibDict["Name"][::-1], 			
	print "yelled", "\"", madLibDict["phrase"][::-1], "\" ","and I woke up from my dream."
	
	print " "   # prints an empty space 
	
	


	

def main():  # The main function that calls other functions in the program
	welcomePrompt() # instructs the user on what to do 
	madLibDict = madlib() # sets the parameter value for the printDict function
	print " " # prints a space between the user input and mad lib functions
	
	
# Gives the user the option of printing the mad lib in uppercase, lowercase, capital   
# letters, or reverse order
	
	print "Would you like to print the mad lib in (upper)case, (lower)case, (capital) letters, or in (reverse) order?"
	print " "
	answer = raw_input("Please enter regular, upper, lower, capital, or reverse: ")
	print " "  
	
	
# Else if statement that decides what version of the mad lib will be printed"

	if answer == "regular" :
		printDict(madLibDict)
	elif answer == "upper" :
		printDictUpper(madLibDict)
	elif answer == "lower" :
		printDictLower(madLibDict)
	elif answer == "capital" :
		printDictTitle(madLibDict)
	elif answer == "reverse" :
		printDictReverse(madLibDict)
	
	
	
	
main() #runs the main functions

