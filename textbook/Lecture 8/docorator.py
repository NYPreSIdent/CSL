def trace1(fn):
    def traced(x):
        print("Calling", fn, "into", x)
        return fn(x)
    return traced

@trace1
def square(x):
    return x * x 
