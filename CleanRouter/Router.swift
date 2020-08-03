//
//  Router.swift
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

struct Route {
    let url: String
    let invoker: Invoker
}

public final class Router {
    
    private var routesMap = [String: Route]()
    
    public init() {}
    
    func register(route: Route) {
        routesMap[route.url] = route
    }
    
    func route(url: String) -> Invoker? {
        return routesMap[url]?.invoker
    }
    
}

public extension Router {
    
    final func register(url: String, handler: @escaping (Context) -> UIViewController?) {
        register(route: Route(url: url, invoker: Invoker(handler: handler)))
    }
    
    final func route(url: String, parameters: [String: Any] = [:]) -> UIViewController? {
        return route(url: url)?.invoke(with: Context(url: url, parameters: parameters))
    }
    
}
