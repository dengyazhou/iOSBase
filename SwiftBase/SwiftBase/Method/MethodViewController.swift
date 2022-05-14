//
//  MethodViewController.swift
//  SwiftBase
//
//  Created by 邓亚洲 on 2022/5/10.
//

import UIKit

//MARK: 方法
class MethodBoy {
    //期望一个变量、常量在创建初期，必须对其进行初始化处理
//    var testInstance: String?
    
    var name: String = "Dancer"
    
//    var name: String
//    init(name: String) {
//        self.name = name
//    }
    
    var age: Int = 19
    
    //定义一个无参数无返回值的方法
    func sayHello() {
        print("hello 小妹")
    }
    
    //定义一个有参数的方法
    func sayGirlLooksLike(thing: String) {
        print("小妹长的像\(thing)")
    }
    
    //定义一个有参数有返回值的方法
    func selectGirlFriend(age: Int) -> Bool {
        if age > 18 {
            return true
        } else {
            return false
        }
    }
}

//MARK: 类型方法
class MethodWeapon {
    var weaponName: String = "新手武器"
    
    //类型属性，必须是计算属性
    class var currentVersion: String {
        get {
            return "极品武器"
        }
    }
    
    //在类类型中，使用class关键字来声明类型方法
    class func introduceWeapon() {
        //访问实例属性 错误，不能在类型方法里访问实例属性
//        print("武器名字\(weaponName)") //错误
        
        //访问类型属性
        if currentVersion == "极品武器" {
            print("极品天域武器")
        } else {
            print("普通武器")
        }
    }
}

//MARK: 下标方法
class MethodPeople {
    var name: String = "Dancer"
    subscript(index: Int) -> String? {
        get {
            if index == 1 {
                return name;
            } else {
                return nil;
            }
        }
        set {
            if index == 1 {
                name = newValue ?? "默认值"
            }
        }
        
    }
}

class MethodFriendsBook {
    var friendArray: [String] = []
    var bookName: String = "前女友回忆录"
    
    subscript(index: Int) -> String? {
        get {
            if index < friendArray.count {
                return friendArray[index]
            } else {
                return nil
            }
        }
        
//        set(newElement) {
//           friendArray[index] = newElement ?? "默认书籍"
//        }
        
        set {
            friendArray[index] = newValue ?? "默认书籍"
        }
    }
}

class MethodPerson {
    class var nameC: String {
        return "小码C"
    }
    static var nameS: String {
        return "小码S"
    }
    
    static var nick = "xiaobao"
    class func server() {
        print("\(nick),您在北京联通1区")
    }
}

class MethodMan: MethodPerson {
    override class var nameC: String { //继承只能重写class 修饰的类型属性
        return "小码CC"
    }
    override class func server() {
        print(nick,"您在上海电信2区")
    }
}


class MethodViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "方法"
        self.view.backgroundColor = UIColor.white
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //调用实例方法
        var xiaoming = MethodBoy()
        xiaoming.name = "小明"
        xiaoming.age = 25
        xiaoming.sayHello()
        xiaoming.sayGirlLooksLike(thing: "诗诗")
        if xiaoming.selectGirlFriend(age: 19) {
            print("满足找女朋友的条件");
        } else {
            print("不满足找女朋友的条件")
        }
        
        //类型方法
        MethodWeapon.introduceWeapon()
        print(MethodWeapon.currentVersion)
        
        //下标方法
        var dancer = MethodPeople()
        print(dancer[1] ?? "")
        dancer[1] = "小明"//nil
        print(dancer[1] ?? "")
        
        var book = MethodFriendsBook()
        print(book[0] ?? "没有值哦")
        book.friendArray.append("诗诗")
        book[0] = nil
        print(book[0] ?? "没有值哦")
        
        print(MethodPerson.nameC)
        print(MethodPerson.nameS)
        print(MethodMan.nameC)
        
        MethodPerson.server()
        MethodMan.server()
        
        
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
