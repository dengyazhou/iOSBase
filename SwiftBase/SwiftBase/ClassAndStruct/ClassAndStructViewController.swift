//
//  ClassAndStructViewController.swift
//  SwiftBase
//
//  Created by 邓亚洲 on 2022/5/9.
//

import UIKit

//类的定义
class ClassAndStructPerson {
    var name = "heihei"
    var age = 29
    var address = "北京"
}

//结构体的定义
struct ClassAndStructPoint {
    var x = 1.0
    var y = 1.0
}

class ClassAndStructViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Class 和 Struct"
        self.view.backgroundColor = UIColor.white
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //定义一个对象
        var xiaoming = ClassAndStructPerson()
        
        //定义一个结构体实例
        var ciclePoint = ClassAndStructPoint()
        
        //使用 . 运算符访问属性
        print(xiaoming.name)
        print(ciclePoint.x)
        
        ciclePoint.x = 8
        ciclePoint.y = 9
        print(ciclePoint) //直接打印 ClassAndStructPoint(x: 8.0, y: 9.0)
        
        xiaoming.name = "HEIHEI"
        xiaoming.age = 30
        print(xiaoming) //SwiftBase.ClassAndStructPerson
        print("\(xiaoming.name) \(xiaoming.age) \(xiaoming.address)")
        
        //类是引用类型、结构体是值类型
        var firstXM = ClassAndStructPerson()
        var secondXM = firstXM
        firstXM.name = "first嘿嘿"
        firstXM.age = 25
        firstXM.address = "上海疫情"
        print("\(firstXM.name) \(firstXM.age) \(firstXM.address)") //first嘿嘿 25 上海疫情
        print("\(secondXM.name) \(secondXM.age) \(secondXM.address)") //first嘿嘿 25 上海疫情
        if secondXM === firstXM {
            print("同一个实例")
        } else {
            print("不同实例")
        }
        
        
        var firstPoint = ClassAndStructPoint()
        var secondPoint = firstPoint
        firstPoint.x = 9.8
        firstPoint.y = 16.8
        print(firstPoint) //ClassAndStructPoint(x: 9.8, y: 16.8)
        print(secondPoint) //ClassAndStructPoint(x: 1.0, y: 1.0)
        
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
