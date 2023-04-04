//
//  HomeViewController.swift
//  SwiftBase
//
//  Created by 邓亚洲 on 2022/5/5.
//

import UIKit

extension Double {
    //截断 到小数点后某一位
    func truncate(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return Double(Int(self * divisor)) / divisor
    }
    
    //四舍五入 到小数点后某一位
    func rounded(digits: Int) -> Double {
        let multiplier = pow(10.0, Double(digits))
        return (self * multiplier).rounded() / multiplier
    }
}

class HomeViewController: UIViewController {
    
    var result: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "HomeVC"
        self.view.backgroundColor = UIColor.white
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
//        let total = Double(1)
//        print("total------:\(total)")
//        let arithmetic = (total/Double(3)).truncate(places: 3) //平均数
//        print("arithmetic------:\(arithmetic)")
//        let completedQuantity = arithmetic*Double(2)
//        print("completedQuantity------:\(completedQuantity)")
//        let num0 = total-completedQuantity
//        print("total-completedQuantity------:\(num0)")
//        let num1 = (total-completedQuantity).rounded(digits: 3)
//        print("total-completedQuantity------:\(num1)")
//
//        let str = "hello你好123"
//        print("str:\(str)")
//        let str1 = str.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
//        print("str1:\(str1!)")
//        let strUTF8 = str.utf8
//        print("strUTF8:\(strUTF8)")
        
//        result = ""
        if let ret = result {
            print("====>ret:\(ret)")
        }
        guard let ret = result else {
            print("====>guard")
            return
        }
        
        print("====>:结束")
        
        
        // MARK: 10、枚举
//        let vc = EnumViewController.init()
//        self.navigationController?.pushViewController(vc, animated: true)
        
        // MARK: 12、闭包
//        let vc = ClosuresViewController.init()
//        self.navigationController?.pushViewController(vc, animated: true)
        
        // MARK: 13、类和结构体
//        let vc = ClassAndStructViewController.init()
//        self.navigationController?.pushViewController(vc, animated: true)
        
        // MARK: 14、类和属性
//        let vc = ClassAndPropertyViewController.init()
//        self.navigationController?.pushViewController(vc, animated: true)
        
        // MARK: 15、方法
//        let vc = MethodViewController.init()
//        self.navigationController?.pushViewController(vc, animated: true)
        
        // MARK: 16、继承
//        let vc = InheritViewController.init()
//        self.navigationController?.pushViewController(vc, animated: true)
        
        // MARK: 17、多态
//        let vc = PolymorphicViewController.init()
//        self.navigationController?.pushViewController(vc, animated: true)
        
        // MARK: 18、构造函数
//        let vc = ConstructorViewController.init()
//        self.navigationController?.pushViewController(vc, animated: true)
        
        // MARK: 19、内存管理
//        let vc = MemoryViewController.init()
//        self.navigationController?.pushViewController(vc, animated: true)
        
        // MARK: 20、可选链
//        let vc = OptionalChainViewController.init()
//        self.navigationController?.pushViewController(vc, animated: true)
        
        // MARK: 21、类型转换
//        let vc = TypeCastingViewController.init()
//        self.navigationController?.pushViewController(vc, animated: true)
        
        // MARK: 22、Any and AnyObject
//        let vc = AnyViewController.init()
//        self.navigationController?.pushViewController(vc, animated: true)
        
        // MARK: 23、嵌套类型
//        let vc = NestedTypesViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
        
        // MARK: 24、扩展
//        let vc = ExtensionViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
        
        // MARK: 25、协议
//        let vc = ProtocolViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
        
        // MARK: 26、泛型
//        let vc = GenericTypesViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
        
        // MARK: 1、截取字符串
//        let str = "ABCDEFGHIJKLMN"
//        let index = str.startIndex
//        let indexStart = str.index(str.startIndex, offsetBy: 2)
//        let indexEnd = str.index(str.startIndex, offsetBy: 5)
//        let newStr = str[indexStart..<indexEnd]
//        let newStr1 = str[indexStart...indexEnd]
//        print("\(newStr) \(newStr1)")
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
