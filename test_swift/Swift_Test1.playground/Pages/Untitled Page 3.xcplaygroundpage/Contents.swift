//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

protocol AProtocol {
    
}

protocol BProtocol {
    
}

struct AStruct: AProtocol, BProtocol {
    
}

class Name {
    
}

class PeopleName: Name, AProtocol, BProtocol {
    
}

protocol FileAccess {
    var readOnly: Bool { get }
    var readWrite: Bool { get set }
}

protocol AccessUrl {
    static var link: String { get }
}

protocol FullName {
    var fName: String { get }
    var gName: String { get }
}

struct Student: FullName {
    var fName: String
    var gName: String
}

struct Teacher: FullName {
    var fName: String
    var gName: String
}

var student1 = Student(fName: "小明", gName: "王")

class SomeBody: FullName {
    var title: String?
    var name: String
    
    init(title: String, name: String) {
        self.title = title
        self.name = name
    }
    
    var fName: String {
        return title ?? "无名小卒"
    }
    var gName: String {
        return name
    }
    
    var desc: String {
        return self.fName + self.gName
    }
}

var smonBody1 = SomeBody(title: "大帝", name: "亚历山大")
smonBody1.fName
smonBody1.gName
smonBody1.desc

var noBody = SomeBody(title: "", name: "波波")
noBody.fName
noBody.gName
noBody.desc

protocol Method {
    static func foo()
    static func foo1()
}

class A: Method {
    static func foo() {
        print("aaa")
    }
    class func foo1() {
        print("bbb")
    }
}

protocol RandomGenertable {
    func randomNumber() -> Int
}

struct RandomNumber: RandomGenertable {
    func randomNumber() -> Int {
        return Int(arc4random())
    }
}

struct RandomNumberSix: RandomGenertable {
    func randomNumber() -> Int {
        return Int(arc4random()) % 6 + 1
    }
}

let random1 = RandomNumber()
random1.randomNumber()

let random2 = RandomNumberSix()
random2.randomNumber()

protocol Swichable {
    mutating func onOff()
}

enum MySwift: Swichable {
    mutating func onOff() {
        switch self {
        case .Off:
            self = .On
        default:
            self = .Off
        }
    }
    
    case On, Off
}

protocol AType {
    init(aType : Int)
}

struct BType : AType  {
    init(aType : Int) {
        
    }
}

class CType : AType  {
    required init(aType : Int) {
        
    }
}

struct Dice {
    var sides: Int
    var randomNumber: RandomGenertable
    
    func play() -> Int {
        return self.randomNumber.randomNumber() % 6 + 1
    }
}

let dice = Dice(sides: 6, randomNumber: RandomNumber())
dice.play()

struct Role {
    var name: String
}

protocol Player {
    var role: Role { get }
    mutating func play()
}

protocol GameDelegate {
    func start(with player: Player) -> Int
    func rolePK(with player: Player, armed: Bool) -> Int
    func end(with player: Player) -> Int
}

struct GameAgent: GameDelegate {
    func start(with player: Player) -> Int {
        print(player.role.name,"start,EXP:2000")
        return 2000
    }
    
    func rolePK(with player: Player, armed: Bool) -> Int {
        if armed {
            print(player.role.name,"have wapon,EXP:5000")
            return 5000
        } else {
            print(player.role.name,"no wapon,EXP:2000")
            return 2000
        }
    }
    
    func end(with player: Player) -> Int {
        print(player.role.name,"End Game,EXP:1000")
        return 1000
    }
}

struct MirPlayer: Player {
    var exp: Int
    var gameAgent: GameAgent?
    
    var role: Role
    mutating func play() {
        if let agent = gameAgent {
            print("已使用代练")
            exp += agent.start(with: self)
            exp += agent.rolePK(with: self, armed: true)
            exp += agent.end(with: self)
        } else {
            print("没有代练不能自动升级")
        }
    }
}

