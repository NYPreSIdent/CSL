'''some examples which introduce currying'''

def curry_pow(x):
            def h(y):
                        return pow(x,y)
            return h

print(curry_pow(2)(3))

def curry2(f):
            '''use curry to describe pow'''
            def g(x):
                        def h(y):
                                    return f(x,y)
                        return h
            return g

print(curry2(pow)(2)(5))

def map_to_range(start,end,f):
            while start < end:
                        return f(start)
            start += 1

