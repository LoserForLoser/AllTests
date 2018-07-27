//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//let num1 = 111
//print(num1)
//
//var num2 = 222
//print(num2)
//
//num2 = 222111
//print(num2)

//var BoolTOrF = false
//
//for x in 0...10 {
//
//    if x >= 2 && x % 2 == 0 {
//        BoolTOrF = true
//        print(x,"是偶数",BoolTOrF)
//    } else {
//        BoolTOrF = false
//        print(x,"是奇数",BoolTOrF)
//    }
//
//    print(x)
//}

/*
 *类型别名
 *类型别名对当前的类型定义了另一个名字，类型别名通过使用 typealias 关键字来定义。
 */

//var asdw: Int = 123
//print(asdw)
//var wdsa = 123
//print(wdsa)
//
//typealias forBoolInt = Int
//var distance1: forBoolInt = 1
//print(distance1)
//distance1 = 0
//print(distance1)
//
//typealias Feet = Int
//var distance: Feet = 100
//print(distance)

//var aboutBool:Bool?
//print(aboutBool)
//aboutBool = true
//print(aboutBool!)

/*
 * 循环
 */

//var arr1: NSMutableArray = [1,2,3,4,5,6]
//print(arr1)
//for x in arr1 {
//    print(x)
//    print("\(x)\n")
//}

//switch <#value#> {
//case <#pattern#>:
//    <#code#>
//default:
//    <#code#>
//}

/*
 * 字符串
 */

//var str1 = "你好，世界"
//print(str1.count, "\(str1.count)")
//
//if str1.isEmpty {
//    print("str1 is nil")
//} else {
//    print("str1 isn't nil")
//}
//
//for x8code in str1.utf8 {
//    print(x8code)
//}
//
//print("\n")
//
//for x16code in str1.utf16 {
//    print(x16code)
//}
//
//print("\n")
//
//if str.hasSuffix("World") {
//    print("YES")
//} else {
//    print("NO")
//}
//
//if str.hasSuffix("playground") {
//    print("YES")
//} else {
//    print("NO")
//}
//
//if str.hasPrefix("Hello") {
//    print("YES")
//} else {
//    print("NO")
//}


/*
 * Tuple 元祖
 */

//var Tuple = (1, 2, 3)
//print(Tuple.0, Tuple.1, Tuple.2)
//
//var (x, y, z) = (1, 2, 3)
//print(x, y, z, "\(x), \(y), \(z)")
//
//var Tuple2 = (x:1, y:2, z:3)
//print(Tuple2.x, Tuple2.y, Tuple2.z)

/*
 * 字符
 */

//let char1 = " "
//let char2: Character = "V"
//for ch in str {
//    print(ch)
//}
//str.append(char1); str.append(char2)
//print(str)

/*
 * 数组
 */

//var charArray = [String](repeating: "a", count: 5)
//var numberArray = [Int](repeating: 1, count: 5)
///***
//charArray[1] = "b"
//print(charArray)
//***/
//
//charArray.insert("c", at: 2)
//print(charArray)
//charArray.remove(at: 2)
//print(charArray)
//
//for indexNum in charArray {
//    print(indexNum)
//}
//charArray += ["b"]
//charArray.append("c")
//print(charArray)
//
//for (index, item) in charArray.enumerated() {
//    print("\(index):\(item)")
//}
//
///** 同元素类型相加 */
///*
// let arr = charArray + numberArray
// error: Swift_Test1.playground:149:21: error: type of expression is ambiguous without more context
// let arr = charArray + numberArray
//           ~~~~~~~~~~^~~~~~~~~~~~~
// */
//
//let letArr = charArray + ["a", "b", "c", "d", "e"]
//print(letArr)
//for item in letArr {
//    print(item)
//}
//
//if letArr.isEmpty {
//    print("null")
//} else {
//    print("Unnull")
//}
//
//let arr = [Int]()
//if arr.isEmpty {
//    print("null")
//} else {
//    print("Nunull")
//}

