# You are going to tile a room whose dimensions are length by width feet. There are
# twelve tiles per box, each 1 foot by 1 foot. How many boxes of tiles do you need? You
# can only buy full boxes, not a partial box.
# You also want to buy at least 10% more tiles than you need in order to handle chips,
# breakage, and mess-ups. How many total boxes will you buy?

l = float(input("Enter length - feet:"))
w = float(input("Enter width - feet:"))

area = l * w 

# extra 10% tile
tiles = area * 1.10

boxes = (tiles / 12)

print(f"You should buy {boxes:.2f} boxes of tiles")
