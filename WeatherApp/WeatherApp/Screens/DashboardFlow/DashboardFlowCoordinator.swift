//
//  DashboardFlowCoordinator.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 03/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import Foundation

class DashboardFlowCoordinator: Coordinator {
    private let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    override func start() {
        runDashboardFlow()
    }
    
    private func runDashboardFlow() {
        let dashboardViewController = DashboardFlowFactory.makeDashboardViewController()
        router.setRootModule(dashboardViewController, hideBar: false)
    }
    
    private func showTabBarVC() {
         
       }
}
