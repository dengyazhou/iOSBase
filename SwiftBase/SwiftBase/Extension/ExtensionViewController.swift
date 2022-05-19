//
//  ExtensionViewController.swift
//  SwiftBase
//
//  Created by 邓亚洲 on 2022/5/19.
//

import UIKit

/*
 Swift里面所有类型都是结构体实现的 除了class之外
 */
extension Int {
    var k: Int {
        return self * 1000
    }
}

struct ExtPoint {
    var x = 0.0, y = 0.0
}
struct ExtSize {
    var width = 0.0, height = 0.0
}
struct ExtRect {
    var origin: ExtPoint = ExtPoint()
    var size: ExtSize = ExtSize()
}

extension ExtRect {
    //派生一个构造函数
    init(center: ExtPoint, size: ExtSize) {
        let originX = center.x - size.width/2.0
        let originY = center.y - size.height/2.0
        
//        self.origin = ExtPoint(x: originX, y: originY)
//        self.size = size
        
        let origin = ExtPoint(x: originX, y: originY)
        //使用原类型的构造方法来初始化
        self.init(origin: origin, size: size)
    }
    
    //派生一个方法
    func showMessage() {
        print("origin:\(origin) size:\(size)")
    }
}

extension Character {
    enum Kind {
        case Wowel, Consonant, Other
    }
    
    var kind: Kind {
        switch self.lowercased() {
        case "a", "e", "i", "o", "u":
            return .Wowel
        case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
            return .Consonant
        default:
            return .Other
        }
    }
}

class ExtensionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Extension 扩展"
        self.view.backgroundColor = UIColor.white
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let money = 10.k
        print(money)
        
        let myPoint = ExtPoint(x: 100.0, y: 100.0)
        let mySize = ExtSize(width: 100.0, height: 100.0)
        
        let myRect = ExtRect(center: myPoint, size: mySize)
        myRect.showMessage()
        
        printLetterKind(word: "abcd")
    }
    
    func printLetterKind(word: String) {
        print("\(word) 拆解如下")
        for charater in word {
            switch charater.kind {
            case .Wowel:
                print("Wowel")
            case .Consonant:
                print("Consonant")
            case .Other:
                print("Other")
            }
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
