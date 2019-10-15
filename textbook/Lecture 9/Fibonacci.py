def fib(n):
    if n < 2:
        return 0
    return fib(n - 1) + fib(n - 2)

'''Print in Recurseve Function'''
def cascade(n):
    if n < 10:
        print(n)
    else:
        print(n)
        csacade(n // 10)
        print(n)
