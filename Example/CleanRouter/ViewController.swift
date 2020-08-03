//
//  ViewController.swift
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

struct DemoRoutePath {
    static let test1 = RoutePath("cl://test1")
    static let test2 = RoutePath("cl://test2")
}

enum DemoTarget {
    case test1(title: String)
    case test2(title: String)
}

extension DemoTarget: RoutableTarget {

    var path: RoutePath {
        switch self {
        case .test1:
            return DemoRoutePath.test1
        case .test2:
            return DemoRoutePath.test2
        }
    }

    var parameters: [String : Any]? {
        switch self {
        case .test1(let title), .test2(let title):
            return ["title": title]
        }
    }

}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func push(_ sender: Any) {
        DemoTarget.test1(title: "aaa").push()
    }
    
    @IBAction func present(_ sender: Any) {
        DemoTarget.test2(title: "aaa").present()
    }
    
}

