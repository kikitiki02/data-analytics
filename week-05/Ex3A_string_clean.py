name_1 = "PRIYA SHARMA"
name_2 = "bob NGUYEN"
name_3 = "LaTonya Williams"
salary_1 = "$82,500"
salary_2 = "$74,000"

# Lower Case
print(name_1.lower())
print(name_2.lower())
print(name_3.lower())

# Titles
print(name_1.title())
print(name_2.title())
print(name_3.title())

# clean sals
new_sal_1 = int(salary_1.replace("$", "").replace(",", ""))
new_sal_2 = salary_2.replace("$", "")

print(new_sal_1)
print(type(salary_1))


print(new_sal_2)

