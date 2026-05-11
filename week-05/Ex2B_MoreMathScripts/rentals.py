# There are X people going on a tour. Charter vans seat 15 passengers each. Vans cost
# $250 per day to rent (including the driver’s pay). How many vans do you need? How
# much will it cost to rent vans? What is the cost if you split it per person?

van_cost = 250
seats_in_van = 15
customers = 38

vans_rented = (customers / seats_in_van)
total = vans_rented * van_cost
c_cost = (total / customers)

final_total = c_cost * customers

print("Cost plans for tour:")
print(f"customers: {customers}")
print(f"vans needed: ${vans_rented:.2f}")
print(f"total van cost: ${total:.2f}")
print(f"cost per person: ${c_cost:.2f}")
print(f"collected final total: ${final_total:.2f}")