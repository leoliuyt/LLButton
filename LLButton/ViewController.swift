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
        let button: LLButton = LLButton(type: LLButtonLayoutType.topBottom)
        button.setImage(UIImage(named:"image_select"), for: .normal)
        button.setTitle("he", for: .normal)
//        button.setTitle(nil, for: .normal)
//        button.setBackgroundImage(UIImage(named:"arraw_down"), for: .normal)
        button.frame = CGRect(x: 110, y: 64, width: 100, height: 44)
        button.backgroundColor = UIColor.orange
        view.addSubview(button)
        button.addTarget(self, action: #selector(buttonClick(sender:)), for: UIControlEvents.touchUpInside)
        
        
        let btn: UIButton = UIButton(type: .custom)
        btn.setImage(UIImage(named:"arraw_down"), for: .normal)
        btn.setTitle("hello world hello", for: .normal)
        //        button.setTitle(nil, for: .normal)
        //        button.setBackgroundImage(UIImage(named:"arraw_down"), for: .normal)
        btn.frame = CGRect(x: 110, y: 120, width: 100, height: 44)
        btn.backgroundColor = UIColor.orange
        view.addSubview(btn)

    }
    
    func buttonClick(sender: LLButton) {
        UIView.animate(withDuration: 0.3, animations:{
            if let imageView = sender.imageView {
                if imageView.transform.isIdentity {
                    imageView.transform = CGAffineTransform(rotationAngle: -(CGFloat)(M_PI))
                } else {
                    imageView.transform = CGAffineTransform(rotationAngle: 0)
                }
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

