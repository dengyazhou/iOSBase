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

// MARK: weak弱应用
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

// MARK: 无主引用
class MemoryTeacher {
    var name: String
    var student: MemoryStudent?
    
    init?(name: String) {
        self.name = name
    }
    
    deinit {
        print("Teacher \(name) 被销毁了")
    }
}

class MemoryStudent {
    var name: String
    //声明一个无主引用
    unowned var teacher: MemoryTeacher?
    
    init(name: String, teacher: MemoryTeacher?) {
        self.name = name
        self.teacher = teacher
    }
    
    deinit {
        print("Student \(name) 被销毁了")
    }
}

// MARK: 捕获列表
/*
 1.捕获列表解决的问题是什么？
 2.捕获列表的结构是怎样的？
 [捕获列表类型 捕获对象] in
    1）.捕获列表的类型 weak unowned
    2）.捕获对象 就是可能跟闭包产生循环应用的那个对象
 
 3.使用的地方？
 在闭包的开始部分
 
 4.捕获列表不局限一个实例的捕获。可以是多个实例的捕获，中间使用逗号隔开
 */
class MemoryHTTPURL {
    var hostString: String
    var pathString: String?
    
    init?(hostString: String, pathString: String?) {
        self.hostString = hostString
        self.pathString = pathString
    }
    
    //类型为闭包的计算属性
    lazy var url: ()->String = {
        //解决了循环引用的问题
        [unowned self] in
        //可选绑定
        if let path = self.pathString {
            return "http://\(self.hostString)/\(self.pathString!)"
        } else {
            return "http://\(self.hostString)"
        }
    }
    
    deinit {
        print("url实例被释放了")
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
        
        //使用weak关键字，把默认的强引用修改成弱引用
//        var xiaoJun = MemoryMan(name: "小军")
//        var liuTing: MemoryWomen? = MemoryWomen(name: "小红")
//        xiaoJun?.wife = liuTing
//        liuTing?.busband = xiaoJun
//        xiaoJun = nil
//        liuTing = nil
        
        //无主引用
//        var yeWen = MemoryTeacher(name: "叶问")
//        var xiaoLong: MemoryStudent? = MemoryStudent(name: "李小龙", teacher: yeWen)
//        yeWen?.student = xiaoLong
//        yeWen = nil
//        xiaoLong = nil
        
        //捕获列表
        var dataUrl = MemoryHTTPURL(hostString: "www.baidu.com", pathString: "shishi.png")
        let urlFunc = dataUrl?.url
        
        let urlString = urlFunc!()
        print("urlString:\(urlString)")
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
