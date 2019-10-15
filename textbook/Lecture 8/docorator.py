def trace1(fn):
    def traced(x):
        print("Calling", fn, "into", x)
        return fn(x)
    return traced

@trace1
def square(x):
    return x * x 

def merge(n1,n2):
    if n1 == 0:
        return n2
    elif n2 == 0:
        return n1
    elif n1 == 0 and n2 == 0:
        return None
    elif n1 % 10 < n2 % 10:
        n1 = n1 // 10
        return merge(n1,n2)
    elif n2 % 10 < n1 % 10:
        n2 //= 10
        return merge(n1,n2)
    else:
        n1, n2 = n1 // 10, n2 // 10
        return merge(n1,n2)
