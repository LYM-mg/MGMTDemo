//
//  MGTabBar.swift
//  QQZero
//
//  Created by i-Techsys.com on 2017/7/23.
//  Copyright © 2017年 i-Techsys. All rights reserved.
//

import UIKit

enum MGTabBarButtonType: Int {
    case index1=0,index2,index3,index4,index5,index6
}

class MGTabBar: UIView {

    lazy var selelctedButton: MGTabBarButton = MGTabBarButton()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setUpUI() {
        // 1.设置按钮
        let firstButton = setupButton(#imageLiteral(resourceName: "tab_bar_friend_icon"),"好友",.index1)
        firstButton.isEnabled = false
        self.selelctedButton = firstButton
        let _ = setupButton(#imageLiteral(resourceName: "tab_bar_feed_icon"),"空间",.index2)
        let _ = setupButton(#imageLiteral(resourceName: "tab_bar_passive_feed_icon"),"@",.index3)
        let _ = setupButton(#imageLiteral(resourceName: "tab_bar_e_album_icon"),"相册",.index4)
        let _ = setupButton(#imageLiteral(resourceName: "tab_bar_pic_wall_icon"),"拍照",.index5)
        let _ = setupButton(#imageLiteral(resourceName: "tab_bar_e_more_icon"),"更多",.index6)
    }
    
    fileprivate func setupButton(_ image: UIImage,_ title: String,_ type: MGTabBarButtonType) -> MGTabBarButton{
        let btn = MGTabBarButton()
        btn.setImage(image, for: .normal)
        btn.setTitle(title, for: .normal)
        btn.tag = type.rawValue
        addSubview(btn)
        btn.addTarget(self, action: #selector(btnClick(_:)), for: .touchDown)
        return btn
    }
    
    @objc fileprivate func btnClick(_ btn: MGTabBarButton) {
        self.selelctedButton.isEnabled = true;
        btn.isEnabled = false;    // button进入highlighted\disabled,图标默认会变灰
        self.selelctedButton = btn;
        
        // 发出通知
        MGNotificationCenter.post(name: NSNotification.Name(MGTabBarDidSelectNotification), object: nil, userInfo: [MGTabBarSelectIndex: btn.tag])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let count: CGFloat = CGFloat(self.subviews.count)
 
        for (i,btn) in self.subviews.enumerated() {
            btn.mg_height = self.mg_height/count
            btn.mg_width = self.mg_width
            btn.mg_x = 0
            btn.mg_y = btn.mg_height * CGFloat(i)
        }
    }
}
