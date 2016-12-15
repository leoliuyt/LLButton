//
//  ViewController.swift
//  LLButton
//
//  Created by leoliu on 2016/12/11.
//  Copyright © 2016年 LL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var llbtn: LLButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn0: LLButton = LLButton(type: LLButtonLayoutType.leftRight)
        btn0.setTitle("仅文本", for: .normal)
        btn0.backgroundColor = UIColor.orange
        btn0.frame = CGRect(x:15.0 , y: 64.0, width: 100.0, height: 44.0)
        btn0.titleLabel?.font = UIFont.systemFont(ofSize: 14);
        view.addSubview(btn0)
        btn0.addTarget(self, action: #selector(buttonClick(sender:)), for: UIControlEvents.touchUpInside)
        
        let btn1: LLButton = LLButton(type: LLButtonLayoutType.leftRight)
        btn1.setImage(UIImage(named:"image_select"), for: .normal)
        btn1.backgroundColor = UIColor.orange
        btn1.frame = CGRect(x:15.0 , y: btn0.frame.maxY + 10.0, width: 100.0, height: 44.0)
        view.addSubview(btn1)
        btn1.addTarget(self, action: #selector(buttonClick(sender:)), for: UIControlEvents.touchUpInside)
        
        let btn2: LLButton = LLButton(type: LLButtonLayoutType.leftRight)
        btn2.setImage(UIImage(named:"arraw_down"), for: .normal)
        btn2.setTitle("左图右文", for: .normal)
        btn2.backgroundColor = UIColor.orange
        btn2.frame = CGRect(x:15.0 , y: btn1.frame.maxY + 10.0, width: 100.0, height: 44.0)
        btn2.titleLabel?.font = UIFont.systemFont(ofSize: 14);
        view.addSubview(btn2)
        btn2.addTarget(self, action: #selector(buttonClick(sender:)), for: UIControlEvents.touchUpInside)
        
        let btn3: LLButton = LLButton(type: LLButtonLayoutType.rightLeft)
        
        btn3.setImage(UIImage(named:"arraw_down"), for: .normal)
        btn3.setTitle("右图左文", for: .normal)
        btn3.backgroundColor = UIColor.orange
        btn3.frame = CGRect(x:15.0 , y: btn2.frame.maxY + 10.0, width: 100.0, height: 44.0)
        btn3.titleLabel?.font = UIFont.systemFont(ofSize: 14);
        view.addSubview(btn3)
        btn3.addTarget(self, action: #selector(buttonClick(sender:)), for: UIControlEvents.touchUpInside)
        
        let btn4: LLButton = LLButton(type: LLButtonLayoutType.topBottom)
        btn4.setImage(UIImage(named:"image_select"), for: .normal)
        btn4.setTitle("上图下文", for: .normal)
        btn4.backgroundColor = UIColor.orange
        btn4.frame = CGRect(x:15.0 , y: btn3.frame.maxY + 10.0, width: 100.0, height: 100.0)
        btn4.titleLabel?.font = UIFont.systemFont(ofSize: 14);
        view.addSubview(btn4)
        btn4.addTarget(self, action: #selector(buttonClick(sender:)), for: UIControlEvents.touchUpInside)
        
        let btn5: LLButton = LLButton(type: LLButtonLayoutType.bottomTop)
        btn5.setImage(UIImage(named:"image_select"), for: .normal)
        btn5.setTitle("下图上文", for: .normal)
        btn5.backgroundColor = UIColor.orange
        btn5.frame = CGRect(x:15.0 , y: btn4.frame.maxY + 10.0, width: 100.0, height: 100.0)
        btn5.titleLabel?.font = UIFont.systemFont(ofSize: 14);
        view.addSubview(btn5)
        btn5.addTarget(self, action: #selector(buttonClick(sender:)), for: UIControlEvents.touchUpInside)
        
        
        //auto layout
        let btn6: LLButton = LLButton(type: LLButtonLayoutType.rightLeft)
        btn6.setImage(UIImage(named:"image_select"), for: .normal)
        btn6.setTitle("下图上文", for: .normal)
        btn6.backgroundColor = UIColor.orange
        btn6.titleLabel?.font = UIFont.systemFont(ofSize: 14);
        view.addSubview(btn6)
        btn6.addTarget(self, action: #selector(buttonClick(sender:)), for: UIControlEvents.touchUpInside)
        
        btn6.translatesAutoresizingMaskIntoConstraints = false
        let rightConstraint = NSLayoutConstraint.init(item: btn6, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -15.0)
        view.addConstraint(rightConstraint)
        
        let topConstraint = NSLayoutConstraint.init(item: btn6, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 64.0)
        view.addConstraint(topConstraint)
        
        
        let btn7: LLButton = LLButton(type: LLButtonLayoutType.rightLeft)
        btn7.setImage(UIImage(named:"image_select"), for: .normal)
        btn7.setTitle("下图上文", for: .normal)
        btn7.backgroundColor = UIColor.orange
        btn7.titleLabel?.font = UIFont.systemFont(ofSize: 14);
        view.addSubview(btn7)
        btn7.addTarget(self, action: #selector(buttonClick(sender:)), for: UIControlEvents.touchUpInside)
        
        btn7.translatesAutoresizingMaskIntoConstraints = false
        let rightConstraint1 = NSLayoutConstraint.init(item: btn7, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -15.0)
        view.addConstraint(rightConstraint1)
        
        let topConstraint1 = NSLayoutConstraint.init(item: btn7, attribute: .top, relatedBy: .equal, toItem: btn6, attribute: .bottom, multiplier: 1, constant: 10)
        view.addConstraint(topConstraint1)
        let widthConstraint = NSLayoutConstraint(item: btn7, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0, constant: 100)
        btn7.addConstraint(widthConstraint)
        let heigthConstraint = NSLayoutConstraint(item: btn7, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0, constant: 60)
        btn7.addConstraint(heigthConstraint)
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

