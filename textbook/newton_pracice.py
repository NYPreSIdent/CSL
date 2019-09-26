def improve(update,close,argue):
    '''a function which can interate themselves'''
    while not close(argue):
        argue = update(argue)
    return argue

def approx_aq(x,defalut,tolerance=1e-15):
    ''' a function which can verify the distance.'''
    return abs(x) - defalut < tolerance

def pow(x,n):
    k, total = 1, x
    while k < n:
        total = x * total
        k += 1
    return total

def newton_find(f,df):
    x = x + f(x) / df(x)
    return x

def find_zero(f,df):
    def update(x):
        return newton_find(f,df)
    def near_zero(x):
        return approx_aq(x,0)
    return improve(update,near_zero,x)

def nth_root_of_a(n,a):
    '''a function which can return the nth root of a'''
    def f(x):
        return pow(x,n) - a
    def df(x):
        return n * pow(x,n-1)
    return find_zero(f,df)
