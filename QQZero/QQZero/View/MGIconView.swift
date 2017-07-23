
//
//  MGIconView.swift
//  QQZero
//
//  Created by i-Techsys.com on 2017/7/23.
//  Copyright © 2017年 i-Techsys. All rights reserved.
//

import UIKit

class MGIconView: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.imageView?.contentMode = .center
        setImage(#imageLiteral(resourceName: "lufy"), for: .normal)
        setTitle("哈哈", for: .normal)
        self.imageView?.layer.cornerRadius = 10
        self.titleLabel?.textAlignment = .center
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // 屏幕方向管理者
        let MGOrient = UIApplication.shared.statusBarOrientation
        if (MGOrient.isLandscape) {
            self.imageView?.mg_y = 0;
            self.imageView?.mg_width = self.mg_width;
            self.imageView?.mg_height = self.mg_width;
            
            self.titleLabel?.isHidden = false;
            self.titleLabel?.mg_x = 0;
            self.titleLabel?.mg_y = self.imageView?.mg_height;
            self.titleLabel?.mg_width = self.mg_width;
            self.titleLabel?.mg_height = self.mg_height - (self.imageView?.mg_height)!;
        } else { // 竖屏
            self.titleLabel?.isHidden = true;
            self.imageView?.frame = self.bounds;
        }
    }
}
