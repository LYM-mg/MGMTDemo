//
//  LoginViewController.swift
//  QQZero
//
//  Created by i-Techsys.com on 2017/7/23.
//  Copyright © 2017年 i-Techsys. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func loginClick(_ sender: UIButton) {
        let homeVc = HomeViewController()
        let nav = UINavigationController(rootViewController: homeVc)
        homeVc.modalPresentationStyle = .fullScreen
        homeVc.modalTransitionStyle = .flipHorizontal
        
        self.present(nav, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

