import random
products = ['Laptop', 'Monitor', 'Keyboard', 'Mouse', 'Webcam',
'Headset', 'Docking Station', 'USB Hub', 'Desk Lamp', 'Surge Protector']
# Product of the day
product_of_day = random.choice(products)
print("Product of the day:", product_of_day)

# Survey question
survey = random.sample(products, 3)
print("3 survey products:",survey)

# Presentation
shuffle = random.shuffle(products)
print("shuffled products:", products)

# transactions
transactions = random.randint(50, 300)
print("Daily Transactions:", transactions)