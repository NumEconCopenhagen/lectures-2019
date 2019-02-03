def myfunction(x):
    return x**2

if __name__ == "__main__":
    for i in range(10):
        print(f'hello world: myfunction({i}) = {myfunction(i)}')