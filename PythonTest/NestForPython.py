
import sys

listA = [1, 2, 3, 4, 5]
it = iter(listA)
print("listA :%s" % listA)

# 迭代器
# print("it next :", next(it))
# print("it next :", next(it))
# print("it next :", next(it))
# print("it next :", next(it))
# print("it next :", next(it))

# 方法1：
# for x in it:
#     print("\nx :%s"%(x), end="")

# 方法2：
# while True:
#     try:
#         print("next :", next(it))
#     except StopIteration:
#         sys.exit()

# 生成器函数 - 斐波那契
# def fibnacci(n):
#     a, b, counter = 0, 1, 0
#     while True:
#         if (counter > n):
#             return
#         yield a
#         a, b = b, a + b
#         counter += 1
#
# f = fibnacci(10)
#
# while True:
#     try:
#         print(next(f), end= ' ')
#     except StopIteration:
#         sys.exit()

# answerNum = 7
# guessNum = -1
# while guessNum != answerNum:
#     guessNum = int(input("guess number:"))
#
#     if guessNum == answerNum:
#         print("Right!")
#     elif guessNum > answerNum:
#         print("Too Big!")
#     elif guessNum < answerNum:
#         print("Too Small!")

# 判断 0 - 100 范围内质数合数及能整除合数的数
# number = 0
# while number < 100:
#
#     if number < 2:
#         print("%d不行" % (number,))
#     elif number == 2 | number == 3:
#         print("%d质数" % (number, ))
#     else:
#         xNum = 2
#         while xNum <= (number / 2):
#             if number % xNum == 0:
#                 yNum = 1
#                 yNumList = []
#                 while yNum <= number:
#                     if number % yNum == 0:
#                         yNumList.append(yNum)
#                     yNum += 1
#                 print("%s能整除的数%s" % (str.ljust("%d合数，"%(number,), 6, " "), yNumList))
#                 break
#             xNum += 1
#         else:
#             print("%d质数" % (number, ))
#     number += 1

# range() 函数
# for numX in range(9):
#     print("numX:", numX)
#
# for numI in range(5, 8):
#     print("numI:", numI)
#
# for num in range(10, 100, 13):
#     print("num:", num)
#
# for numY in range(len(listA)):
#     print("ListA[%d]:%s" % (numY, listA[numY]))

# testString = "Google VS Baidu ?"
# print("START")
# for xStr in testString:
#     print(xStr)
# else:
#     print("???")
# print("END")
# print("list(testString):", list(testString))
# print("testString.splist(\" \")", testString.split(" "))

# listABC = list(testString)
# for i in range(len(listABC)):
#     print("listABC:", i, listABC[i])

# listWord = testString.split(' ')
# for s in range(len(listWord)):
#     print("listWord:", s, listWord[s])

# 写作下面亦可
# for i, j in enumerate(listWord):
#     print(i, j)

# 计算总和
# print(sum(range(10, 101, 10)))

# continue 结束当前循环进入下了一轮循环
# numX = 2
# print("strat")
# while numX < 10:
#     if numX % 2 == 0:
#         numX += 1
#         continue
#     print(numX)
#     numX += 1
# print("end")

# pass 语句
# if i in "dsfjhadf":
#     # 空语句防止报错
#     pass
# else:
#     print("反正就是随便写点啥")

"""
# 迭代器生成器
"""

# it = iter(listA)
# print("Way 1:")
# for x in it:
#     print(x, end=", ")
#
# print("Way 2:")
# it = iter(listA)
# while True:
#     try:
#         print(next(it))
#     except StopIteration:
#         sys.exit()

# 生成器斐波那契数列
# def fibonacci (num):
#     a, b ,counter = 0, 1, 0
#     while True:
#         if counter > num:
#             return
#         yield a
#         a, b = b, b + a
#         counter += 1
#
# listFibonacci = fibonacci(10)
#
# while True:
#     try:
#         print(next(listFibonacci))
#     except StopIteration:
#         sys.exit()

# String (immutable)
# def processString (processStr):
#     return str.ljust(processStr, 10, "N")
#
# testString = "agdadh"
# print(processString(testString))
# print(testString)

# List (mutable)
# def processList (processList):
#     processList.append([1, 2, 3])
#     return processList
#
# testList = [10, 20, 30]
# print("before:", testList)
# print(processList(testList))
# print("after:", testList)
