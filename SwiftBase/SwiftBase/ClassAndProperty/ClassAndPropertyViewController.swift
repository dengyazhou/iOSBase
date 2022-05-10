//
//  ClassAndPropertyViewController.swift
//  SwiftBase
//
//  Created by 邓亚洲 on 2022/5/10.
//

import UIKit


/*
.h
@interface 类名:父类 {
    成员变量列表
}
方法列表
@end
 
.m
@implementation 类名
 
 方法的实现
@end
*/

/*
name: 类名
super class 父类
一个类可以没有父类
*/
class CPStudent {
    var name: String = "dance"
    var age: Int = 19
}

struct CPPerson {
    var name: String = "dance"
    var age: Int = 19
}

//结构体无需手动添加构造方法。类类型如果你没有对你的属性进行初始化，必须手动添加构造方法来为属性进行初始化操作
class CPGodWoman {
    var name: String //存储属性
    init(name: String) {
        self.name = name
    }
}
struct CPGodMan {
    var name: String
}

class CPDSMan {
    var name:String = "dancer"
    
    //延迟存储属性。当该属性被访问时，将得到一个诗诗女神
    lazy var godWoman = CPGodWoman(name: "诗诗") //延迟存储属性
    
    func callMyGirl() {
        print("\(self.name) 叫来了 \(godWoman.name) 女神")
    }
}

class CPCircle {
    var radius: Double
    init(radius: Double) {
        self.radius = radius
    }
    
    var length: Double {//计算属性
        //计算属性必须有get方法
        //取值访问器，如果只提供一条取值访问器，则这条属性就是只读属性，如果计算属性没有赋值访问器，可以取消set
        get {
            return 11*self.radius
        }
        //赋值访问器，赋值访问器的参数类型无需显示声明，可以使用newValue来代替set的参数
        set {
            self.radius = newValue/2
        }
    }
    
    var color: String! {//观察属性
        willSet {
            print("即将被赋值的新值是\(newValue ?? "")")
        }
        didSet {
            print("被赋新值之前的旧值是\(oldValue ?? "")")
        }
    }
}

class CPHuman {//类型属性
    //定义类型属性时，必须使用计算属性，不能用存储属性
    class var planet: String {
        return "地球"
    }
}


class ClassAndPropertyViewController: UIViewController {
    //属性观察器观察外部变量
    var salary: Int = 40 {
        willSet {
            print("发工资了,发了\(newValue)")
        }
        didSet {
            salary += 50
            if salary - oldValue > 0 {
                print("本次发了\(salary),上次发了\(oldValue)")
            } else {
                print("工资降了\(salary),上次发了\(oldValue)")
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "类和属性"
        self.view.backgroundColor = UIColor.white
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //注意：类型 first class  String Double 结构体 枚举
        //区别在于：class属于引用类型 结构体属于值类型
        var xiaoMing = CPStudent()
        var xiaoHong = CPPerson()
        
      
        //1.存储属性
        xiaoMing.name = "小明"
        print(xiaoMing.name)
        
        //延迟存储属性
        var dancer = CPDSMan()
        dancer.name = "Dancer"
        dancer.callMyGirl()
        
        //2.计算属性
        var mCircle = CPCircle(radius: 20)
        print(mCircle.length)
        mCircle.length = 10
        print("半径\(mCircle.radius)")
        
        //观察属性
        mCircle.color = "red"
        mCircle.color = "blue"
        
        
        //属性观察器观察外部变量
        showResult(pay: 10)
        showResult(pay: 1)
        
        //类型属性
        print(CPHuman.planet)
        
    }
    
    func showResult(pay: Int)  {
        self.salary = pay
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
