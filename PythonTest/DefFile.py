
def printStr(inputStr):
    print(inputStr)

def printList(inputList):
    print(inputList)

def dataPlus(num1, num2):
    print(num1 + num2)
    return num1 + num2

def dataLess(num1, num2):
    print(num1 - num2)
    return num1 - num2

def dataMultiply(num1, num2):
    print(num1 * num2)
    return num1 * num2

def dataExcept(num1, num2):
    print(num1 / num2)
    return num1 / num2

# __name__属性
if __name__ == '__main__':
    print("if __main__")
else:
    print("not __main__")

if __name__ != '__main__':
    print('if not __main__')
else:
    print('is __main__')