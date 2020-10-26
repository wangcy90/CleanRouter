//
//  CleanRouter.swift
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

public final class CleanRouter {
    
    private static let router = Router()
    
    private init() {}
    
}

public extension CleanRouter {
    
    static func register(_ path: RoutePath, handler: @escaping (Context) -> UIViewController?) {
        router.register(url: path.value, handler: handler)
    }
    
    static func route(_ target: RoutableTarget) -> UIViewController? {
        router.route(url: target.path.value, parameters: target.parameters ?? [:])
    }
    
    static func handle(_ path: RoutePath, handler: @escaping (Context) -> Bool) {
        router.handle(url: path.value, handler: handler)
    }
    
    static func perform(_ target: RoutableTarget) -> Bool {
        router.perform(url: target.path.value, parameters: target.parameters ?? [:])
    }
    
    @discardableResult
    static func push(_ target: RoutableTarget, animated: Bool = true) -> Bool {
        
        guard let controller = route(target), let navigation = navigationController else { return false }
        
        navigation.pushViewController(controller, animated: animated)
        
        return true
        
    }
    
    @discardableResult
    static func present(_ target: RoutableTarget, animated: Bool = true, completion: (() -> Void)? = nil) -> Bool {
        
        guard let controller = route(target), let topController = topViewController else { return false }
        
        topController.present(controller, animated: animated, completion: completion)
        
        return true
        
    }
    
}

public extension CleanRouter {
    
    static var navigationController: UINavigationController? {
        
        guard let rootViewController = appRootViewController else {
            return nil
        }
        
        var navigationController: UINavigationController?
        
        if let vc = rootViewController as? UINavigationController {
            navigationController = vc
        }
        
        if let tabBarController = rootViewController as? UITabBarController,
            let vc = tabBarController.selectedViewController as? UINavigationController {
            navigationController = vc
        }
        
        guard var topViewController: UIViewController = navigationController else {
            return nil
        }
        
        while topViewController.presentedViewController != nil {
            topViewController = topViewController.presentedViewController!
        }
        
        return topViewController as? UINavigationController
        
    }
    
    static var topViewController: UIViewController? {
        
        if let rootViewController = appRootViewController {
            return topController(of: rootViewController)
        }
        
        return nil
        
    }
    
}

private extension CleanRouter {
    
    static var appRootViewController: UIViewController? {
        return (UIApplication.shared.delegate?.window as? UIWindow)?.rootViewController
    }
    
    static func topController(of viewController: UIViewController) -> UIViewController? {
        
        if let presentedViewController = viewController.presentedViewController {
            return topController(of: presentedViewController)
        }
        
        if let tabBarController = viewController as? UITabBarController,
            let selectedViewController = tabBarController.selectedViewController {
            return topController(of: selectedViewController)
        }
        
        if let navigationController = viewController as? UINavigationController,
            let visibleViewController = navigationController.visibleViewController {
            return topController(of: visibleViewController)
        }
        
        if let pageViewController = viewController as? UIPageViewController,
            pageViewController.viewControllers?.count == 1,
            let vc = pageViewController.viewControllers?.first {
            return topController(of: vc)
        }
        
        if let subviews = viewController.view?.subviews {
            
            for subview in subviews {
                if let childViewController = subview.next as? UIViewController {
                    return topController(of: childViewController)
                }
            }
            
        }
        
        return viewController
        
    }
    
}
