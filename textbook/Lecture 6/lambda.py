def end(n ,d):
    '''print the final digits of N in reverse order until D is found
    >>>end(34567,5)
    7
    6
    5
    '''
    while n > 0:
        last,  n = n%10, n//10
        print(last)
        if last == d:
            return None
    
print(end(34567,5))

def search(f):
    '''brute force'''
    x = 0
    while True:
        if f(x):
            return x
    x += 1

def inverse(f):
    '''return g(y) such that g(f(x))--->x.'''
    return lambda y: search(lambda x: f(x) == y)

def positive(x):
    return max(0,square(x) - 100)

def square(x):
    return x * x

print(search(positive))
