//  Route.swift
//  Planet_uiKit
//  Created by Naleesh Jeffrey on 2023-09-15.

import UIKit

class Router {
    
    static let shared = Router()
    
    func presentModalViewController(_ viewController: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        getCurrentNavigationController()?.topViewController?.present(viewController, animated: animated, completion: completion)
    }
    
    func pushViewController(_ viewController: UIViewController) {
        getCurrentNavigationController()?.pushViewController(viewController, animated:true)
    }
    
    func pop() {
        getCurrentNavigationController()?.popViewController(animated: true)
    }
    
    func dismiss(completion: (() -> Void)? = nil) {
        getCurrentNavigationController()?.dismiss(animated: true, completion: completion)
    }
    
    func popToRootView() {
        getCurrentNavigationController()?.popToRootViewController(animated:true)
    }
    
    private func findNavigationController(viewController: UIViewController?) -> UINavigationController? {
        guard let viewController = viewController else {
            return nil
        }
        
        if let navigationController = viewController as? UINavigationController {
            return navigationController
        }
        
        for childViewController in viewController.children {
            return findNavigationController(viewController: childViewController)
        }
        
        return nil
    }
    
    private func getCurrentNavigationController() -> UINavigationController? {
        return findNavigationController(viewController: UIApplication.shared.connectedScenes.flatMap { ($0 as? UIWindowScene)?.windows ?? [] }.first?.rootViewController)
    }
    
}
