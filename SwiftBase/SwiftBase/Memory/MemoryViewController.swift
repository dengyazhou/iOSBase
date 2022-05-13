//
//  MemoryViewController.swift
//  SwiftBase
//
//  Created by 邓亚洲 on 2022/5/13.
//

import UIKit

class MemoryGirlGod {
    var name: String
    init(name: String) {
        self.name = name
    }
    deinit {
        print("我和女神\(name)合好啦")
    }
}

class MemoryMan {
    var name: String
    init?(name: String) {
        self.name = name
    }
    
    var wife: MemoryWomen?
    
    deinit {
        print("男人被销毁了")
    }
}

class MemoryWomen {
    var name: String
    init(name: String) {
        self.name = name
    }
    
    //使用weak关键字，把默认的强引用修改成弱引用
    weak var busband: MemoryMan?
    
    deinit {
        print("女人被销毁了")
    }
}


class MemoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "内存管理"
        self.view.backgroundColor = UIColor.white
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //类是引用类型，所以只会释放一次
//        var g1: MemoryGirlGod? = MemoryGirlGod(name: "嘿嘿")
//        var g2 = g1
//        g1 = nil
//        g2 = nil
        
        var xiaoJun = MemoryMan(name: "小军")
        var liuTing: MemoryWomen? = MemoryWomen(name: "小红")
        xiaoJun?.wife = liuTing
        liuTing?.busband = xiaoJun
        xiaoJun = nil
        liuTing = nil
        
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
