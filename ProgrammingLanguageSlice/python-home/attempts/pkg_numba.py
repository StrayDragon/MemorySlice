from numba import jit

@jit
def integrate_f(a, b, N):
    s = 0
    dx = (b-a) /N
    for i in range(N):
        s += 2.71828182846**(-(a+i*dx)**2)
    return s*dx

if __name__ == "__main__":
    print(integrate_f(1.0,10.0, 100000000))
