//
//  GenericTypesViewController.swift
//  SwiftBase
//
//  Created by xmly on 2022/5/30.
//

import UIKit

// MARK: 泛型
class GTStudent {
    
    func swapFuncInt(num1:inout Int, num2:inout Int) {
        let temp = num1
        num1 = num2
        num2 = temp
    }
    
    func swapFuncString(str1:inout String, str2:inout String) {
        let temp = str1
        str1 = str2
        str2 = temp
    }
    
    //业务逻辑相同，处理的数据类型不同，可以使用泛型来解决
    /*
     1.泛型函数 泛型和函数在一起
     2.泛型类型 泛型和类型在一起
     3.关联类型 泛型和协议在一起
     */
    //<T>是一个占位符，T表示的是一种类型，而具体是什么类型，由使用者去指定 T也可以换成其他的字符
    func swapFunc<T>(parameter1:inout T, parameter2:inout T) {
        let tem = parameter1
        parameter1 = parameter2
        parameter2 = tem
    }
}

// MARK: 泛型: class使用
class GTStack<T> {
    var items: [T] = [T]()
    func push(item: T) {
        items.append(item)
    }
    func pop() -> T {
        return items.removeLast()
    }
}

// MARK: 在扩展内使用泛型类型
extension GTStack {
    func topItem() -> T? {
        if items.count == 0 {
            return nil
        } else {
            return items[items.count - 1]
        }
    }
}

// MARK: 关联类型
protocol GTStackProtocol {
    //使用typealias定义一个我们要描述的数据类型
    associatedtype ItemType
    func push_V1(item: ItemType)
    func pop_V1() -> ItemType
}

class GTStack2<T>: GTStackProtocol {
    typealias ItemType = T
    var items: [T] = [T]()
    func push_V1(item: T) {
        items.append(item)
    }
    func pop_V1() -> T {
        return items.removeLast()
    }
}

// MARK: where关键字 相当于一个条件的限定
protocol GTContainer {
    associatedtype ItemType
    mutating func append(item: ItemType)
    var count: Int { get }
    subscript(index: Int) -> ItemType { get }
}

class GTStack31<T>: GTContainer {
    typealias ItemType = T
    var items: [T] = [T]()
    
    func push(item: T) {
        items.append(item)
    }
    
    func pop() -> T {
        return items.removeLast()
    }
    
    func append(item: T) {
        items.append(item)
    }
    var count: Int {
        return items.count
    }
    subscript(index: Int) -> T {
        return self.items[index]
    }
}

struct GTStack32<T>: GTContainer {
    typealias ItemType = T
    var items: [T] = [T]()
    mutating func append(item: T) {
        items.append(item)
    }
    var count: Int {
        return items.count
    }
    subscript(index: Int) -> T {
        return self.items[index]
    }
}

class GenericTypesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "泛型"
        self.view.backgroundColor = UIColor.white
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //泛型
        var num1 = 9
        var num2 = 10
        var str1 = "喜马拉雅"
        var str2 = "数数科技"
        let s = GTStudent()
//        s.swapFuncInt(num1: &num1, num2: &num2)
//        s.swapFuncString(str1: &str1, str2: &str2)
        s.swapFunc(parameter1: &num1, parameter2: &num2)
        s.swapFunc(parameter1: &str1, parameter2: &str2)
        print("num1:\(num1), num2:\(num2)")
        print("str1:\(str1), str2:\(str2)")
        
        //泛型: class使用
        let stack1 = GTStack<String>()
        stack1.push(item: "Swift")
        stack1.push(item: "OC")
        stack1.push(item: "C++")
        stack1.push(item: "C")
        print("stack1:\(stack1.pop())")
        
        let stack2 = GTStack<Int>()
        stack2.push(item: 5)
        stack2.push(item: 4)
        stack2.push(item: 3)
        print("stack2:\(stack2.pop())")
        
        let stack3 = GTStack<Any>()
        stack3.push(item: 12)
        stack3.push(item: "Swift")
        print("stack3:\(stack3.pop())")
        let top = stack3.topItem() ?? "默认值"
        print("stack3:\(top)")
        print("stack3:\(top)")
//        for i in 0...1 {
//            print(stack3.pop())
//        }
        
        // where关键字 相当于一个条件的限定
        let stack31 = GTStack31<String>()
        stack31.push(item: "Swift")
        stack31.push(item: "OC")
        
        var stack32 = GTStack32<String>()
        stack32.append(item: "Swift")
        stack32.append(item: "OC")
        
        print(allItemsMatch(container1: stack31, container2: stack32))
    }
    
    func allItemsMatch<C1: GTContainer, C2: GTContainer>(container1: C1, container2: C2) -> Bool where C1.ItemType == C2.ItemType, C1.ItemType: Equatable {
        if container1.count != container2.count {
            return false
        }
        for i in 0..<container1.count {
            if container1[i] != container2[i] {
                return false
            }
        }
        return true
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
