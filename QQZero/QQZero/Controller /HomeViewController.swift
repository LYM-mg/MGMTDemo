//
//  HomeViewController.swift
//  QQZero
//
//  Created by i-Techsys.com on 2017/7/23.
//  Copyright © 2017年 i-Techsys. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    fileprivate lazy var dockView: MGDockView = { [unowned self] in
        let dock = MGDockView(frame: .zero)
        return dock
    }()
    /** 正在显示的子控制器 */
    var showingChildVc: UIViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpMainView()
        
        setUpNotification()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewWillTransition(to: MGScreenBounds.size, with: self.transitionCoordinator!)
    }
    
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        viewWillTransition(to: MGScreenBounds.size, with: coordinator)
    }
    
    /// size : 屏幕翻转后的新的尺寸;
    /// coordinator : 屏幕翻转过程中的一些信息,比如翻转时间等;
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        let orient = UIApplication.shared.statusBarOrientation
        if orient.isLandscape {
            self.dockView.mg_width = MGDockPW
            self.dockView.mg_height = size.height
        }else {
            self.dockView.mg_width = MGDockLW
            self.dockView.mg_height = size.height
        }
    }
}

// MARK: - setUpMainView
extension HomeViewController {
    fileprivate func setUpMainView() {
        self.view.backgroundColor = UIColor(r: 200, g: 200, b: 200)
        
        self.view.addSubview(dockView)
        // 初始化子控制器
        setupChildVcs()
    }
    
    /**
     *  初始化子控制器
     */
    fileprivate func setupChildVcs() {
        for _ in stride(from: 0, through: 2, by: 1) {
            let vc = UIViewController()
            self.addChildViewController(vc)
            vc.view.backgroundColor = UIColor.randomColor()
            
        }
        self.addChildViewController(MGWelcomeViewController())
        self.addChildViewController(MGWelcomeAVPlayerViewController())
        self.addChildViewController(SBTools.loadControllerFromSB("Mine"))
        switchChildVc(0)
    }
    
    /**
     *  切换子控制器
     *
     *  @param index 最新子控制器的索引
     */
    fileprivate func switchChildVc(_ index: Int) {
        // 切换子控制器
        // 移除当前正在显示的子控制器
        self.showingChildVc?.view.removeFromSuperview()
        
        // 显示index对应的子控制器
        let newChildVc = self.childViewControllers[index];
        self.view.addSubview(newChildVc.view)
        self.showingChildVc = newChildVc;
        self.showingChildVc!.view.snp.makeConstraints({ (make) in
            make.top.bottom.right.equalToSuperview()
            make.left.equalTo(self.dockView.snp.right)
        })
    }
    
    // 通知
    fileprivate func setUpNotification() {
        MGNotificationCenter.addObserver(self, selector: #selector(tabBarDidSelect(_:)), name: NSNotification.Name(MGTabBarDidSelectNotification), object: nil)
    }
    
    @objc fileprivate func tabBarDidSelect(_ noti: NSNotification) {
        guard let index: Int = noti.userInfo?[MGTabBarSelectIndex] as? Int else { return }
        switchChildVc(index)
    }
}
