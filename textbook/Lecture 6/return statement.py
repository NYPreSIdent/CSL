'''return statement'''
def search(f):
    '''to search the nember which comfort the condition'''
    x = 0
    while True:
        if f(x):
              return x
    x = x +1

def square(x):
            return x * x
def is_three(x):
            return x == 3

def positive(x):
            return max(0, square(x) - 100)

print(search(is_three))

def inverse(f):
            return lambda y: search(lambda x: f(x) == y)

sqrt = inverse(suqare)

print(sqrt(16))         
