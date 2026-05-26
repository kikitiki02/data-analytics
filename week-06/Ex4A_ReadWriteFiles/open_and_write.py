f = open("about_me.txt", "a")
f.write(f" a) If you could do anything for your perfect night out, where would you go and what would you do?")
f.close()

f = open("about_me.txt","r")
# print(f.read(50)) # the () in read adds more characters it readsbased on the number put
f.close()

f = open("about_me.txt","r")
# print(f.readline(10))
# print(f.readline())

# for i in range(1,5):
    # print(f.readline())

