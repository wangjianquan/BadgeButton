//
//  ViewController.swift
//  BadgeButton
//
//  Created by aixuexue on 2018/12/28.
//  Copyright © 2018 白小嘿. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var badgeBtn: UIButton = {
        let badgeBtn = UIButton(frame: CGRect(x: 50, y: 200, width: 88, height: 35))
        badgeBtn.setTitle("角标", for: .normal)
        badgeBtn.setTitleColor(.black, for: .normal)
        badgeBtn.badgeValue = "66"
        badgeBtn.backgroundColor = UIColor.lightGray
        return badgeBtn
    }()


    lazy var rightButton: BadgeBarButtonItem = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 30))
        btn.backgroundColor = .orange
        btn.setImage(UIImage(named: "message"), for: .normal)
        let rightButton = BadgeBarButtonItem(customButton: btn)
        rightButton.badgeValue = "10";
        rightButton.badgeOriginX = 35-10;
        rightButton.badgeOriginY = -8;
        return rightButton
    }()
    
    lazy var leftButton: BadgeBarButtonItem = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 30))
        btn.backgroundColor = .orange
        btn.setImage(UIImage(named: "message1"), for: .normal)
        let barItem = BadgeBarButtonItem(customButton: btn)
        barItem.badgeValue = "100";
        barItem.badgeOriginX = 500;//最大X测试
        barItem.badgeOriginY = 500;//最大Y测试
        return barItem
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(badgeBtn)
        self.navigationItem.leftBarButtonItem = leftButton
        self.navigationItem.rightBarButtonItem = rightButton

    }






    @IBAction func changeAction(_ sender: UIButton) {

        switch sender.tag {
        case 0:
             badgeBtn.badgeValue = "\(arc4random_uniform(20000))"
             rightButton.badgeValue = "\(arc4random_uniform(230))"
        case 1:
             badgeBtn.badgeBGColor = UIColor.randomColor
             rightButton.badgeBGColor = UIColor.randomColor
        case 2:
            badgeBtn.badgeTextColor = UIColor.randomColor
            rightButton.badgeTextColor = UIColor.randomColor
        case 3:
            badgeBtn.badgeOriginX = CGFloat(Int(arc4random_uniform(240)))
            rightButton.badgeOriginX = CGFloat(Int(arc4random_uniform(100)))
        case 4:
            badgeBtn.badgeOriginY = CGFloat(Int(arc4random_uniform(240)))
            rightButton.badgeOriginY = CGFloat(Int(arc4random_uniform(100)))

        default:
            break
        }
    }


}

