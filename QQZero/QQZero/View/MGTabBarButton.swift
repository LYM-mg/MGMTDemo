//
//  MGTabBarButton.swift
//  QQZero
//
//  Created by i-Techsys.com on 2017/7/23.
//  Copyright © 2017年 i-Techsys. All rights reserved.
//

import UIKit

class MGTabBarButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.imageView?.contentMode = .center
        self.setBackgroundImage(#imageLiteral(resourceName: "tabbar_separate_selected_bg"), for: .highlighted)
        self.adjustsImageWhenDisabled = false
        self.adjustsImageWhenHighlighted = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isHighlighted: Bool {
        get {
            return super.isHighlighted
        }set {
            
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // 屏幕方向管理者
        let MGOrient = UIApplication.shared.statusBarOrientation
        if (MGOrient.isLandscape) {
            self.imageView?.mg_height = self.mg_height
            self.imageView?.mg_width = self.mg_width * 0.4
            self.imageView?.mg_x = 0
            self.imageView?.mg_y = 0
            
            self.titleLabel?.isHidden = false
            self.titleLabel?.mg_y = 0
            self.titleLabel?.mg_x = self.imageView?.mg_width
            self.titleLabel?.mg_width = self.mg_width - (self.imageView?.mg_width)!
            self.titleLabel?.mg_height = self.mg_height
        } else {
            self.titleLabel?.isHidden = true
            // 如果设置宽度或者高度为0,某个控件还是会显示一部分, 可以尝试设置控件的mg_width或者mg_height为负数
            //        self.titleLabel.frame = CGRectMake(0, 0, -1, 0)
            self.imageView?.frame = self.bounds
        }
    }

}
