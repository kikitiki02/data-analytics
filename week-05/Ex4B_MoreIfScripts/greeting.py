# Create a script named greeting.py. Define a variable that contains the current hour (0-
# 23). Display one of the greetings below based on the current hour:

#Time Greeting
#until 10:00am Good morning!
#10:00am until 5:00pm Good day!
#5:00pm or later Good evening!

hour = 11

if hour < 10:
    print("Good morning")
elif hour < 17:
    print("Good day")
else:
    print("Good evening")