let role = Role(name: "Song")
var player1 = MirPlayer(exp: 0, gameAgent: nil, role: role)
player1.play()

let rich = Role(name: "rich")
let agent = GameAgent()
var player2 = MirPlayer(exp: 0, gameAgent: agent, role: rich)
player2.play()

/*
 * 协议扩展
 */

let a = 1
protocol ShowHint {
    func showHint() -> String
}

extension Int: ShowHint {
    func showHint() -> String {
        return "整数\(self)"
    }
}

a.showHint()
10.showHint()
(-100).showHint()

struct Lesson {
    var name: String
    var description: String {
        return "课程：\(name)"
    }
}

1.description
extension Lesson: CustomStringConvertible {}

extension ShowHint where Self: CustomStringConvertible {
    func hint2() -> String {
        return "此类型能显示成字符串" + self.description
    }
}

print(1.hint2())

let array = [1, 2, 3, 4]

extension Collection where Iterator.Element: CustomStringConvertible {
    func newDesc() -> String {
        let itemAsText = self.map{ $0.description }
        return "该集合元素数目是\(self.count)，元素的值依次是" + itemAsText.joined(separator:",")
    }
}

array.newDesc()

let arr:[CustomStringConvertible] = [1, 2, "kaufhg", "kughaiu"]
for item in arr {
    print(item)
}

/*
 * 协议继承
 */

protocol MyPrintable: CustomStringConvertible, CustomPlaygroundQuickLookable {
    
}

struct MyContent {
    var text: String
    var mycustomText: String
}

extension MyPrintable {
    var customPlaygroundQuickLook: PlaygroundQuickLook {
        return PlaygroundQuickLook.text("Playground默认文字")
    }
}

extension MyContent: MyPrintable {
    var description: String {
        return self.text
    }
    
//    var customPlaygroundQuickLook: PlaygroundQuickLook {
//        return PlaygroundQuickLook.text(self.mycustomText)
//    }
}

let mycontent1 = MyContent(text: "内容", mycustomText: "默认文字")
mycontent1.description
mycontent1.mycustomText
mycontent1.text

/*
 * 类专用协议
 */

protocol OnleForClass: class, CustomStringConvertible, CustomPlaygroundQuickLookable {
    
}

class MyText: OnleForClass {
    var description: String {
        return "asdw"
    }
    
    var customPlaygroundQuickLook: PlaygroundQuickLook {
        return PlaygroundQuickLook.text("asdw")
    }
}

/*
 * 协议组合
 */

protocol Ageable {
    var age: Int { get }
}

protocol Nameable {
    var name: String { get }
}

struct student: Ageable, Nameable {
    var age: Int
    var name: String
}

struct teacher: Ageable, Nameable {
    var age: Int
    var name: String
    var title: String
}

func wish(someOne: Ageable & Nameable) {
    print("\(someOne.name)：\(someOne.age)岁")
}

let student111 = student(age: 10, name: "Wang")
let teacher111 = teacher(age: 20, name: "Zhao", title: "Teacher")
wish(someOne: student111)
wish(someOne: teacher111)

/*
 * 协议检查转换
 */

protocol Slogan {
    var desc: String { get }
}

protocol Coder: Slogan {
    var name: String { get set }
}

struct JaveCode: Coder {
    var name: String
    var desc: String {
        return "Jave No.1"
    }
}

struct JSCoder: Coder {
    var name: String
    var desc: String {
        return "JS No.1"
    }
}

struct NewBie {
    var name: String
}

let java1 = JaveCode(name: "Javaer")
let js1 = JSCoder(name: "JSer")
let newbie1 = NewBie(name: "NewBieer")

let coders = [java1, js1, newbie1] as [Any]

for coder in coders {
    if let coder = coder as? Coder {
        print(coder.name,coder.desc)
    } else {
        print("假的！")
    }
    
    if let newbie = newbie1 as? NewBie {
        print("鶸\(newbie.name)")
    }
}





