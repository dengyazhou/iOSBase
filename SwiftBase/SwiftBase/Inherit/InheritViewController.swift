//
//  InheritViewController.swift
//  SwiftBase
//
//  Created by 邓亚洲 on 2022/5/11.
//

import UIKit

/*
 继承的基本语法
 class 子类:父类{
    内容
 }
 */
class InheritWeapon {
    //存储属性
    var heroName: String = ""
    var level: Int = 0
    var skill: String = ""
    
    //只读的计算属性
    var name: String {
//        get {
//            return "武器\(level)级的天域武器"
//        }
        return "武器\(level)级的天域武器"
    }
    
    //添加一个使用武器技能的方法
    func useSkill() {
        print("\(heroName) 拿着 \(name) 释放了一次 \(skill) 技能")
    }
}

class InheritSubWeapon: InheritWeapon {
    //存储属性不能被重写
//    override var heroName: String = "name" //错误
    
    //重写计算属性
    override var name: String {
        return "武器\(level)级的天域武器 子类"
    }
    
    //重写父类方法
    override func useSkill() {
        print("\(heroName) 拿着 \(name) 释放了一次 \(skill) 技能 子类")
    }
}


//继承可以使用类（class）而不能用于结构体和枚举。
//Swift中，类也不能多继承支持。
//父类的计算属性可以被子类重写，如果该计算属性在父类中是只读的，则该子类可以重写该属性使其编程只读或者可读可写，但是如果属性在父类中是可读可写的，则子类重写后必须是可读可写属性。也就是说，子类中属性的读写权限必须大于或等于父类。
//父类的方法可以被子类重写，函数前使用override修饰
//父类的下标方法也可以被子类重写，同样也使用override修饰
class InheritPeople {
    var hours: Int = 0
    var taskList: [String] = []
    var money: Int {
        get {
            return hours * 10
        }
        set {
            hours = newValue / 10
        }
    }
    
    subscript(index: Int) -> String? {
        get {
            if index < taskList.count {
                return taskList[index]
            } else {
                return nil
            }
        }
        set {
            taskList[index] = newValue ?? "默认值"
        }
    }
    
    //final 禁止重写
    final var books: Int {
        return 30
    }
}

class InheritITWorker: InheritPeople {
    override var money: Int {
        get {
            return hours * 20
        }
        set {
            hours = newValue / 20
        }
    }
    
    override subscript(index: Int) -> String? {
        get {
            if index < taskList.count {
                return taskList[index]
            } else {
                return nil
            }
        }
        set {
            if ((newValue?.hasPrefix("IT:")) == true) {
                taskList[index] = newValue ?? "默认值ITWorker"
            } else {
                let task = "IT" + (newValue ?? "默认值ITWorker")
                taskList[index] = task
            }
        }
    }
}



class InheritViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "继承"
        self.view.backgroundColor = UIColor.white
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let baseWeapon = InheritWeapon.init()
        baseWeapon.heroName = "李白"
        baseWeapon.level = 4
        baseWeapon.skill = "降龙十八掌"
        baseWeapon.useSkill()
        
        let subWeapon = InheritSubWeapon()
        subWeapon.heroName = "喜马拉雅"
        subWeapon.level = 9
        subWeapon.skill = "上市申请"
        subWeapon.useSkill()
        
        var worker = InheritITWorker()
        worker.hours = 10
        print(worker.money)
        
        worker.taskList.append("修复bug")
        worker.taskList.append("项目上线")
        worker.taskList.append("版本迭代")
        //调用子类的下标方法访问
        print(worker[0] ?? "默认值")
        //调用子类的下标方法赋值
        worker[0] = "修复新bug"
        print(worker[0] ?? "默认值")
        
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
