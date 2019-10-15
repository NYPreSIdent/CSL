def merge(n1, n2):
    if n1 == 0:
        return n2
    if n2 == 0:
        return n1
    elif n1 % 10 < n2 % 10:
        return merge(n1, n2) * 10 + n1 % 10
    elif n1 % 10 > n2 % 10:
        return merge(n1, n2) * 10 + n2 % 10
