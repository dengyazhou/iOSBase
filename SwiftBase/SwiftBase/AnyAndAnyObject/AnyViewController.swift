//
//  AnyViewController.swift
//  SwiftBase
//
//  Created by 邓亚洲 on 2022/5/17.
//

import UIKit
class AnyStudent {
    var name: String
    init(name: String) {
        self.name = name
    }
    func study() {
        print("学生在学习")
    }
}

class AnyTeacher {
    var name: String
    init(name: String) {
        self.name = name
    }
    func teachEnglish() {
        print("老师在讲英语")
    }
}

class AnyLeader {
    var name: String
    init(name: String) {
        self.name = name
    }
    func haveMeeting() {
        print("领导在开会")
    }
    
}

class AnyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Any && AnyObject"
        self.view.backgroundColor = UIColor.white
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        var peoples = [AnyObject]()
        let s1 = AnyStudent(name: "dancer")
        let t1 = AnyTeacher(name: "叶问")
        let l1 = AnyLeader(name: "Jobs")
        peoples.append(s1)
        peoples.append(t1)
        peoples.append(l1)
        
        for value in peoples {
            if let student = value as? AnyStudent {
                student.study()
            } else if let teacher = value as? AnyTeacher {
                teacher.teachEnglish()
            } else if let leader = value as? AnyLeader {
                leader.haveMeeting()
            }
        }
        
        var things = [Any]()
        things.append(1)
        things.append("dancer")
        things.append(3.14)
        things.append(s1)
        for value in things {
            print(value)
        }
        
        var thing: AnyObject = AnyStudent(name: "诗诗")
        let s2 = thing as? AnyStudent
        s2?.study()
        let s3 = thing as! AnyStudent
        s3.study()
        
        var array: [AnyObject]!
        var array1: [Any]!
//        array1 = [Any]()
//        array1.append("hello")
        
        var dic: [AnyHashable : AnyObject]!
        var dic1: [AnyHashable : Any]!
        dic1 = Dictionary()
        dic1.updateValue(1, forKey: "key1")
        print(dic1)
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
