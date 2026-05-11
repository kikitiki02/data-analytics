# 1 Marketing
# 5 Human Resources
# 10 Accounting
# 12 Legal
# 18 IT
# 20 Customer Relations

def dep(code):
    match code:
        case 1:
            return "Marketing"
        case 5:
            return "Human Resources"
        case 10:
            return "Accounting"
        case 12:
            return "Legal"
        case 18:
            return "IT"
        case 20:
            return "Customer Relations"
    
    codes = [1, 5, 10, 12, 18, 20]
    for code in codes:
        print(f"code{code}: {dep(code)}")