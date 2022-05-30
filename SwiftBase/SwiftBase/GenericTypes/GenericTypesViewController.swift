//
//  GenericTypesViewController.swift
//  SwiftBase
//
//  Created by xmly on 2022/5/30.
//

import UIKit

// MARK: 泛型
class GTStudent {
    
    func swapFuncInt(num1:inout Int, num2:inout Int) {
        let temp = num1
        num1 = num2
        num2 = temp
    }
    
    func swapFuncString(str1:inout String, str2:inout String) {
        let temp = str1
        str1 = str2
        str2 = temp
    }
    
    //业务逻辑相同，处理的数据类型不同，可以使用泛型来解决
    /*
     1.泛型函数 泛型和函数在一起
     2.泛型类型 泛型和类型在一起
     3.关联类型 泛型和协议在一起
     */
    //<T>是一个占位符，T表示的是一种类型，而具体是什么类型，由使用者去指定 T也可以换成其他的字符
    func swapFunc<T>(parameter1:inout T, parameter2:inout T) {
        let tem = parameter1
        parameter1 = parameter2
        parameter2 = tem
    }
}

class GenericTypesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "泛型"
        self.view.backgroundColor = UIColor.white
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //泛型
        var num1 = 9
        var num2 = 10
        var str1 = "喜马拉雅"
        var str2 = "数数科技"
        let s = GTStudent()
//        s.swapFuncInt(num1: &num1, num2: &num2)
//        s.swapFuncString(str1: &str1, str2: &str2)
        s.swapFunc(parameter1: &num1, parameter2: &num2)
        s.swapFunc(parameter1: &str1, parameter2: &str2)
        print("num1:\(num1), num2:\(num2)")
        print("str1:\(str1), str2:\(str2)")
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
