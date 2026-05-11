# Description: This script tests various numeric
# conversion techniques
# Author: Kiki Marsh

a = " 101.1 "
b = '55'
c = "402 Stevens"
d = 'Number 5 '

# varaible a 
# - a_int = int(a) # invalid literal for int() with base 10
a_float = float(a)
a_float_int = int(float(a))

# varaible b
b_int = int(b)
b_float = float(b)
b_float_int = int(float(b))

# variable c - contains text will fail
# c_int = int(c) "invalid literal for int() - the letters "
# c_float = float(c) "could not convert strong to float"


# variable d - will all fail cause contains text
# d_int = int(d) "invalid literal for int()"
# d_float = float(d) "could not convert strong to float"

# prints

# a 
print(a, type(a))
print(a_float, type(a_float))
print(a_float_int, type(a_float_int))
print(a.strip())

# b
print(b, type(b))
print(b_float, type(b_float))
print(b_float_int, type(b_float_int))

# c 
c_slice = int(c[0:3])
print(c_slice, type(c_slice))

# d
d_slice = int(d[7:8])
print(d_slice, type(d_slice))
print(d.strip())