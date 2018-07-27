//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

/**
 * 实例属性
 **/

//class 角色 {
//    var id = ""
//    var money = 0
//}
//
//let xiaobo = 角色()
//xiaobo.id = "小波"
//xiaobo.money = 1000
//
//struct 坐标 {
//    var x = 0, y = 0
//}
//
//enum 移动方式 {
//    case 走
//    case 跑
//    case 骑行
//    case 传送
//}
//
//class 法师: 角色 {
//    var 人物坐标 = 坐标()
//    var 人物移动方式 = 移动方式.走
//    var 当前坐标: 坐标 {
//        get {
//            switch 人物移动方式 {
//            case .走:
//                人物坐标.x += 1
//                人物坐标.y += 1
//            case .跑:
//                人物坐标.x += 3
//                人物坐标.y += 3
//            case .骑行:
//                人物坐标.x += 10
//                人物坐标.y += 10
//            case .传送:
//                人物坐标.x += 1000
//                人物坐标.y += 1000
//            }
//            return 人物坐标
//        }
//        set {
//            人物坐标 = newValue
//        }
//    }
//}
//
//var 角色1 = 法师()
//角色1.当前坐标
//角色1.人物移动方式 = .跑
//角色1.当前坐标
//角色1.人物移动方式 = .传送
//角色1.当前坐标
//角色1.当前坐标 = 坐标(x: 2000, y: 40)
//角色1.人物坐标
//
//class 经验 {
//    var 总经验 = 0 {
//        willSet {
//            print("now exp: \(newValue)")
//        }
//        didSet {
//            print("add exp: \(总经验 - oldValue)")
//        }
//    }
//
//}
//
//var 经验1 = 经验()
//经验1.总经验 = 1000
//经验1.总经验 = 3000
//经验1.总经验 = 8000

/**
 * 类型属性
 **/

//class 生命体 {
//    /* class: 类型属性在子类可以覆盖 */
//    class var 遗传方式: String {
//        return "RNA"
//    }
//
//}
//
//生命体.遗传方式
//
//class Human: 生命体 {
//    /* override: 忽略父类处理保证子类可以修改 */
//    override class var 遗传方式: String {
//        return "DNA"
//    }
//
//}
//
//Human.遗传方式
//
//struct 逛街 {
//    static let 试衣间 = "UNICOL"
//    static let 网址 = "http://www.taobao.com?cate="
//    var cate = ""
//    var shareUrl: String {
//        return 逛街.网址 + cate
//    }
//
//}
//
//逛街.试衣间
//let 逛淘宝 = 逛街(cate: "seafood")
//逛淘宝.shareUrl


/**
 * 实例方法
 **/

//enum Monster: Int {
//    case sheep = 10,
//    cat = 50,
//    snake = 100
//}
//
//struct ExpTimes {
//    var open = false
//    var times = 1
//
//}
//
//class RmbPlayer {
//    var exp = 0
//    var expTimes = ExpTimes()
//
//    func idle() {
//        exp += 500
//        print("挂机成功，总经验为：\(exp)")
//    }
//
//    func kill(monster: Monster, expTimes: Int) {
//        exp += (monster.rawValue * expTimes)
//        print("当前总经验为：\(exp)")
//    }
//}
//
//var xiaobo = RmbPlayer()
//xiaobo.idle()
//xiaobo.kill(monster: Monster.cat, expTimes: 2)
//xiaobo.expTimes.open = true
//xiaobo.expTimes.times = 2
//xiaobo.kill(monster: Monster.sheep, expTimes: 2)
//
//var dabo = RmbPlayer()
//dabo.idle()
//dabo.kill(monster: Monster.cat, expTimes: 5)
//dabo.expTimes.open = true
//dabo.expTimes.times = 5
//dabo.kill(monster: Monster.sheep, expTimes: 5)

/**
 * 类型方法
 **/

//class Player {
//    static var nick = "xiaobo"
//    /* 若子类重新 static 父类方法则父类 改为 class */
//    //static func server() {
//    class func server() {
//        print("\(nick), 您在**区")
//    }
//}
//
//Player.server()
//
//class shanghaiPlayer: Player {
//    override static func server() {
//        print("\(nick), 您在上海区")
//    }
//}

/**
 * 下标
 **/

