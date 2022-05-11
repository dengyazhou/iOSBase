//
//  PolymorphicViewController.swift
//  SwiftBase
//
//  Created by 邓亚洲 on 2022/5/11.
//

import UIKit

class PolymorphicAnimal {
    var name: String!
    func bark() {
        print("奇怪的动物叫声")
    }
}

class PolymorphicDog: PolymorphicAnimal {
    override func bark() {
        print("旺旺")
    }
}

class PolymorphicCat: PolymorphicAnimal {
    override func bark() {
        print("喵喵")
    }
}

class PolymorphicHunter {
    var name: String?
    func huntAnimal(animal: PolymorphicAnimal) {
        print("\(name ?? "默认猎人") 向一只小动物\(animal.name ?? "默认动物") 开了一枪")
        animal.bark()
    }
}

class PolymorphicViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "多态"
        self.view.backgroundColor = UIColor.white
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let hunter = PolymorphicHunter()
        hunter.name = "刀疤小宝"
        
        let wc = PolymorphicDog()
        wc.name = "旺财"
        hunter.huntAnimal(animal: wc)
        
        let dx = PolymorphicCat()
        dx.name = "黛西"
        hunter.huntAnimal(animal: dx)
        
        let animal = PolymorphicAnimal()
        animal.name = "小动物"
        hunter.huntAnimal(animal: animal)
        
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