/*
 * Set
 */

//var sets: Set = [1, 2, 3, 4, 3, 2, 1]
//print(sets)
//sets.insert(4)
//print(sets)
//sets.remove(1)
//print(sets)
//sets.contains(1)
//sets.contains(4)
//
//var arrayFromSets = sets.sorted()
//print(arrayFromSets)
//
//var set1: Set = [1, 2, 3, 4, 5, 6]
//var set2: Set = [6, 7, 8 ,9 ,10 ,11]
//
//print("交集",set1.intersection(set2))
//print("差集",set1.subtract(set2))
//print("并集",set1.union(set2))
//print("补集",set1.symmetricDifference(set2))
//
//var set3: Set = ["a", "b", "c", "d", "e", "f", "g"]
//var set4: Set = ["a", "b", "c", "d", "e", "f", "g"]
//var set5: Set = ["a", "b", "c", "d", "e"]
//
//print("子集", set4.isSubset(of: set3))
//print("子集", set5.isSubset(of: set3))
//print("严格子集", set4.isStrictSubset(of: set3))
//print("严格子集", set5.isStrictSubset(of: set3))
//
//print("父集", set3.isSuperset(of: set4))
//print("父集", set3.isSuperset(of: set5))
//print("严格父集", set3.isStrictSuperset(of: set4))
//print("严格父集", set3.isStrictSuperset(of: set5))
//
//let set6: Set = ["x", "y", "z"]
//print("无交集", set3.isDisjoint(with: set5))
//print("无交集", set3.isDisjoint(with: set6))

/**
 * 字典
 **/

//var nullDic = [Int:String]()
//var someDict:[Int:String] = [1:"One", 2:"Two", 3:"Three"]
//
//print(someDict[1]!)
//someDict.updateValue("Four", forKey: 4)
//print(someDict)
//someDict[4] = "four"
//print(someDict)
//someDict.removeValue(forKey: 4)
//print(someDict)
////someDict.removeAll()
////print(someDict)
//
//for (key, value) in someDict {
//    print("\(key):\(value)")
//}
//
//for (key, keyValue) in someDict.enumerated() {
//    print("\(key) -> \(keyValue)")
//}
//
//let dictKeys = someDict.keys
//let dictValues = someDict.values
//print("Keys:\(dictKeys)\nValues:\(dictValues)")
//
//print(nullDic.count,someDict.count)
//
//if nullDic.isEmpty {
//    print("null")
//} else {
//    print("Nunull")
//}
//
//if someDict.isEmpty {
//    print("null")
//} else {
//    print("Nunull")
//}


/**
 * 函数
 **/

