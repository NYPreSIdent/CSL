def split(n):
            return n // 10, n % 10

def sum_digits(n):
            if n < 10:
                        return n
            all_but_last, last = split(n)
            return sum_digits(all_but_last) + last

''''
personal version
'''
def luhn(x):
            if x < 10:
                        return x
            all_but_last, last = split(x)
            return luhn_double(all_but_last) + last

def luhn_double(x):
            if x < 10:
                        return x * 2 
            all_but_last, last = x // 10, (x % 10) * 2
            if last > 10:
                        last = last // 10 + last % 10
            return luhn(all_but_last) + last

'''
a better version:
'''
def luhn_b(x):
            if x < 10:
                        return x
            all_but_last, last = split(x)
            return luhn_double(all_but_last) + last

def luhn_double_b(x):
            all_but_last, last = split(x)
            last = digits(last * 2)
            if x < 10:
                        return last
            else:
                         return luhn_b(all_but_last) + last


           
