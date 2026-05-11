# 1 Marketing
# 5 Human Resources
# 10 Accounting
# 12 Legal
# 18 IT
# 20 Customer Relations

def dep(code):
    if code == 1:
        return "Marketing"
    elif code == 5:
        return "Human Resources"
    elif code == 10:
        return "Accounting"
    elif code == 12:
        return "Legal"
    elif code == 18:
        return "IT"
    elif code == 20:
        return "Customer Relations"
    
    codes = [1, 5, 10, 12, 18, 20]
    for code in codes:
        print(f"code{code}: {dep(code)}")