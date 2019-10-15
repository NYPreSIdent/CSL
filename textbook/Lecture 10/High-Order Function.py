from operator import add

def keep_if(fn,x):
    return [n for n in x if fn(x) == True]

def divisors_of(x):
    divisors = lambda x: n % x == 0
    return [1] + keep_if(divisors,range(2, x))

def reduce(reduce_fn, s, initial):
    reduced = initial
    for x in s:
        reduced = reduce_fn(reduced,x)
    return reduced

def sum_of_divisors(n):
    return reduce(add, divisors_of, 0)

def perfect(n):
    return sum_of_divisors(n) == n

keep_if(perfect,range(1, 1000))
