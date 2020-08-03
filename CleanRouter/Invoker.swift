//
//  Invoker.swift
//  CleanRouter
//
//  email：chongyangfly@163.com
//  QQ：1909295866
//  github：https://github.com/wangcy90
//  blog：http://wangcy90.github.io
//
//  Created by WangChongyang on 2018/12/29.
//  Copyright © 2018 WangChongyang. All rights reserved.
//

import Foundation

struct Invoker {
    
    private let handler: (Context) -> UIViewController?
    
    init(handler: @escaping (Context) -> UIViewController?) {
        self.handler = handler
    }
    
    func invoke(with context: Context) -> UIViewController? {
        return handler(context)
    }
    
}
