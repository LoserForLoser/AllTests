
'''
# 字符串
var1 = "Hello,world!"
var2 = "Get of to Me!"

print("a + b 输出结果：", var1 + var2)
print("a * 2 输出结果：", var1 * 2)
print("a[1] 输出结果：", var1[1])
print("a[1:4] 输出结果：", var1[1:4])

if ("H" in var1):
    print("H 在变量 a 中")
else:
    print("H 不在变量 a 中")

if ("M" not in var1):
    print("M 不在变量 a 中")
else:
    print("M 在变量 a 中")

print(r"print r'\n':", r'\n')
print(R"print R'\n':", R'\n')

# %c 格式化字符及其ASCII码
# %s 格式化字符串
# %d 格式化整数
# %u 格式化无符号整型
# %o 格式化无符号八进制数
# %x 格式化无符号十六进制数
# %X 格式化无符号十六进制数（大写）
# %f 格式化浮点数字，可指定小数点后的精度
# %e 用科学计数法格式化浮点数
# %E 作用同 %e，用科学计数法格式化浮点数
# %g %f 和 %e的简写
# %G %f 和 %E的简写
# %p 用十六进制数格式化变量的地址
printStr = "我叫%s，年龄%d，存款%f"
print(printStr%('爱谁谁', 24, 23.333333))

# *	定义宽度或者小数点精度
# -	用做左对齐
# +	在正数前面显示加号( + )
# <sp>	在正数前面显示空格
# #	在八进制数前面显示零('0')，在十六进制前面显示'0x'或者'0X'(取决于用的是'x'还是'X')
# 0	显示的数字前面填充'0'而不是默认的空格
# %	'%%'输出一个单一的'%'
# (var)	映射变量(字典参数)
# m.n.	m 是显示的最小总宽度,n 是小数点后的位数(如果可用的话)

print("\n将字符串的第一个字符转换为大写")
string1 = 'auhgkagalksdnjghnrwiuthn'
print("string1:", string1, "\ncapitalize string1:", string1.capitalize())

print("\n返回一个指定的宽度 width 居中的字符串，fillchar 为填充的字符，默认为空格")
string2 = 'akjdhf'
print("center string1:", string1.center(20, '填'), "center string2:", string2.center(20, '填'))

print("\n返回 str 在 string 里面出现的次数，如果 beg 或者 end 指定则返回指定范围内 str 出现的次数")
print("string1 count('a'):", string1.count('a'))
print("string1 count('a', 0, 10):", string1.count('a', 0, 10))
print("string1 count('a', 5, 20):", string1.count('a', 5, 20))

print("\n以 encoding 指定的编码格式编码字符串，如果出错默认报一个ValueError 的异常，除非 errors 指定的是'ignore'或者'replace'")
print("decode() 方法以指定的编码格式解码 bytes 对象。默认编码为 'utf-8'")
# encoding - - 要使用的编码，如"UTF-8"。
# errors - - 设置不同错误的处理方案。默认为'strict', 意为编码错误引起一个UnicodeError。 其他可能得值有'ignore', 'replace', 'xmlcharrefreplace', 'backslashreplace'以及通过codecs.register_error()注册的任何值。
stringEncoding = "只要是中文就行，例如现在的这句话，这里就只事例 UTF-8 其他同理"
print("stringEncoding:", stringEncoding)
stringUTF8 = stringEncoding.encode("UTF-8", 'strict')
print("UTF-8 编码:", stringUTF8)
stringUnUTF8 = stringUTF8.decode("UTF-8", 'strict')
print("UTF-8 解码:", stringUnUTF8)

print("\n检查字符串是否以 obj 结束，如果beg 或者 end 指定则检查指定的范围内是否以 obj 结束，如果是，返回 True,否则返回 False.")
print("string endswith('f'):", string2.endswith('f'))
print("string endswith('f', 5, 15)", string1.endswith('f', 5, 15))
print("string endswith('n', len(string1)-1)", string1.endswith('n', len(string1)-1))

print("\n把字符串 string 中的 tab 符号转为空格，tab 符号默认的空格数是 8")
strStr = "this is\tstring example....wow!!!"
print ("原始字符串: ", strStr)
print("替换\\t符号:", strStr.expandtabs())
print("使用16个空格替换 \t 符号:", strStr.expandtabs(16))

print("\n检测 str 是否包含在字符串中，如果指定范围 beg 和 end ，则检查是否包含在指定范围内，如果包含返回开始的索引值，否则返回-1")
print("\nrfind() :类似于 find()函数，不过是从右边开始查找")
print("find 'a' in string:", string1.find('a'))
print("find 'a' in string[5:15]:", string1.find('a', 5, 15))
print("find 'a' in string[10:]:", string1.find('a', 10))

print("\nindex() :跟find()方法一样，只不过如果str不在字符串中会报一个异常")
print("\nrindex() :类似于 index()，不过是从右边开始")
print("事例同上")

print("\nisalnum() :如果 string 至少有一个字符并且所有字符都是字母或数字则返回 True,否则返回 False")
stringNumOrABC = "ad7gf6a98gf6ayda"
stringNotOnlyNumOrABC = "Q$^NT#$%YBWTW%$YWYW409erjt3"
print("stringNumOrABC.isalnum:", stringNumOrABC.isalnum())
print("stringNotOnlyNumOrABC.isalnum:", stringNotOnlyNumOrABC.isalnum())

print("\nisalpha() :如果字符串至少有一个字符并且所有字符都是字母则返回 True, 否则返回 False")
print("事例同上")

print("\nisdigit() :如果字符串只包含数字则返回 True 否则返回 False")
print("事例同上")

print("\nisnumeric() :如果字符串中只包含数字字符，则返回 True，否则返回 False")
print("事例同上")

print("\nisspace() :如果字符串中只包含空白，则返回 True，否则返回 False")
print("事例同上")

print("\ntitle() :返回 \"标题化\" 的字符串, 就是说所有单词都是以大写开始，其余字母均为小写(见 istitle())")
stringTitle = stringNumOrABC.title()
print("stringTitle.title():", stringTitle)
stringSymbol = '@$%^agagah'
print("stringSymbol.title():", stringSymbol.title())

print("\nistitle() :如果字符串是标题化的(见 title())则返回 True，否则返回 False")
print("stringNumOrABC.istitle():", stringNumOrABC.istitle())
print("stringTitle.istitle():", stringTitle.istitle())

print("\njoin(seq) :以指定字符串作为分隔符，将 列表/元祖 中所有的元素(的字符串表示)合并为一个新的字符串")
seq = ('s', 'e', 'q')
tup = ['t', 'u', 'p']
print("\'+\' join seq:", '+'.join(seq))
print("\'+\' join tup:", '+'.join(tup))

print("\nlen(string) :返回字符串长度\nstring.len:", len(string1))

print("\n返回一个原字符串左对齐,并使用 fillchar 填充至长度 width 的新字符串，fillchar 默认为空格")
print("string2.ljust(20, '填'):", string2.ljust(20, '填'))

print("\n返回一个原字符串右对齐,并使用fillchar(默认空格）填充至长度 width 的新字符串")
print("string2.rjust(20, '填'):", string2.rjust(20, '填'))

print("\nlower() :转换字符串中所有大写字符为小写")
stringABC = "aGERDAegargeDRAG"
print("stringABC:", stringABC, "\nstringABC.lower:", stringABC.lower())

print("\nlstrip() :截掉字符串左边的空格或指定字符")
print("'填填填jdfhg填填iuwdh填填填' lstrip:", '填填填jdfhg填填iuwdh填填填'.lstrip('填'))
print("\nrstrip() :截掉字符串右边的空格或指定字符")
print("'填填填jdfhg填填iuwdh填填填' rstrip:", '填填填jdfhg填填iuwdh填填填'.rstrip('填'))
print("\nstrip() :全局截掉字符串空格或指定字符，不只左右")
print("'填填填jdfhg填填iuwdh填填填' strip :", '填填填jdfhgiuwdh填填填'.strip('填'))

print("\nmaketrans() :创建字符映射的转换表，对于接受两个参数的最简单的调用方式，第一个参数是字符串，表示需要转换的字符，第二个参数也是字符串表示转换的目标")
print("\ntranslate(table, deletechars="") :根据 str 给出的表(包含 256 个字符)转换 string 的字符, 要过滤掉的字符放到 deletechars 参数中")

# table -- 翻译表，翻译表是通过 maketrans() 方法转换而来。
# deletechars -- 字符串中要过滤的字符列表

intab = "aoeiuv"
outtab = "123456"
trantab = str.maketrans(intab, outtab)
print("intab :%s\nouttab :%s\ntrantab :%s"%(intab, outtab, trantab))
tranString = "aAbBcCdDeEfFgG"
print("tranString :%s"%tranString)
print("tranString.translate(trantab) :%s"%tranString.translate(trantab))

print("\nmax(str) :返回字符串 str 中最大的字母")

print("\nmin(str) :返回字符串 str 中最小的字母")

print("\n把 将字符串中的 str1 替换成 str2,如果 max 指定，则替换不超过 max 次")
print("string1 replace 'a' ' A ' :", string1.replace("a", " A "))
print("string1 replace 'g' ' G ' '2' :", string1.replace("g", " G ", 2))

print("\n大小写互相转换")
print("stringNotOnlyNumOrABC:", stringNotOnlyNumOrABC)
print("stringNotOnlyNumOrABC swapcse() :", stringNotOnlyNumOrABC.swapcase())

print("\n转换字符串中的小写字母为大写")
print("stringNotOnlyNumOrABC upper :", stringNotOnlyNumOrABC.upper())

print("\nisupper() :如果字符串中包含至少一个区分大小写的字符，并且所有这些(区分大小写的)字符都是大写，则返回 True，否则返回 False")
print("stringNotOnlyNumOrABC isupper :", stringNotOnlyNumOrABC.upper().isupper())

print("\n返回长度为 width 的字符串，原字符串右对齐，超出原字符串长度前面填充0，否则返回原字符串")
print("stringNotOnlyNumOrABC zfill(10) :", stringNotOnlyNumOrABC.zfill(10))
print("stringNotOnlyNumOrABC zfill(20) :", stringNotOnlyNumOrABC.zfill(20))
print("stringNotOnlyNumOrABC zfill(40) :", stringNotOnlyNumOrABC.zfill(40))

print("\n检查字符串是否只包含十进制字符，如果是返回 true，否则返回 false")
print("intab isdecimal :", intab.isdecimal())
print("outtab isdecimal :", outtab.isdecimal())
'''

