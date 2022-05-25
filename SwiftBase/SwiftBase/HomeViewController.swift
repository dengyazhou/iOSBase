//
//  HomeViewController.swift
//  SwiftBase
//
//  Created by 邓亚洲 on 2022/5/5.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "HomeVC"
        self.view.backgroundColor = UIColor.white
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
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
        let vc = ProtocolViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        
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
