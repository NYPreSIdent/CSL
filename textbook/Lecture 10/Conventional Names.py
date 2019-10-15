from functools import reduce
from operator import mul
apply_to_all = lambda map_fn, s: list(map(map_fn,s))
keep_if = lambda filter_fn, s: list(filter(filter_fn,s))
def mul_all_elements(x):
    return reduce(mul,x)

mul_all_elements([1,2,3,4,5,6])