'''
# 列表 （可变数组）

asdfasdf = ['d53sf4gh6']
List1 = ['asdfasdf', '1465464', asdfasdf, 68974646]
List2 = [1, 2, 3, 4, 5]
List3 = ["a", "b", "c", "d", "e"]
List = List1 + List2 + List3
print("List is:", List)
ListX = [List1, List2, List3]
print("ListX is:", ListX)
List[2:8]
print('List[2:8]:', List[2:8])
List[5]
List[10] = '这是一句话'
print(List)

# 列表元素个数
print(len(List))


for agfdsdsf in ListX :
    print("ListX come to:",ListX);

# 返回列表元素最大值
print("List MAX:", max(List2))
# 返回列表元素最小值
print("List MIN:", min(List3))
# 将元组转换为列表
tupleS = (1, 2, 3, 4, 5)
print("tuple to list:", list(tupleS))

# 统计某个元素在列表中出现的次数
print(list.count(List2, 2))
# 移除列表中的一个元素（默认最后一个元素），并且返回该元素的值
list.pop(List3) # 等价 List3.pop()
print(List3)
# 移除指定位置
list.pop(List3, 2) # 等价 List3.pop(2)
print(List3)
# 在列表末尾添加新的对象
list.append(List3, 'e')
print(List3)
# 将对象插入列表
list.insert(List3, 2, 'g')
print(List3)
# 对原列表进行排序
list.sort(List3)
print(List3)
# 在列表末尾一次性追加另一个序列中的多个值（用新列表扩展原来的列表）
Llist = [1, 2, 3, 4, 5]
Llist.extend(List3)
print(Llist)
# 从列表中找出某个值第一个匹配项的索引位置
print(List3.index('b'))
# 移除列表中某个值的第一个匹配项
print(List)
List.remove(asdfasdf)
print(List)
# 反向列表中元素
print(List)
list.reverse(List)
print(List)
# 复制列表
copyList = list()
copyList = List2.copy()
print("List2:", List2)
print("copyList:", copyList)
# 清空列表
copyList.clear()
print("Celar end copyList :", copyList)
'''

