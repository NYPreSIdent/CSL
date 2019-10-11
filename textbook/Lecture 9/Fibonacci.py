def fib(n):
    if n < 2:
        return 0
    return fib(n - 1) + fib(n - 2)