//func addString(headString:String) -> String {
//    let endString = " xyz"
//    let finalString = headString + endString
//    return (finalString)
//}
//
//print(addString(headString: str))
//
//func _MinMax(array:[Int]) -> (min: Int, max: Int)? {
//
//    if array.isEmpty {
//        return nil
//    }
//
//    var currentMin = array[0]
//    var currentMax = array[0]
//    for index in array {
//        if index > currentMax {
//            currentMax = index
//        } else if index < currentMin {
//            currentMin = index
//        }
//    }
//    return (currentMin, currentMax)
//}
//
//if let bounds = _MinMax(array: [1, 3, 5, 7, 9, -11, -13, -17, -19]) {
//    print("Min:\(bounds.min), Max:\(bounds.max)")
//}
//
//func power(firstArg a: Int, secondArg b: Int) -> Int {
//    var per = a
//    for _ in 1..<b {
//        per = per * a
//    }
//    print(per)
//    return per
//}
//
//print(power(firstArg: 5, secondArg: 3))
//
//func vari<NM>(members: NM...) {
//    for i in members {
//        print(i)
//    }
//}
//
//vari(members: 3, 5, 4, 6)
//vari(members: "a", "g", "g", "d", "h")
//
//func swapTwoIntsMutable(_ a: inout Int, _ b: inout Int) {
//    var temporaryA = a
//    a = b
//    b = temporaryA
//}
/////* a b 默认 let 不可变 */
////func swapTwoInts(_ a: Int, _ b: Int) {
////    var temporaryA = a
////    a = b
////    b = temporaryA
////}
//
//var x = 1
//var y = 5
////swapTwoInts(x, y)
////print(x, y)
//swapTwoIntsMutable(&x, &y)
//print(x, y)
//
//func sum(a: Int, b: Int) -> Int {
//    return a + b
//}
//
//// 多返回值
//func maxMin() -> (Int, Int) {
//    return (Int.min, Int.max)
//}
//print(maxMin())
//print(maxMin().0)
//print(maxMin().1)
//
//func add(x: Int, defult: Int = 5) -> Int {
//    return x + defult
//}
//
//print(add(x: 6))
//print(add(x: 6, defult: 7))
//
//var addition: (Int, Int) -> Int = sum
//print("\(addition(56, 654))")
//
//func another(addition: (Int, Int) -> Int, a: Int, b: Int) {
//    print("\(addition(a, b))")
//}
//another(addition: sum(a:b:), a: 10, b: 20)
//
//func calcDecrement (forDecrement total: Int) -> () -> Int {
//    var docu = 0
//    func decrementer() -> Int {
//        docu -= total
//        return docu
//    }
//    return decrementer
//}
//
//let some = calcDecrement(forDecrement: 10)
//print(some())
//
//func digFunc (num1: Int, num2: Int, smallFunc: (Int, Int) -> Int) -> Int {
//    return smallFunc(num1, num2)
//}
//
//func small (num1: Int, num2: Int) -> Int {
//    return num1 + num2
//}
//
//print(digFunc(num1: 6, num2: 8, smallFunc: small))

/**
 * 闭包
 **/

//let divide = {(val1: Int, val2: Int) -> Int in
//    return val1 + val2
//}
//let result = divide(10, 5)
//print(result)
//
//let names = ["AT", "AE", "D", "S", "BE"]
//func backwords(s1: String, s2: String) -> Bool {
//    return s1 > s2
//}
//let reversed = names.sorted(by: backwords)
//let revange = names.sorted { (a, b) -> Bool in
//    return a > b
//}
//print(revange)
//
//let full = names.sorted { $0 > $1 }
//print(full)
//
//var reversed = names.sorted(by: {$0 > $1}) //参数名称缩写
//var reversed = names.sorted(by: >)         //运算符函数
//var reversed = names.sorted() {$0 > $1}    //尾随闭包
//var reversed = names.sorted {$0 > $1}
//print(reversed)

/**
 * 枚举
 **/

//enum Body {
//    case fat
//    case tall
//    case short
//    case white
//    case black
//}
//
//Body.black; Body.fat; Body.tall; Body.short; Body.white
//
//var thisMan = Body.tall
//switch thisMan {
//case .tall:
//    print("tall")
//case .fat:
//    print("fat")
//default:
//    print("???")
//}
//
//enum humenBody {
//    case man (Int, Int, String)
//    case woman (Int, Int, String)
//    case child (Int, Int, String)
//}
//
//let manBody = humenBody.man(170, 200, "Strong")
//let womanBody = humenBody.woman(150, 170, "Beautifle")
//let childBody = humenBody.child(80, 150, "Lovely")
//
//switch childBody {
//case .man(let man0, let man1, let man2):
//    print("\(man0), \(man1), \(man2)")
//case .woman(let woman0, let woman1, let woman2):
//    print("\(woman0), \(woman1), \(woman2)")
//case .child(let child0, let child1, let child2):
//    print("\(child0), \(child1), \(child2)")
//default:
//    print("非人哉")
//}

