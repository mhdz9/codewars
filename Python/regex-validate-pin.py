#ATM machines allow 4 or 6 digit PIN codes and PIN codes cannot contain anything but exactly 4 digits or exactly 6 digits.
#If the function is passed a valid PIN string, return true, else return false.
#Examples:
#    "1234"   -->  true
#    "12345"  -->  false
#    "a234"   -->  false

def validate_pin(pin):
    regex = "0123456789"
    temp = 0

    for i in pin:
        if i in regex:
            temp = 1
        else:
            temp = 0
            break
    if (len(pin) == 4 or len(pin) == 6) and temp == 1:
        return True
    else:
        return False