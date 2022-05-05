//
//  ClosuresViewController.swift
//  SwiftBase
//
//  Created by 邓亚洲 on 2022/5/5.
//

import UIKit

class ClosuresViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "闭包"
        self.view.backgroundColor = UIColor.white
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //MARK: 闭包 {}
        //闭包的基本形式
//        {(参数列表)->返回值类型 in
//            语句
//        }
        
        //MARK: 1、尾随闭包
        //函数调用时，如果函数传递（参数）闭包作为最后一个参数，（参数）闭包不写在函数的（）中。
        
        //MARK: 2、逃逸闭包
        //@escaping
        //函数传递进去的（参数）闭包，不在本函数中调用，在本函数外部调用
        
        //MARK: 3、自动闭包
        //@autoclosure
        //函数调用时，函数传递（参数）闭包处，不在传递闭包，而是传递闭包的返回值
//        var customersInLine = ["iOS","OC","Swift","C++","C","Java"]
//        print(customersInLine.count)
//
//        let customerProvider = {
//            customersInLine.remove(at: 0)
//        }
//        serve(customer: customerProvider)
//        serve1(customer: "abc")
    }
    
    func serve(customer customerProvider: ()->String) {
        
    }
    func serve1(customer customerProvider: @autoclosure ()->String) {
        print(customerProvider())
        
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
