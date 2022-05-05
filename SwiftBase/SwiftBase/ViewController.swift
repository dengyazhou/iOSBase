//
//  ViewController.swift
//  SwiftBase
//
//  Created by 邓亚洲 on 2022/5/4.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("\(#file):\(#line):\(#function)");
        
        self.title = "第一个页面"
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let vc = HomeViewController.init()
        self.navigationController?.pushViewController(vc, animated: true);
    }


}

