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
        dock.backgroundColor = UIColor.red
        return dock
    }()
    /** 正在显示的子控制器 */
    var showingChildVc: UIViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpMainView()

//        viewWillTransition(to: MGScreenBounds.size, with: UIViewControllerTransitionCoordinator)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        viewWillTransition(to: MGScreenBounds.size, with: coordinator)
    }
    
    /// size : 屏幕翻转后的新的尺寸;
    /// coordinator : 屏幕翻转过程中的一些信息,比如翻转时间等;
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        let orient = UIApplication.shared.statusBarOrientation
        if orient.isLandscape {
            self.dockView.mg_width = MGDockPW
            self.dockView.mg_height = size.height
        }else {
            self.dockView.mg_width = MGDockLW
            self.dockView.mg_height = size.height
        }

        super.viewWillTransition(to: size, with: coordinator)
    }
}

// MARK: - setUpMainView
extension HomeViewController {
    fileprivate func setUpMainView() {
        self.view.backgroundColor = UIColor(r: 55, g: 55, b: 55)
        
        self.view.addSubview(dockView)
        // 初始化子控制器
//        setupChildVcs()
    }
    
    /**
     *  初始化子控制器
     */
    fileprivate func setupChildVcs() {
        for _ in stride(from: 0, through: 6, by: 1) {
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor.randomColor()
            self.addChildViewController(vc)
            self.view.addSubview(vc.view)
            vc.view.snp.makeConstraints({ (make) in
                make.top.bottom.right.equalToSuperview()
                make.left.equalTo(self.dockView.snp.right)
            })
        }
        switchChildVc(index: 0)
    }
    
    /**
     *  切换子控制器
     *
     *  @param index 最新子控制器的索引
     */
    fileprivate func switchChildVc(index: Int) {
        // 切换子控制器
        // 移除当前正在显示的子控制器
        self.showingChildVc?.view.removeFromSuperview()
        
        // 显示index对应的子控制器
        let newChildVc = self.childViewControllers[index];
        self.view.addSubview(newChildVc.view)
        self.showingChildVc = newChildVc;
    }
}
