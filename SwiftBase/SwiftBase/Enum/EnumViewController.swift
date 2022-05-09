//
//  EnumViewController.swift
//  SwiftBase
//
//  Created by 邓亚洲 on 2022/5/9.
//

import UIKit

//定义一个枚举
//enum WeekDay {
//case MON,THE,WEN,THU,FRI,SAT,SUN
//}

enum WeekDay {
    case MON
    case THE
    case WEN
    case THU
    case FRI
    case SAT
    case SUN
}

//关联值
enum EnumStudent {
    case SmallStudent(String,String,String)
    case BabyStudent(Int,Int,Int)
}

//原始值 支持的类型 整形、浮点、字符串、字符
enum EnumColor: Int {
    case RED = 8
    case BLU
    case YELLOW
}
enum EnumFriendNames: String {
    case XIAOMING = "aaa"
    case XIAOHUA = "bbb"
}

class EnumViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "枚举"
        self.view.backgroundColor = UIColor.white
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //使用枚举的成员变量有两种方式 1.枚举类型名.成员名 2. .成员名
//        var birthDay: WeekDay = WeekDay.FRI
//        var birthDay: WeekDay = .FRI
        var birthDay = WeekDay.FRI
        
        switch birthDay {
        case .MON:
            print("星期1")
        case .THE:
            print("星期2")
        case .WEN:
            print("星期3")
        case .THU:
            print("星期4")
        case .FRI:
            print("星期5")
//            fallthrough //下个case也会走
        case .SAT:
            print("星期6")
        case .SUN:
            print("星期7")
        }
        
        //关联值
        var xiaoMing = EnumStudent.SmallStudent("one", "two", "three")
//        var xiaoMing = EnumStudent.BabyStudent(2, 3, 4)
        switch xiaoMing {
        case .SmallStudent(let string1, let string2, let string3):
            print("string:\(string1) \(string2) \(string3)")
        case .BabyStudent(let int1, let int2, let int3):
            print("int:\(int1) \(int2) \(int3)")
        }
        
        //原始值 支持的类型 整形、浮点、字符串、字符
        let eColor = EnumColor(rawValue: 9) //根据原始值 拿枚举值
        print(eColor ?? .YELLOW)
        switch eColor {
        case .RED:
            print("红色")
        case .BLU:
            print("蓝色")
        case .YELLOW:
            print("黄色")
        case .none: //为nil的情况
            print("none")
        }
        let eFriend = EnumFriendNames(rawValue: "bbb")
        print(eFriend ?? .XIAOMING)

        //可选绑定
        if let myColor = EnumColor(rawValue: 100) {
            print(myColor)
        } else {
            print("没有对应的颜色")
        }
        
        //按照范围查找
        var tempNum = 34
        switch tempNum {
        case 35...50:
            print("35...50")
        case 25..<34:
            print("25..<34")
        case 1...18:
            print("1...18")
        default:
            print("没有tempNum")
        }
        
        
        
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
