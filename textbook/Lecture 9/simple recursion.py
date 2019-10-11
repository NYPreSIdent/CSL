def fact(n):
            if n == 1:
                        return 1
            return n*fact(n-1)

def sum(n):
            if n < 10:
                        return n
            all_but_last_digits, last_digits = n // 10, n % 10
            return last_digits + sum(all_but_last_digits)

'''
This is mutual recursion:
'''
def is_even(n):
            if n == 0:
                        return True
            else:
                        return is_odd(n - 1)
def is_odd(n):
            if n == 0:
                        return False
            else:
                        return is_even(n - 1)

'''
This is a better version:
'''
def is_even_better(n):
            if n == 0:
                        return True
            if n - 1 == 0:
                        return False
            else:
                        return is_even((n - 1) - 1)
            
