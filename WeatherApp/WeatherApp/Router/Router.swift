//
//  Router.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 03/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import UIKit

typealias ViewControllerCompletion = () -> Void

final class Router: NSObject, Presentable {
    
    private weak var rootController: UINavigationController?
    private var completions: [UIViewController: ViewControllerCompletion]
    
    init(rootController: UINavigationController) {
        self.rootController = rootController
        completions = [:]
        super.init()
        self.rootController?.delegate = self
    }
    
    private func runCompletion(for controller: UIViewController) {
        guard let completion = completions[controller] else { return }
        completion()
        completions.removeValue(forKey: controller)
    }
    
    func toPresent() -> UIViewController? {
        return rootController
    }
    
    func present<T: Presentable>(_ module: T?) {
        present(module, animated: true)
    }
    
    func present<T: Presentable>(_ module: T?, animated: Bool) {
        present(module, animated: animated, completion: nil)
    }
    
    func present<T: Presentable>(_ module: T?, animated: Bool, completion: (ViewControllerCompletion?)) {
        guard let controller = module?.toPresent() else { return }
        rootController?.present(controller, animated: animated, completion: completion)
    }
    
    func push<T: Presentable>(_ module: T?) {
        push(module, animated: true)
    }
    
    func push<T: Presentable>(_ module: T?, animated: Bool) {
        push(module, animated: animated, completion: nil)
    }
    
    func push<T: Presentable>(_ module: T?, animated: Bool, completion: (ViewControllerCompletion)?) {
        guard
            let controller = module?.toPresent(),
            controller is UINavigationController == false
            else { assertionFailure("Deprecated push UINavigationController"); return }
        
        if let completion = completion { completions[controller] = completion }
        rootController?.pushViewController(controller, animated: animated)
    }
    
    func popModule() {
        popModule(animated: true)
    }
    
    func popModule(animated: Bool) {
        if let controller = rootController?.popViewController(animated: animated) {
            runCompletion(for: controller)
        }
    }
    
    func dismissModule() {
        dismissModule(animated: true, completion: nil)
    }
    
    func dismissModule(animated: Bool, completion: (ViewControllerCompletion)?) {
        rootController?.dismiss(animated: animated, completion: completion)
    }
    
    func setRootModule<T: Presentable>(_ module: T?) {
        setRootModule(module, hideBar: false)
    }
    
    func setRootModule<T: Presentable>(_ module: T?, hideBar: Bool) {
        setRootModule(module, hideBar: hideBar, animated: false)
    }
    
    func setRootModule<T: Presentable>(_ module: T?, hideBar: Bool, animated: Bool) {
        guard let controller = module?.toPresent() else { return }
        rootController?.setViewControllers([controller], animated: animated)
        rootController?.isNavigationBarHidden = hideBar
    }
    
    func popToRootModule(animated: Bool) {
        if let controllers = rootController?.popToRootViewController(animated: animated) {
            controllers.forEach({ runCompletion(for: $0) })
        }
    }
    
    func popToRootModule(animated: Bool, hideBar: Bool) {
        rootController?.navigationBar.isHidden = hideBar
        popToRootModule(animated: animated)
    }
    
}

extension Router: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let poppedViewController = navigationController.transitionCoordinator?.viewController(forKey: .from),
            !navigationController.viewControllers.contains(poppedViewController) else {
                return
        }
        
        runCompletion(for: poppedViewController)
    }
}
