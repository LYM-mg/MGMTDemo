//
//  MineViewController.swift
//  MGDS_Swift
//
//  Created by i-Techsys.com on 17/1/5.
//  Copyright © 2017年 i-Techsys. All rights reserved.
//

import UIKit

class MineViewController: UITableViewController {

    
    @IBOutlet weak var loginStatusLabel: UILabel!       // 登录状态
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.tableView.contentInset = UIEdgeInsets(top: MGNavHeight, left: 0, bottom: 0, right: 0)
    }
}


// MARK: - 代理
extension MineViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            myFavourite()
            break
        case 1:
            if indexPath.row == 0 {
                giveFace()
            }else if indexPath.row == 1 {
                giveSuggest()
            } else {
                setUpWiFi()
            }
        case 2:
            if indexPath.row == 0 {
                aboutDouShi()
            }else {
                shareToFriend()
            }
        case 3:
            aboutLogin()
        default:
            break
        }
    }
}

// MARK: - 方法封装
extension MineViewController {
    // MARK: 第1️⃣页
    /// 我的收藏
    fileprivate func myFavourite() {
        
    }

    // MARK: 第2️⃣页
    /// 给个笑脸,就是评价的意思
    fileprivate func giveFace() {  // itms-apps://
        let urlStr = "http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=\(appid)&pageNumber=0&sortOrdering=2&type=Purple+Software&mt=8"
        guard let url = URL(string: urlStr) else { return }
        if UIApplication.shared.canOpenURL(url){
             UIApplication.shared.openURL(url)
        }
    }
    /// 意见反馈
    fileprivate func giveSuggest() {
        
    }
    
    /// 设置WIFi
    fileprivate func  setUpWiFi() {
        guard let url = URL(string: "app-Prefs:root=WIFI") else {
            return
        }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.openURL(url)
        }
    }
    
    // MARK: 第3️⃣页
    /// 关于逗视
    fileprivate func aboutDouShi(){
        let QRCodeVC = QRCodeViewController()
        show(QRCodeVC, sender: self)
    }
    
    /// 盆友需要
    fileprivate func shareToFriend() {
        //  https://itunes.apple.com/cn/app/id1044917946
        let share = "https://github.com/LYM-mg"
        guard let url = URL(string: share) else { return }
        if UIApplication.shared.canOpenURL(url){
            UIApplication.shared.openURL(url)
        }
    }
    
    // MARK: 第4️⃣页
    /// 关于登录
    func aboutLogin() {
        //确定按钮
        let alertController = UIAlertController(title: "确定要退出吗？", message: "", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "取消", style: .cancel) { (action) in
        }
        
        let OKAction = UIAlertAction(title: "确定", style: .default) { (action) in
            self.loginStatusLabel.textColor = UIColor.green

            MGKeyWindow?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
            let transAnimation = CATransition()
            transAnimation.type = kCATransitionPush
            transAnimation.subtype = kCATransitionFromLeft
            transAnimation.duration = 0.5
            MGKeyWindow?.layer.add(transAnimation, forKey: nil)
        }
        alertController.addAction(cancelAction)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true) {
        }
    }
}
