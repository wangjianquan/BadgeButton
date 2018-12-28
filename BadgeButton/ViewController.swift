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
        let badgeBtn = UIButton(frame: CGRect(x: 50, y: 300, width: 88, height: 35))
        badgeBtn.setTitle("角标", for: .normal)
        badgeBtn.setTitleColor(.black, for: .normal)
        badgeBtn.badgeValue = "2"
        badgeBtn.backgroundColor = UIColor.groupTableViewBackground
        return badgeBtn
    }()


    lazy var rightButton: BadgeBarButtonItem = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 30))
        btn.backgroundColor = .orange
        let rightButton = BadgeBarButtonItem(customButton: btn)
        rightButton.badgeValue = "100";
        return rightButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(badgeBtn)
        self.navigationItem.leftBarButtonItem = rightButton

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
            badgeBtn.badgeOriginX = CGFloat(Int(arc4random_uniform(90)) + -8)
            rightButton.badgeOriginX = CGFloat(Int(arc4random_uniform(40)) + 1)
        case 4:
            badgeBtn.badgeOriginY = CGFloat(Int(arc4random_uniform(40)) + -15)
            rightButton.badgeOriginY = CGFloat(Int(arc4random_uniform(40)) + -5)

        default:
            break
        }
    }


}

