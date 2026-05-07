# Define known values
food_cost = 79.25
tax = 6.54
tip = 12.00
# Calculate the unknown
total_due = food_cost + tax + tip
# Display the results
#print("The total due is " + str(total_due))

#a) Remember what the str() function is for? Why is this being used here? Add your answer as a comment.
# A str() function is like a way to put numbers with texts

print("Food cost is " + str(food_cost) + " and tax is " + str(tax))
# print("Tip is " + str(tip))
print("Total due is " + str(total_due))
print("Tip is " + format(tip, ".2f"))