# w + 3f(w-25923) = 1773860215618

def fib(n):
    n -= 1
    if n == 0:
        return 1
    if n == 1:
        return 1
    array = []
    array.append(1)
    array.append(1)
    for _ in range(1, n):
        array.append(array[-1]+array[-2])
        # print(array)
    return array[-1]


w = 25923
while True:
    print(w)
    if w+3*fib(w-25923) == 1773860215618:
        print("found!")
        x = fib(w-25923)-151381742876
        y = 151381742876-117138004530+x
        z = 151381742876-155894355749+x
        print("x: "+str(x))
        print("y: "+str(y))
        print("z: "+str(z))
        print("w: "+str(w))
        break
    w += 1
