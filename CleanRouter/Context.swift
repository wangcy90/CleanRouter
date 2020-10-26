//
//  Context.swift
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

public struct Context {
    
    public let url: String
    
    public let parameters: [String: Any]
    
    public init(url: String, parameters: [String: Any] = [:]) {
        self.url = url
        self.parameters = parameters
    }
    
}

extension Context: CustomStringConvertible {
    
    public var description: String {
        return "url = \(url)\nparameters = \(parameters.description)"
    }
    
}
