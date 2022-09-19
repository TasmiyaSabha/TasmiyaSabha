rev_no = 0
num=int(input("Enter the number="))

while(num > 0):
    n = num % 10
    rev_no = rev_no * 10 + n
    num = num // 10
 
print(rev_no)
