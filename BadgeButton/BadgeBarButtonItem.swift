//
//  BadgeBarButtonItem.swift
//  CustomControls
//
//  Created by 白小嘿 on 2018/12/28.
//  Copyright © 2018 WJQ. All rights reserved.
//

import UIKit

class BadgeBarButtonItem: UIBarButtonItem {

    fileprivate  var badgeLabel: UILabel?


    /**
     * Badge background color
    */
    var badgeBGColor: UIColor  = .red {
        didSet{
            if self.badgeLabel != nil {
                badgeLabel?.backgroundColor  = self.badgeBGColor
            }
        }
    }
    
    /**
    * Badge text color
    */
    var badgeTextColor: UIColor = .white {
        didSet{
            if self.badgeLabel != nil {
                badgeLabel?.textColor = self.badgeTextColor
            }
        }
    }
    
    /**
    * Badge font
    */
    var badgeFont: UIFont = UIFont.systemFont(ofSize: 10){
        didSet{
            if self.badgeLabel != nil {
                badgeLabel?.font  = self.badgeFont
            }
        }
    }
    
    /**
    *  Padding value for the badge
    */
    var badgePadding: CGFloat = 6 {
        didSet{
            if self.badgeLabel != nil {
                updateBadgeFrame()
            }
        }
    }
    
    /**
    * badgeMinSize
    */
    var badgeMinSize: CGFloat = 8 {
        didSet{
            if self.badgeLabel != nil {
                updateBadgeFrame()
            }
        }
    }
    
    /**
    *  badgeLabel OriginX
    */
    var badgeOriginX: CGFloat = 0 {
        didSet{
            if self.badgeLabel != nil {
                updateBadgeFrame()
            }
        }
    }
    /**
    * badgeLabel OriginY
    */
    var badgeOriginY: CGFloat = -4 {
        didSet{
            if self.badgeLabel != nil {
                updateBadgeFrame()
            }
        }
    }
    
    fileprivate var shouldHideBadgeAtZero = true
    fileprivate var shouldAnimateBadge = true

    var badgeValue: String? = "" {
        didSet{
            if (badgeValue?.isEmpty)!   || (badgeValue == "") || ((badgeValue == "0") && shouldHideBadgeAtZero) {
                removeBadge()
            } else if (self.badgeLabel == nil ) {
                self.badgeLabel  = UILabel(frame: CGRect(x: self.badgeOriginX , y: self.badgeOriginY, width: 20, height: 20))
                self.badgeLabel?.font = self.badgeFont
                self.badgeLabel?.textAlignment = .center
                self.badgeLabel?.textColor = self.badgeTextColor
                self.badgeLabel?.backgroundColor = self.badgeBGColor
                initializer()
                self.customView?.addSubview(self.badgeLabel!)
                updateBadgeValue(animated: false)
            } else {
                updateBadgeValue(animated: true)
            }
        }
    }

    convenience init(customButton: UIButton)  {
        self.init(customView: customButton)
    }

    fileprivate func initializer() {
        self.badgeBGColor = .red
        self.badgeTextColor = .white
        self.badgeFont = UIFont.systemFont(ofSize: 12.0)
        self.badgePadding = 6
        self.badgeMinSize = 8
        if let label = self.badgeLabel {
            if let customView = self.customView {
                self.badgeOriginX  = customView.frame.size.width  - label.frame.size.width/2
            }
        }
        self.badgeOriginY = -4
        self.shouldHideBadgeAtZero = true
        self.shouldAnimateBadge = true
        customView?.clipsToBounds = false
    }
    
    fileprivate func removeBadge() {
        UIView.animate(withDuration: 0.2, animations: {
            self.badgeLabel?.transform = CGAffineTransform.init(scaleX: 0, y: 0)
        }) { (finished: Bool) in
            self.badgeLabel?.removeFromSuperview()
            if (self.badgeLabel != nil) { self.badgeLabel = nil }
        }
    }

    fileprivate func updateBadgeValue(animated: Bool) {
        if animated && self.shouldAnimateBadge && !(self.badgeLabel?.text == self.badgeValue) {
            let animation = CABasicAnimation(keyPath: "transform.scale")
            animation.fromValue = 1.5
            animation.toValue = 1
            animation.duration = 0.2
            animation.timingFunction = CAMediaTimingFunction(controlPoints: 0.4, 1.3, 1.0, 1.0)
            self.badgeLabel?.layer.add(animation, forKey: "bounceAnimation")
        }

        var badgeValue = 0
        if let badgeStr = self.badgeValue , let value = Int(badgeStr) {
            badgeValue = value
        }
        self.badgeLabel?.text = badgeValue >= 99 ? "99+" : self.badgeValue
        let duration: TimeInterval = (animated && self.shouldAnimateBadge) ? 0.2 : 0
        UIView.animate(withDuration: duration, animations: {
            self.updateBadgeFrame()
        })
    }

    fileprivate  func updateBadgeFrame() {
        let expectedLabelSize: CGSize = badgeExpectedSize()
        var minHeight: CGFloat = expectedLabelSize.height
        minHeight = (minHeight < self.badgeMinSize) ? self.badgeMinSize : expectedLabelSize.height

        var minWidth: CGFloat = expectedLabelSize.width
        let padding = self.badgePadding
        minWidth = (minWidth < minHeight) ? minHeight : expectedLabelSize.width

        let badgeWidth = minWidth + padding
        let badgeHeight = minHeight + padding
        if self.badgeLabel != nil {
            if let customView = self.customView {
                if self.badgeOriginX > customView.frame.size.width {
                    self.badgeOriginX = customView.frame.size.width - badgeWidth/2
                }
                if self.badgeOriginY > customView.frame.size.height {
                    self.badgeOriginY = customView.frame.size.height - badgeHeight/2
                }

                self.badgeLabel?.frame = CGRect(x: self.badgeOriginX, y: self.badgeOriginY, width: badgeWidth, height: badgeHeight)
                self.badgeLabel?.layer.cornerRadius = badgeHeight / 2
                self.badgeLabel?.layer.masksToBounds = true
            }
        }
    }
    

    fileprivate func badgeExpectedSize() -> CGSize {
        let frameLabel: UILabel = duplicate(self.badgeLabel)
        frameLabel.sizeToFit()
        let expectedLabelSize: CGSize = frameLabel.frame.size
        return expectedLabelSize
    }

    fileprivate func duplicate(_ labelToCopy: UILabel? ) -> UILabel {
        guard let temp = labelToCopy else { fatalError("xxxx") }
        let duplicateLabel = UILabel(frame: temp.frame )
        duplicateLabel.text = temp.text
        duplicateLabel.font = temp.font
        return duplicateLabel
    }

}
