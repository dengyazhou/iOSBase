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
        // MARK: 4、枚举
        let vc = EnumViewController.init()
        self.navigationController?.pushViewController(vc, animated: true)
        
        // MARK: 3、Class 和 Struct
//        let vc = ClassAndStructViewController.init()
//        self.navigationController?.pushViewController(vc, animated: true)
        
        // MARK: 2、闭包
//        let vc = ClosuresViewController.init()
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
