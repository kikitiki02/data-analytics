# Value error 
try:
  x = float("hello")
except ValueError:
  print("The value has wrong format")
except:
  print("Something else went wrong")
else:
  print(x)
finally:
  print("Lets try something else?")

# Name error
try:
  print(x)
except NameError:
  print("Variable x is not defined")
except:
  print("Something else went wrong")
else:
  print(x)
finally:
  print("Put something else lol")

#Type Error
try:
  x = "hello" + 15
except TypeError:
  print("Please convert to string before concatenate")
except:
  print("Something else went wrong")
else:
  print(x)
finally:
  print("Try again")


