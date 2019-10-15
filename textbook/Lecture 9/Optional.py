def make_func_repeater(f,x):
    def repeat(n):
        if n == 1:
            return f(x)
        else:
            return f(repeat(n - 1))
    return repeat
