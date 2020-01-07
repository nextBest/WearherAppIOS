//
//  DashboardFlowCoordinator.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 03/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import UIKit

class DashboardFlowCoordinator: Coordinator {
    private let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    override func start() {
        showTabBarVC()
    }
    
    private func showTabBarVC() {
        let tabBarViewController = UITabBarController()
        tabBarViewController.viewControllers = createTabBarItems()
        router.setRootModule(tabBarViewController, hideBar: false)
    }
    
    private func createTabBarItems() -> [UIViewController] {
        let dashboardViewController = DashboardFlowFactory.makeDashboardViewController()
        return [dashboardViewController]
    }
}
