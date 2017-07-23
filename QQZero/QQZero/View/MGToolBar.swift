//
//  MGToolBar.swift
//  QQZero
//
//  Created by i-Techsys.com on 2017/7/23.
//  Copyright © 2017年 i-Techsys. All rights reserved.
//

import UIKit

class MGToolBar: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setUpUI() {
        // 1.设置按钮
        setupButton(image: #imageLiteral(resourceName: "tabbar_photo"))
        setupButton(image: #imageLiteral(resourceName: "tabbar_mood"))
        setupButton(image: #imageLiteral(resourceName: "tabbar_blog"))
    }
    
    fileprivate func setupButton(image: UIImage) {
        let btn = UIButton()
        btn.setImage(image, for: .normal)
        btn.setBackgroundImage(#imageLiteral(resourceName: "tabbar_separate_selected_bg"), for: .highlighted)
        addSubview(btn)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let count: CGFloat = CGFloat(self.subviews.count)
        // 屏幕方向管理者
        let MGOrient = UIApplication.shared.statusBarOrientation
        if (MGOrient.isLandscape) { // 横屏
            for (i,btn) in self.subviews.enumerated() {
                btn.mg_height = self.mg_height;
                btn.mg_width = self.mg_width / count;
                btn.mg_y = 0;
                btn.mg_x = btn.mg_width * CGFloat(i)
            }
        } else {
             for (i,btn) in self.subviews.enumerated() {
                btn.mg_width = self.mg_width;
                btn.mg_height = self.mg_height / count;
                btn.mg_x = 0;
                btn.mg_y = btn.mg_height * CGFloat(i)
            }
        }
    }
}
