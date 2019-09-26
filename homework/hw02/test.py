def accumulate(combiner, base, n, term):
    k = n
    while base <= k:
        n = combiner(n,term(k))
        k += 1
    return n