"""
# 元祖（不可变数组）
# 只有1个元素的tuple定义时必须加一个逗号','，来消除歧义
tup1 = (12, 34.56);
tup2 = ('abc', 'opq', 'xyz')
tup3 = tup1 + tup2;
print(tup3)

print("\n计算元组元素个数")
print("tup1.len:", len(tup1), "tup2.len:", len(tup2), "tup3.len:", len(tup3))

print("\n返回元组中元素最大值")
print("tup3 MAX:", max(tup2))

print("\n返回元组中元素最小值")
print("tup3 MIN:", min(tup2))

print("\n将列表转换为元组")
listS = ['a', 'b', 'c', 'd', 'e']
print("list to tuple:", tuple(listS))

### tuple元素不可变有一种特殊情况，当元素是可变对象时（如 列表list）。对象内部属性是可以修改的
### tuple本身内部不可变，但若内部元素为可变则可修改起元素内部
print("\n修改元祖内可变元素（list）的内容")
tupList = (1, 2, 3, listS, '1', '2', '3')
print("tupList BEFORE:", tupList)
tupList[3][0] = 1
tupList[3][1] = '2'
print("tupList AFTER:", tupList)
"""

'''
# 字典
List = (1, 2, 3, 4, 5)
dic1 = {'Name':'SongZhaoyang', 'Age':25, 'Like':'Make Love', 'Job':'Nothing', 'Power':List}
print("Dictionary is:",dic1)
# 增
dic1['Today'] = 20160625
print("Dictionary 增 is:",dic1)
# 改
dic1['Job'] = 123456
print("Dictionary 改 is:",dic1)
# 删
# del dic1['Name']# 删除键 'Name'
# print("Dictionary 删 is:",dic1)
# dict.clear(dic1)# 清空字典
# print("Dictionary 删 is:",dic1)
# del dic1# 删除字典
# 不允许同一个键出现两次。创建时如果同一个键被赋值两次，后一个值会被记住
# 键必须不可变，所以可以用数字，字符串或元组充当，而用列表就不行

# 计算字典元素个数，即键的总数
print("\n计算字典元素个数，即键的总数")
print("Dictionary 元素个数 is:",len(dic1))

# 输出字典，以可打印的字符串表示
print("\n输出字典，以可打印的字符串表示")
print("字符串 Dictionary is:",str(dic1))

# 返回输入的变量类型，如果变量是字典就返回字典类型
print("\n返回输入的变量类型，如果变量是字典就返回字典类型")
print("变量类型 Dictionary is:",type(dic1))

# 删除字典内所有元素
# print("\n删除字典内所有元素")
# dic1.clear()
# print("Dictionary is:",dic1)

# 返回一个字典的浅复制
print("\n返回一个字典的浅复制")
dic2 = dic1.copy()
print("Dictionary is:",dic2)

# 创建一个新字典，以序列seq中元素做字典的键，val为字典所有键对应的初始值
print("\n创建一个新字典，以序列seq中元素做字典的键，val为字典所有键对应的初始值")
listl = ('a', 'b', 'c')

dic3 = {}
dic3 = dic3.fromkeys(listl)
print("Dictionary is:",dic3)

dic3 = dic3.fromkeys(listl, '不写这个默认就是 None')
print("Dictionary is:",dic3)

# 返回指定键的值，如果值不在字典中返回default值
print("\n返回指定键的值，如果值不在字典中返回default值")
print(dic1.get("Name", "null"))
print(dic1.get("song", "null"))

# 和get()类似, 但如果键不存在于字典中，将会添加键并将值设为default
# print("\n和get()类似, 但如果键不存在于字典中，将会添加键并将值设为default(None)")
# print("dic3[\"Name\"]:", dic3.setdefault("Name"))
# print("dic3[\"Name\"]:", dic3.setdefault("Name", "写替换也没用，就是默认None"))
# print(dic3.setdefault("NickName"))
# print(dic3.setdefault("NickName", "没有写啥也没用，就是默认None"))

# 如果键在字典dict里返回true，否则返回false
print("\n如果键在字典dict里返回true，否则返回false")
print("Name" in dic1)
print("Name" in dic3)

# 以列表返回可遍历的(键, 值) 元组数组
print("\n以列表返回可遍历的(键, 值) 元组数组")
print("dic1:", dic1.items())
print("dict3", dic3.items())
listKeysValues = list(dic3.items())
print("listKeysValues:", listKeysValues)

# 遍历items：
print("\n遍历items：")
for i,j in dic1.items():
    print(i, "\t:\t", j)

# 以列表返回一个字典所有的键
print("\n以列表返回一个字典所有的键")
print("dic3 all keys:", dic3.keys())

# 以列表返回字典中的所有值
print("\n以列表返回一个字典所有的值")
print("dic3 all values:", dic3.values())

# 把字典dict2的键/值对更新到dict里
print("\n把字典dict2的键/值对更新到dict里 如果键同名则会替换")
print("dic2:", dic2)
print("dic3:", dic3)
dic3.update(dic2)
print("dic3:", dic3)

# 删除字典给定键 key 所对应的值，返回值为被删除的值。key值必须给出。 否则，返回default值。
print("\n删除字典给定键 key 所对应的值，返回值为被删除的值")
print("dic2.pop(\"Name\"):", dic2.pop("Name"))

# 随机返回并删除字典中的一对键和值(一般删除末尾对)
print("dic2:",dic2)
print("dic2.popitem():", dic2.popitem())
print("dic2:", dic2)
'''
