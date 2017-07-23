//
//  MGDockView.swift
//  QQZero
//
//  Created by i-Techsys.com on 2017/7/23.
//  Copyright © 2017年 i-Techsys. All rights reserved.
//

import UIKit

class MGDockView: UIView {
    
    fileprivate lazy var iconView: MGIconView = MGIconView()
    fileprivate lazy var tabBar: MGTabBar = MGTabBar()
    fileprivate lazy var toolBar: MGToolBar = MGToolBar()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setUpUI() {
        // 1.头像
        addSubview(iconView)
        
        // 2.tabBar
        addSubview(tabBar)
        
        // 3.toolbar
        addSubview(toolBar)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let count = CGFloat(self.toolBar.subviews.count)
        self.toolBar.mg_width = self.mg_width;
        self.tabBar.mg_width = self.mg_width;
        self.tabBar.mg_height = count * MGDockPW;
        // 屏幕方向管理者
        let MGOrient = UIApplication.shared.statusBarOrientation
        if MGOrient.isLandscape {
            self.toolBar.mg_height = self.mg_width / count
            
            self.iconView.mg_width = self.mg_width * 0.4;
            self.iconView.mg_height = self.iconView.mg_width + 40;
            self.iconView.mg_x = (self.mg_width - self.iconView.mg_width) * 0.5;
            self.iconView.mg_y = 70;
        }else {
            self.toolBar.mg_height = self.mg_width * count
            
            self.iconView.mg_x = 5;
            self.iconView.mg_y = 50;
            self.iconView.mg_width = self.mg_width - 2 * self.iconView.mg_x;
            self.iconView.mg_height = self.iconView.mg_width;
        }
        self.toolBar.mg_y = self.mg_height - self.toolBar.mg_height;
        self.tabBar.mg_y = self.toolBar.mg_y - self.tabBar.mg_height;
    }
}
