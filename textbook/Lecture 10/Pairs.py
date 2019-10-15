pair = [10,20]
x, y = pair
from operator import getitem
def add_rational(x, y):
    nx, dx = numer(x), denom(x)
    ny, dy = numer(y), denom(y)
    return rational(nx * dy + ny * dx, dx * dy)

def mul_rationals(x,y):
    return rational(numer(x) * numer(y), denom(x) * denom(y))

def print_rational(x):
    print(numer(x),'/',denom(x))

def rationals_are_equal(x, y):
    return numer(x) * denom(y) == numer(y) * denom(x)

def rational(x,y):
    return [x,y]

def numer(n):
    return n[0]

def denom(n):
    return n[1]

half = rational(1,2)
print_rational(half)

def pairs(x,y):
    '''This is a function which can instead of a list'''
    def select(index):
        if index == 0:
            return x
        if index == 1:
            return y
    return select

a = pairs(2,7)
print(a(0))
print(a(1))
