//
//  OptionalChainViewController.swift
//  SwiftBase
//
//  Created by 邓亚洲 on 2022/5/14.
//

import UIKit

// MARK: 可选链
//可选链作用：就是在多层级的可选类型的访问过程中，简化代码的结构,它可以直接判断出多层级的可选类型的访问是否有效
class OptionalCHero {
    var weapon: OptionalCWeapon?
}

class OptionalCWeapon {
    var name: String
    var skill: OptionalCSkill?
    init(name: String) {
        self.name = name
    }
}

class OptionalCSkill {
    var name: String
    init(name: String) {
        self.name = name
    }
}

// MARK: 可选链的作用
class OptionalCHero1 {
    var name: String
    init(name: String) {
        self.name = name
    }
    
    var weapon: OptionalCWeapon1?
}

class OptionalCWeapon1 {
    var name: String
    init(name: String) {
        self.name = name
    }
    
    var skills: [OptionalCSkill1] = [OptionalCSkill1]()
    subscript(i: Int) -> OptionalCSkill1 {
        get {
            return skills[i]
        }
        set {
            skills[i] = newValue
        }
    }
    
    var baseSkillName: String? {
        if skills.count > 0 {
            return self.skills[0].name
        } else {
            return nil
        }
    }
}

class OptionalCSkill1 {
    var name: String
    init(name: String) {
        self.name = name
    }
    
    func skillDese() -> String {
        print("这里是武器技能的描述，该技能的名字是\(name)")
        return "嘿嘿"
    }
    
    func descString() -> String? {
        return "\(name)技能的描述"
    }
}



class OptionalChainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "可选链"
        self.view.backgroundColor = UIColor.white
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let dance = OptionalCHero()
//        dance.weapon = OptionalCWeapon.init(name: "倚天剑")
//        dance.weapon?.skill = OptionalCSkill.init(name: "极地沙城暴")
        //可选绑定
//        if let weapon = dance.weapon {
//            if let skill = weapon.skill {
//                print("\(skill.name)")
//            }
//        }
        
        //可选链
//        if let skill = dance.weapon?.skill {
//            print("英雄的武器技能是\(skill.name)")
//        } else {
//            print("英雄没有武器技能")
//        }
//        print("英雄的武器技能是\(dance.weapon?.skill?.name ?? "没有技能")");
        
        
        
        //可选链的作用
        var dancer = OptionalCHero1(name: "dancer")
        var weapon = OptionalCWeapon1(name: "青龙偃月刀")
        var skill1 = OptionalCSkill1(name: "水淹七军")
        var skill2 = OptionalCSkill1(name: "威震华夏")
        weapon.skills.append(skill1)
        weapon.skills.append(skill2)
//        weapon[0] = skill1
//        weapon[1] = skill2
        dancer.weapon = weapon
        
        //使用可选链访问属性
        if let name = dancer.weapon?.baseSkillName {
            print("name:\(name)")
        } else {
            print("访问武器的基本技能名字失败")
        }
        
        //使用可选链访问方法
        if let myFunc = dancer.weapon?.skills[0].skillDese() {
            print("可选链访问方法成功 \(myFunc)")
        } else {
            print("可选链访问方法失败")
        }
        
        //使用可选链访问下标
        if let name = dancer.weapon?[0].name {
            print("下标法访问武器名字为\(name)")
        } else {
            print("下标法访问武器名字失败")
        }
        
        if let descStr = dancer.weapon?[0].descString() {
            print(descStr)
        } else {
            print("访问武器技能描述失败")
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
