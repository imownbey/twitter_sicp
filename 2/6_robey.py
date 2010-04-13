#!/usr/bin/env python

zero = lambda f: lambda x: x

def add1(n):
    return lambda f: lambda x: f(n(f)(x))

one = lambda f: lambda x: f(x)
two = lambda f: lambda x: f(f(x))

def add(a, b):
    return lambda f: lambda x: a(f)(b(f)(x))

# for testing:
def numberize(n):
    return n(lambda x: x + 1)(0)
