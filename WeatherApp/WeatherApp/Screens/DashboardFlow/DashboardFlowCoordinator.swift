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
    private let weatherRepository: WeatherRepository
    
    init(router: Router, weatherRepository: WeatherRepository) {
        self.router = router
        self.weatherRepository = weatherRepository
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
        let mapViewController = DashboardFlowFactory.makeMapViewController(weatherRepository: weatherRepository)
        mapViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 0)
        let searchViewController = DashboardFlowFactory.makeSearchViewController()
        searchViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        return [mapViewController, searchViewController]
    }
}
