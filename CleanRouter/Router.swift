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

typealias ControllerRoute = Route<UIViewController>

typealias FuncRoute = Route<Bool>

struct Route<T> {
    let url: String
    let invoker: Invoker<T>
}

public final class Router {
    
    private var routesMap = [String: ControllerRoute]()
    
    private var funcsMap = [String: FuncRoute]()
    
    public init() {}
    
    func register(route: ControllerRoute) {
        routesMap[route.url] = route
    }
    
    func route(url: String) -> Invoker<UIViewController>? {
        routesMap[url]?.invoker
    }
    
    func handle(route: FuncRoute) {
        funcsMap[route.url] = route
    }
    
    func perform(url: String) -> Invoker<Bool>? {
        funcsMap[url]?.invoker
    }
    
}

public extension Router {
    
    final func register(url: String, handler: @escaping (Context) -> UIViewController?) {
        register(route: Route(url: url, invoker: Invoker(handler: handler)))
    }
    
    final func route(url: String, parameters: [String: Any] = [:]) -> UIViewController? {
        route(url: url)?.invoke(with: Context(url: url, parameters: parameters))
    }
    
    final func handle(url: String, handler: @escaping (Context) -> Bool) {
        handle(route: Route(url: url, invoker: Invoker(handler: handler)))
    }
    
    final func perform(url: String, parameters: [String: Any] = [:]) -> Bool {
        perform(url: url)?.invoke(with: .init(url: url, parameters: parameters)) ?? false
    }
    
}