//var array: Array = [1, 2, 3]
//array[0]
//array[2]
////array[3] /* error */
//
//var dict = [1:"1", 2:"2", 3:"3"]
//dict[2]
//
//struct Cycle {
//    func area(radious: Double) -> Double {
//        return Double.pi * pow(radious, 2)
//    }
//
//    subscript(radious: Double) -> Double {
//        return Double.pi * pow(radious, 2)
//    }
//}
//
//var cycle = Cycle()
//cycle.area(radious: 3)
//cycle[3]
//
//struct Matrix {
//    var rows, cols: Int
//    var grid: [Int]
//
//    init(rows: Int, cols: Int) {
//        self.rows = rows
//        self.cols = cols
//
//        grid = Array(repeating: 0, count: rows * cols)
//    }
//
//    func indexIsValid(row: Int, col:Int) -> Bool {
//        return row >= 0 && row < rows && col >= 0 && col < cols
//    }
//
//    subscript (row: Int, col: Int) -> Int {
//        get {
//            assert(indexIsValid(row: row, col: col), "数组越界")
//            return grid[col + (row * cols)]
//        }
//        set {
//            assert(indexIsValid(row: row, col: col), "数组越界")
//            grid[col + (row * cols)] = newValue
//        }
//    }
//}
//
//var matrix1 = Matrix(rows:3, cols:3)
//matrix1[0,0] = 11
//matrix1[0,1] = 12
//matrix1[0,2] = 13
//matrix1[1,0] = 21
//matrix1[1,1] = 22
//matrix1[1,2] = 23
//matrix1[2,0] = 31
//matrix1[2,1] = 32
//matrix1[2,2] = 33
//matrix1.grid
//matrix1.rows
//matrix1.cols
//matrix1[1,2]

/**
 * 继承
 **/

//class Vaichle {
//    var speed = 0
//    var desc: String {
//        return "时速\(speed)/h"
//    }
//
//    func makeNoise() {
//
//    }
//}
//
//class Bike: Vaichle {
//    var hasBaket = false
//
//}
//
//let aBike = Bike()
//aBike.speed = 10
//aBike.desc
//aBike.makeNoise()
//
//class CRH: Vaichle {
//    override func makeNoise() {
//        print("DuDuDu")
//    }
//}
//
//let aCRH = CRH()
//aCRH.makeNoise()

/**
 * 初始化
 **/

//class RoomTemp {
//    var season: String
//    var temp: Int
//
//    init(season: String, temp: Int) {
//        self.season = season
//        self.temp = temp
//    }
//}
//
//let temp1 = RoomTemp(season: "Spring", temp: 20)
//temp1.season
//temp1.temp
//
//// 构造器
//struct RoomTemp2 {
//    var season: String
//    var temp: Int
//}
//
//let temp2 = RoomTemp2(season: "Spring", temp: 20)
//temp2.season
//temp2.temp
//
//// 便利构造器
//class Food {
//    var name: String
//
//    init(name: String) {
//        self.name = name
//    }
//
//    convenience init() {
//        self.init(name: "rice")
//    }
//}
//
//let food = Food()
//let food1 = Food(name: "meet")
//food.name
//food1.name
//
//// 可失败构造器，针对可能失败的初始化返回nil
//struct Animal {
//    let name: String
//
//    init?(name: String) {
//        if name.isEmpty {
//            return nil
//        }
//        self.name = name
//    }
//}
//
//let cat = Animal(name: "")
//let dog = Animal(name: "Dog")
//cat?.name
//dog?.name
//
//import UIKit
//
//let ball = UIImage(named: "ball")

/**
 * 错误处理
 **/

//func aFoo() throws {
//    print("jahgas")
//}
//
//try aFoo()
//
//enum LearningAbs: Error {
//    case niMethord, noReading, noTool(tool: String)
//}
//
//func iosDec(method: Bool, style: Bool, hasTool: Bool) throws {
//    guard method else {
//        throw LearningAbs.niMethord
//    }
//
//    guard style else {
//        throw LearningAbs.noReading
//    }
//
//    guard hasTool else {
//        throw LearningAbs.noTool(tool: "No Mac")
//    }
//}
//
//var budget = 7000
//
//func buy(tools: String) {
//    if budget >= 6000 {
//        budget -= 6000
//        print("Buy Sucess! ")
//    } else {
//        print("Money Not Enough")
//    }
//}
//
//do {
//    try iosDec(method: true, style: true, hasTool: false)
//    print("可以学习")
//} catch LearningAbs.niMethord {
//    print("没好方法")
//} catch LearningAbs.noReading {
//    print("不看书")
//} catch LearningAbs.noTool(let tool) {
//    buy(tools: "Mac")
//}
//
//if let result = try? iosDec(method: true, style: true, hasTool: false) {
//    print("可以学习")
//} else {
//    print("不能学习")
//}


