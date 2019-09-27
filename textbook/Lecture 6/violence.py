def search(f):
    '''violence'''
    x = 0
    while True:
        if f(x):
            return x
        x += 1

def sqaure(x):
    return x * x

def positive(x):
    return max(0,sqaure(x) - 100)

def inverse(f):
    '''find parameter such as that f(g(x))-->x.'''
    return lambda y:search(lambda x:f(x) == y)




print(inverse(sqaure)(4))

print(search(positive))
