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


    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(badgeBtn)
        rightBarButtonItem()

    }

    func  rightBarButtonItem()  {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 30))
        btn.backgroundColor = .orange

        let rightButton = BadgeBarButtonItem(customButton: btn)
        rightButton.badgeValue = "100";
        //        rightButton.badgeOriginX = 7;
        rightButton.badgeOriginY = -7;
        //        rightButton.badgeBGColor = .blue
        //        rightButton.badgeTextColor = .white
        //        rightButton.badgeFont = UIFont.systemFont(ofSize: 12)
        //        rightButton.badgePadding = 6
        //        rightButton.badgeMinSize = 5
        // Add it as the leftBarButtonItem of the navigation bar
        self.navigationItem.leftBarButtonItem = rightButton
    }




    @IBAction func changeAction(_ sender: UIButton) {
        switch sender.tag {
        case 0:
             badgeBtn.badgeValue = "120"
        case 1:
             badgeBtn.badgeBGColor = UIColor.orange
        case 2:
            badgeBtn.badgeTextColor = UIColor.red
        case 3:
            badgeBtn.badgeOriginX = 10
        case 4:
            badgeBtn.badgeOriginY = -8

        default:
            break
        }
    }


}

