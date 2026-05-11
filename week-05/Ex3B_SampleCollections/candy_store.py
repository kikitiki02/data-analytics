# 3 fruity candies : Jolly ranchers, Starbusrts, Skittles
# 3 fruit flavors : Blue raspberry, Strawberry, Orange

candy = ("Jolly Ranchers","Starbursts","Skittles")
flavor = ("Blue Raspberry","Strawberry","orange")

candy_mix = set()

candy_mix.add(candy[0] + " - " + flavor[2]) 
candy_mix.add(candy[1] + " - " + flavor[0]) 
candy_mix.add(candy[2] + " - " + flavor[1])

print("Today’s candy options include:")
print(candy_mix)
