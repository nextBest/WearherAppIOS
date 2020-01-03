//
//  AppCoordinator.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 03/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    private let router: Router
    
    override init() {
        self.router = Router(rootController: AppCoordinator.makeRootViewControllerWithKeyAndVisible())
    }
    
    override func start() {
        runDashboardFlow()
    }
    
    private func runTutorialFlow() {
        
    }
    
    private func runDashboardFlow() {
        // TODO run main flow
    }
    
    private static func makeRootViewControllerWithKeyAndVisible() -> UINavigationController {
        let rootNavigationController = UINavigationController()
        rootNavigationController.isNavigationBarHidden = true
        
        if let window = UIApplication.shared.delegate?.window {
            window?.rootViewController = rootNavigationController
            window?.makeKeyAndVisible()
        }
        
        return rootNavigationController
    }
}
