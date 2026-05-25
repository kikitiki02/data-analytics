class Restaurant:
        def __init__(self, rest_name, food_type):
                self.rest_name = rest_name
                self.food_type = food_type
                
        def describe_rest(self):
                print(f"{self.rest_name} serves {self.food_type}.")
        
        def rest_open(self):
                print(f"{self.rest_name} is open.")

        def add_num_served(self):
                customers = int(input("How many customers served today?"))
                self.number_served +- customers

        def print_num_served(self):
                print(f"{self.rest_name} has served {self.number_served} customers.")
        
        def customer_raiting(self):
                raiting = int(input("How would you rate your experience today on a scale of 1-5 (5 being excellent)?"))
                self.customer_ratings.append(raiting)
                average = sum(self.customer_raitings) / len(self.customer.raitings)
                print(f"Your rating was {raiting}. The average rating for this restaurant is {average}")

    
        
r1 = Restaurant("Subway","Sandwhich")
r2 = Restaurant("Taco Bell","Tacos")
r3 = Restaurant("Burger King","Burgers")

r1.describe_rest()
r1.rest_open()
r1.add_num_served()
r1.print_num_served()
r1.customer_raiting()

r2.describe_rest()
r2.rest_open()
r2.add_num_served()
r2.print_num_served()
r2.customer_raiting()

r3.describe_rest()
r3.rest_open()
r3.add_num_served()
r3.print_num_served()
r3.customer_raiting()