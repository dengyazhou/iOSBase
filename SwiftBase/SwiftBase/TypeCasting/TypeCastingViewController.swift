//
//  TypeCastingViewController.swift
//  SwiftBase
//
//  Created by 邓亚洲 on 2022/5/16.
//

import UIKit

class TypeCAnimal {
    var barkSound: String
    init(barkSound: String) {
        self.barkSound = barkSound
    }
}

class TypeCDog: TypeCAnimal {
    func bark() {
        print("小狗的叫声是\(barkSound)")
    }
}

class TypeCCat: TypeCAnimal {
    func bark() {
        print("小猫的叫声是\(barkSound)")
    }
}

class TypeCastingViewController: UIViewController {
    //使用！声明变量，声明成自动解包的可选类型
    var name: String?
    var name1: String!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "类型转换"
        self.view.backgroundColor = UIColor.white
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let dog1: TypeCAnimal = TypeCDog(barkSound: "旺旺")
        let cat1: TypeCAnimal = TypeCCat(barkSound: "喵喵")
        let animal1 = TypeCAnimal(barkSound: "动物的叫声")
        
        if animal1 is TypeCDog {
            print("animal1 是一只小狗")
        }
        if dog1 is TypeCDog {
            print("dog1 是一只小狗")
        } else {
            print("dog1 不是一只小狗")
        }
        if dog1 is TypeCAnimal {
            print("dog1 是一只动物")
        } else {
            print("dog1 不是一只动物")
        }
        if dog1 is TypeCCat {
            print("dog1 是一只小猫")
        } else {
            print("dog1 不是一只小猫")
        }
        if cat1 is TypeCDog {
            print("cat1 是一只小狗")
        } else {
            print("cat1 不是一只小狗")
        }
        
        //使用！声明变量，声明成自动解包的可选类型
        name = "Dancer"
        print("name:\(name!)，name:\(name ?? "默认值")") //使用时 必须要加！,或者给个默认值
        name = name! + "hello" //使用时 必须要加！,或者给个默认值
//        name = (name ?? "默认值") + "hello"
        print("name:\(name!),name:\(name ?? "默认值")")
        
        name1 = "Dancer1"
        print("name1:\(name1!),name1:\(name1 ?? "默认值")") //使用时 必须要加！,或者给个默认值
        name1 = name1 + "hello" //使用时 不需要加！
        print("name1:\(name1!),name1:\(name1 ?? "默认值")") //使用时 必须要加！,或者给个默认值
        
        // MARK: as、as?、as!
        /*
         as 把一个父类实例转换成子类实例
         as？ 成功：得到一个Optional类型的子类实例，失败：返回nil
         as！ 成功：得到一个子类实例，失败：报错
         */
        var animal2: TypeCAnimal = TypeCDog(barkSound: "旺旺")
        let dog2 = animal2 as? TypeCDog
        //使用as？转换，得到的是一个Optional，所以使用这个实例需先解包
        dog2?.bark()
//        dog2!.bark()
        print("dog2:\(dog2!)")
        
        let dog3 = animal2 as! TypeCDog
        dog3.bark()
        
        let cat2 = animal1 as? TypeCCat
//        let cat3 = animal1 as! TypeCCat //崩溃
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
