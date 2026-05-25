class Restaurant:
        def __init__(self, rest_name, food_type):
                self.rest_name = rest_name
                self.food_type = food_type
                
        def describe_rest(self):
                print(f"{self.rest_name} serves {self.food_type}.")
        
        def rest_open(self):
                print(f"{self.rest_name} is open.")
        
r1 = Restaurant("Subway","Sandwhich")
r2 = Restaurant("Taco Bell","Tacos")
r3 = Restaurant("Burger King","Burgers")

r1.describe_rest()
r2.describe_rest()
r3.describe_rest()

r1.rest_open()
r2.rest_open()
r3.rest_open()