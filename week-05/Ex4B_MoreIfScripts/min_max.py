a = 30
b = 70
c = 20

# small coding
if a <= b and a <= c:
    smallest = a
elif b <= a and b <= c:
    smallest = b
else:
    smallest = c

#large coding
if a >= b and a >= c:
    largest = a
elif b >= a and b >= c:
    largest = b
else:
    largest = c

print(f"smallest number is {smallest}")
print(f"largest number is {largest}")