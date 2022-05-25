//
//  ProtocolViewController.swift
//  SwiftBase
//
//  Created by xmly on 2022/5/23.
//

import UIKit

// MARK: 协议定义
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
// MARK: 协议的遵守
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

class ProtocolViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "协议"
        self.view.backgroundColor = UIColor.white
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
