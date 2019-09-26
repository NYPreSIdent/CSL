def improve(update,close,argue = 1):
    '''a function which can interate themselves'''
    while not close(argue):
        argue = update(argue)
    return argue

def approx_aq(x,defalut,tolerance=1e-13):
    ''' a function which can verify the distance.'''
    return abs(x - defalut) < tolerance

def pow(x,n):
    k, total = 1, x
    while k < n:
        total = x * total
        k += 1
    return total

def find_zero(f,df):
    def update(x):
            return x - f(x) / df(x)
    def near_zero(x):
            return approx_aq(f(x),0)
    return improve(update,near_zero)

def nth_root_of_a(n,a):
    '''a function which can return the nth root of a'''
    def f(x):
        return pow(x,n) - a
    def df(x):
        return n * pow(x,n-1)
    return float(find_zero(f,df))

print(nth_root_of_a(10,1024))


