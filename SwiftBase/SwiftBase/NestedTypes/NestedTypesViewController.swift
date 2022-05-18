//
//  NestedTypesViewController.swift
//  SwiftBase
//
//  Created by 邓亚洲 on 2022/5/17.
//

import UIKit

class NestedHero {
    class NestedWeapon {
        var name: String
        var length: Int
        init(name: String, length: Int) {
            self.name = name
            self.length = length
        }
//        init?(name: String, length: Int) {
//            self.name = name
//            self.length = length
//        }
        func descWeapon() -> String {
            return "\(name)长\(length)米"
        }
    }
    var weapon: NestedWeapon? = NestedWeapon(name: "寒江雪", length: 1)
    var name: String
    init(name: String) {
        self.name = name
    }
    func descHero() {
        if weapon == nil {
            print("\(name)并不靠武器打架")
        } else {
            print("\(name)的武器是\(weapon?.descWeapon() ?? "默认值")")
        }
    }
}

struct NestedBoby {
    enum Sex {
        case Boy, Girl
    }
    var babySex: Sex?
    var girlFriendsNumber: Int
    init(girlFriendsNumber: Int) {
        self.girlFriendsNumber = girlFriendsNumber
    }
    
    //如果希望在结构体的方法内修改结构体的属性，需要把结构体的方法声明成mutating
    mutating func showMessage() {
        if girlFriendsNumber < 3 {
            babySex = .Boy
        } else {
            babySex = .Girl
        }
        
        switch babySex {
        case .Boy:
            print("是一个男孩")
        case .Girl:
            print("是一个女孩")
        case .none: //为nil的情况
            print("可选类型为nil")
        }
          
    }
}

class NestedTypesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "嵌套类型"
        self.view.backgroundColor = UIColor.white
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let qiaofeng = NestedHero(name: "乔峰")
        //注意：在外部无法使用类内部定义的类型
        qiaofeng.descHero()
    
        qiaofeng.weapon?.name = "嘿嘿"
        let ret = qiaofeng.weapon?.descWeapon()
        print("\(ret ?? "默认值")")
        
        var myBady = NestedBoby(girlFriendsNumber: 4)
        myBady.showMessage()
//        myBady.babySex = .Boy
        print(myBady.babySex ?? .Boy)
        
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
