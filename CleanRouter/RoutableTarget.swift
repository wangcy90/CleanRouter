//
//  RoutableTarget.swift
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

public struct RoutePath {
    
    public let value: String
    
    public init(_ value: String) {
        self.value = value
    }
    
}

public protocol RoutableTarget {
    
    var path: RoutePath { get }
    
    var parameters: [String: Any]? { get }
    
}

public extension RoutableTarget {
    
    var viewController: UIViewController? {
        return CleanRouter.route(self)
    }
    
    @discardableResult
    func push(animated: Bool = true) -> Bool {
        return CleanRouter.push(self, animated: animated)
    }
    
    @discardableResult
    func present(animated: Bool = true, completion: (() -> Void)? = nil) -> Bool {
        return CleanRouter.present(self, animated: animated, completion: completion)
    }
    
}
