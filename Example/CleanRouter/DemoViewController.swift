//
//  DemoViewController.swift
//  CleanRouter
//
//  email：chongyangfly@163.com
//  QQ：1909295866
//  github：https://github.com/wangcy90
//  blog：http://wangcy90.github.io
//
//  Created by WangChongyang on 2019/1/11.
//  Copyright © 2019 WangChongyang. All rights reserved.
//

import UIKit
import CleanRouter

struct DemoModule {
    
    func register() {
        
        CleanRouter.register(DemoRoutePath.test1) {
            let vc = DemoViewController()
            vc.title = $0.parameters["title"] as? String
            return vc
        }
        
        CleanRouter.register(DemoRoutePath.test2) {
            let vc = DemoViewController()
            vc.title = $0.parameters["title"] as? String
            return UINavigationController(rootViewController: vc)
        }
        
    }
    
}

class DemoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        if presentingViewController != nil {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(close))
        }
        // Do any additional setup after loading the view.
    }
    
    @objc
    private func close() {
        dismiss(animated: true)
    }
    
}
