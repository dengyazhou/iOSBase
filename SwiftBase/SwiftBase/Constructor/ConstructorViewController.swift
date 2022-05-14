//
//  ConstructorViewController.swift
//  SwiftBase
//
//  Created by 邓亚洲 on 2022/5/11.
//

import UIKit

//构造函数就是当我们初始化一个实例时，系统自动调用的用来初始化实例的方法。在Swift中同样是以init开头的方法，并且它除了适用于类类型，也同样适用于结构体和枚举类型。一般而言，构造方法可以带参数，但没有返回值。
class ConstructorStudent {
    //Swift不允许出现没有初始化的变量、常量
//    var name: String = "默认值"
    
//    var name: String
//    init(name: String) {
//        self.name = name
//    }
    
    var name: String? //可选类型，默认值为nil，所以是可以不用在构造器中初始化。
    init(name: String) {
        self.name = name
    }
    
    init() {
        print("加载一些资源")
    }
}

//MARK: 默认构造器
class ConstructorStudent1 {
    var name: String = "dancer"
    var age: Int = 19
    func showMessage() {
        print("student1 name:\(name) age:\(age)")
    }
}

//MARK: 指定构造器
class ConstructorPerson {
    var name: String
    var age: Int
    init(personName: String, personAge: Int) {
        self.name = personName
        self.age = personAge
    }
    func showMessage() {
        print("person1 name:\(self.name) age:\(self.age)")
    }
}

//MARK: 便捷构造器
/*
 构造器链
 指定构造器必须调用其直接父类的指定构造器
 便捷构造器必须调用同一类中定义的其他构造器
 便捷构造器必须最终调用一个指定构造器结束
 */
class ConstructorPerson2 {
    var name: String
    //指定构造器
    init(name: String) {
        self.name = name
    }
    
    //便捷构造器
    convenience init() {
        //调用当前类的另一个构造器
        self.init(name: "unname")
        //必须先调用另一个有效的构造器，然后再进行当前内容的初始化
        self.name = "默认值"
    }
    
    func showMessage() {
        print("name:\(name)")
    }
}

class ConstructorStudent2: ConstructorPerson2 {
    var stuLevel: Int
    init(name: String, stuLevel: Int) {
        //子类初始化应优先初始化派生的新属性
        self.stuLevel = stuLevel
        //再使用父类的方法，初始化父类的属性
        super.init(name: name)
        
        let newName = name + ".new"
        //然后才可以对父类的属性重新初始化
        self.name = newName
    }
    
    convenience init() {
        self.init(name: "Dancer", stuLevel: 1)
        print("Student 便捷构造器调用了")
    }
    
    override func showMessage() {
        print("Student name:\(name) level:\(stuLevel)")
    }
}

class ConstructorITStudent: ConstructorStudent2 {
    var categoryName: String
    init(name: String, stuLevel: Int, categoryName: String) {
        self.categoryName = categoryName
        super.init(name: name, stuLevel: stuLevel)
    }
    
    convenience init(categoryName: String) {
        //先调用当前类的指定构造器进行初始化
        self.init(name: "unname", stuLevel: 1, categoryName: categoryName)
        print("来自ITStudent类的便捷构造器")
    }
    
    convenience init() {
        self.init(categoryName: "iOS")
        print("来自ITStudent类的第二个便捷构造器")
    }
    
    override func showMessage() {
        print("ITStudent name:\(name) stuLevel:\(stuLevel) categoryName:\(categoryName)")
    }
}

//MARK: 成员构造器
struct ConstructorPerson3 {
    var name: String
    var age: Int
    func showMessage() {
        print("name:\(name) age:\(age)")
    }
}

//MARK: 可失败构造器
/*
 可失败构造器的一般形式
 init?(参数列表){初始化内容}
 init!(参数列表){初始化内容}
 */
class ConstructorStudent3 {
    var name: String
    var age: Int
    init?(name: String, age: Int) {
        self.name = name
        self.age = age
        if age < 0 { //先初始化，才能判断
            return nil
        }
    }
    
    func showMessage() {
        print("name:\(name) age:\(age)")
    }
}

//MARK: 析构函数
class ConstructorPersonDeinit {
    var dataSource: [String] = []
    var filePath: String = ""
    init?(fileName: String) {
        if fileName.isEmpty {
            print("加载文件失败")
            return nil
        } else {
            self.filePath = fileName
            print("加载文件成功")
        }
    }
    
    deinit {
        if self.filePath.isEmpty {
            print("无需释放资源")
        } else {
            self.filePath = ""
            print("释放本地的文件资源")
        }
    }
}

class ConstructorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "构造函数"
        self.view.backgroundColor = UIColor.white
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let s1 = ConstructorStudent()
//        let s2 = ConstructorStudent(name: "小明")
        //Swift的构造函数不需要显示调用
        //[[类 alloc] init]
        
        
        //默认构造器
//        let st1 = ConstructorStudent1()
//        st1.showMessage()
        //指定构造器
//        let p = ConstructorPerson(personName: "小明", personAge: 28)
//        p.showMessage()
        //便捷构造器
        //成员构造器
        //可失败构造器
        
        
        //使用便捷构造器构建一个ConstructorPerson2实例
//        var xiaoming = ConstructorPerson2()
//        xiaoming.showMessage()
        
        //使用指定构造器构建一个ConstructorPerson2实例
//        var xiaoming = ConstructorPerson2(name: "小明")
//        xiaoming.showMessage()
        
        //使用指定构造器构建ConstructorStudent2实例
//        var xiaoming = ConstructorStudent2(name: "小明2", stuLevel: 1)
//        xiaoming.showMessage()
        
        //使用便捷构造器构建ConstructorStudent2实例
//        var xiaoming = ConstructorStudent2()
//        xiaoming.showMessage()
        
        //使用指定构造器构建ConstructorITStudent实例
//        var xiaoming = ConstructorITStudent(name: "小明3", stuLevel: 1, categoryName: "oc")
//        xiaoming.showMessage()
        
        //使用带参数的便捷构造器构建ConstructorITStudent实例
//        var xiaoming = ConstructorITStudent(categoryName: "Swift")
//        xiaoming.showMessage()
        
        //使用不带参数的便捷构造器构建ITStudent实例
//        var xiaoming = ConstructorITStudent()
//        xiaoming.showMessage()
        
        
        //成员构造器
//        var xiaoming = ConstructorPerson3(name: "小码", age: 18)
//        xiaoming.showMessage()
        
        //可失败构造器
//        var xiaoming = ConstructorStudent3(name: "小红", age: -1)
//        print(xiaoming ?? "没有值哦")
//        xiaoming?.showMessage()
        
        //析构函数
        var xiaoming = ConstructorPersonDeinit(fileName: "image.plist")
        xiaoming = nil
        
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
