def trace1(fn):
    def traced(x):
        print("Calling", fn, "into", x)
        return fn(x)
    return traced
            


@trace1
def fib(n):
            if n == 0:
                        return 0
            if n == 1:
                        return 1
            return fib(n-1) + fib(n-2)

def fib1(n):
            predigit, recdigit = 0, 1
            k = 1
            while k < n:
                        recdigit, predigit = predigit + recdigit, recdigit
                        k += 1
            return recdigit
