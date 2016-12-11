//
//  ViewController.swift
//  LLButton
//
//  Created by leoliu on 2016/12/11.
//  Copyright © 2016年 LL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button: LLButton = LLButton(type: .custom)
        button.setImage(UIImage(named:"arraw_down"), for: .normal)
        button.setTitle("hello", for: .normal)
        button.setTitle(nil, for: .normal)
        button.frame = CGRect(x: 0, y: 64, width: 100, height: 44)
        view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

