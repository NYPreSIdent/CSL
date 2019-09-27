'''note in lecture 6   ---Why we don't use if function?
The oprend will be excuted before the body is excuting.
Here are some examples
'''
def if_(c, t, f):
            if c:
                        return t
            else:
                        return f

from math import sqrt

def real_sqrt(x):
            return if_(x>0,sqrt(x),0.0)

#print(real_sqrt(-4))#cause domain error

print(print(2),print(3))

'''short_circling'''
'''if statement as expression'''
x = 1
n = 3
print(1 / n if x != 0 else 0)# <consequence> if <predictible> else <alternative>
