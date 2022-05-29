//
//  ProtocolViewController.swift
//  SwiftBase
//
//  Created by xmly on 2022/5/23.
//

import UIKit

// MARK: 1、协议定义
protocol PrMyProtocol {
    /*
     属性声明
     只读权限 {get}
     读写权限 {get set}
     注意：属性实现的权限应大于等于在协议中声明的权限
     */
    var name: String {get set}
    
    //如果是类类型遵守协议，需要使用class来修饰类型属性
    static var age: Int {get set}
//    class var age1: Int {get set} //这里不能使用class修饰，只能使用static修饰
    
    func method1()
    static func method2()
    //说明该方法内可以修改实例的属性
    mutating func method3()
    
    init(name: String)
    
}

//class PrPerson {
//}
//class PrStudent:PrPerson,PrMyProtocol {
//}
// MARK: 2、协议的遵守
class PrStudent: PrMyProtocol {
    //存储属性
    var name: String = "dancer"
    //或者使用计算属性
//    var name: String {
//        get {
//            return "dancer"
//        }
//        set {
//            self.name = newValue
//        }
//    }
    //使用协议联想出来的是static修饰，但是使用self.age会报警告，所以这里换成class修饰
    class var age: Int {
        get {
            return 1
        }
        set {
            self.age = 13
        }
    }
    
    //协议实现
    func method1() {
        print("类中使用 method1")
    }
    
    static func method2() {
        print("类中使用 class method2")
    }
    
    func method3() {
        name = "newVALUE"
    }
    
    //构造方法，需要使用required关键字来修饰
    required init(name: String) {
        self.name = name
    }
}

struct PrTeacher: PrMyProtocol {
    var name: String
    
    //在非类类型里，实现协议里的类型属性，使用static修饰
    static var age: Int {
        get {
            return 1
        }
        set {
            self.age = newValue
        }
    }
    
    func method1() {
        print("结构体中使用 method1")
    }
    
    static func method2() {
        print("结构体中使用 class method2")
    }
    
    mutating func method3() {
        name = "newValue"
    }
    
    //构造方法, 可以不用实现
//    init(name: String) {
//        self.name = name
//    }
}

// MARK: 3、协议类型
protocol PrRundomProtocol {
    func rundom() -> Int
}

class PrDice {
    var sids: Int
    var generator: PrRundomProtocol
    
    init(sids: Int, generator: PrRundomProtocol) {
        self.sids = sids
        self.generator = generator
    }
    
    func roll() -> Int {
        return self.generator.rundom() * sids + 1
    }
}

class PrMyNumber: PrRundomProtocol {
    func rundom() -> Int {
        return 7
    }
}

// MARK: 4、使用扩展实现协议
protocol PrMyProtocol2 {
    func show()
}

class PrStudent2 {
    var name: String?
    var age: Int?
    func showMessage() {
        
    }
}

extension PrStudent2: PrMyProtocol2 {
    func show() {
        print("协议方法的实现")
    }
}

// MARK: 5、当类型符合协议的所有要求，但是类型却并没有遵守该协议，可以使用扩展来使得类型遵守协议
protocol PrMyProtocol3 {
    var name: String {get set}
    func showMessage()
}

class PrStudent3 {
    var name: String = "dancer"
    func showMessage() {
        print("name:\(name)")
    }
}

extension PrStudent3: PrMyProtocol3 {

}

// MARK: 6、数组中存放遵循某个协议的对象
protocol PrMyProtocol4 {
    var name: String {get set}
}

class PrStudent4: PrMyProtocol4 {
    var name: String = "学生"
}

class PrTeacher4: PrMyProtocol4 {
    var name: String = "教师"
}

// MARK: 7、协议的继承和专属协议
protocol PrMyProtocol71 {
    var name: String {get set}
}

protocol PrMyProtocol72 {
    var age: Int {get set}
}

protocol PrMyProtocol73: PrMyProtocol71, PrMyProtocol72 {// 协议的继承
    func showMessage73()
}

protocol PrMyProtocol74: PrStudent6 { // 限定协议只对类PrStudent6有效
    var company: String {get set}
}

protocol PrMyProtocol75: AnyObject { // 限定协议只对类有效
    var houseNum: Int {get set}
}

class PrStudent5: PrMyProtocol73 {
    var name: String = "dance5"
    var age: Int = 5
    func showMessage73() {
        print("name:\(name), age:\(age)")
    }
}

class PrStudent6: PrMyProtocol74 {
    var company: String = "SS7"
}

//报错 限定协议只对类PrStudent6有效
//class PrStudent7: PrMyProtocol74{
//    var company: String = "SS7"
//}

//报错 限定协议只对类有效
//struct PrStudent8: PrMyProtocol75 {
//
//}

// MARK: 8、协议组
protocol PrMyProtocol81 {
    var name: String {get set}
}

protocol PrMyProtocol82 {
    var age: Int {get set}
}

class PrStudent81: PrMyProtocol81, PrMyProtocol82 {
    var name: String = "数数81"
    var age: Int = 7
}

// MARK: 9、协议的类型检查和转换
protocol PrHasArea {
    var area: Double {get}
}

class PrCilce: PrHasArea {
    let PI = 3.0
    var radius: Double
    init(radius: Double) {
        self.radius = radius
    }
    var area: Double {
        return self.PI * radius * radius
    }
}

class PrCountry: PrHasArea {
    var area: Double
    init(area: Double) {
        self.area = area
    }
}

class PrAnimal {
    var legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}

// MARK: 10、可选协议
@objc protocol PrMyProtocol10 {
    var age: Int {get} //如果age在下面不实现则必须 在前加@objc optional
    @objc optional func debugNumber()
}

class PrStudent10: PrMyProtocol10 {
    var age: Int = 5;
    var name: String = "dancer10"
}

class ProtocolViewController: UIViewController {
    
    var list: [PrMyProtocol4] = [PrMyProtocol4]() //存放遵循某个协议的对象

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "协议"
        self.view.backgroundColor = UIColor.white
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 协议类型
//        let runNum = PrMyNumber()
//        let myDic = PrDice(sids: 6, generator: runNum)
//
//        for _ in 1...6 {
//            let num = myDic.roll()
//            print(num)
//        }
        
        //协议类型
//        let xiaoming = PrStudent3()
//        myFunc(thing: xiaoming)
        
        //存放遵循某个协议的对象
//        let s1 = PrStudent4()
//        let t1 = PrTeacher4()
//        list.append(s1)
//        list.append(t1)
//        for value in list {
//            print("name:\(value.name)")
//        }
        
        //协议的继承和专属协议
//        let s5 = PrStudent5()
//        s5.showMessage73()

        //协议组
//        let s8 = PrStudent81()
//        myFunc8(thing: s8)
        
        //协议的类型检查和转换
//        let objects: [AnyObject] = [PrCilce(radius: 2.0), PrCountry(area: 45), PrAnimal(legs: 4)]
//        for obj in objects {
//            if let objectWithHasArea = obj as? PrHasArea {
//                print("area: \(objectWithHasArea.area)")
//            } else {
//                print("no area")
//            }
//        }
        
        //可选协议
//        let s10 = PrStudent10()
//        myFunc10(thing: s10)
    }
    
    //协议类型
    func myFunc(thing: PrMyProtocol3) {
        thing.showMessage()
        print("thing.name:\(thing.name)")
    }
    
    //协议组
    func myFunc8(thing: PrMyProtocol81 & PrMyProtocol82) {
        print("thing name:\(thing.name) age:\(thing.age)")
    }
    
    func myFunc10(thing: PrMyProtocol10) {
        print(thing.age)
        thing.debugNumber?()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
