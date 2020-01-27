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
        let mapViewController = DashboardFlowFactory.makeMapViewController(weatherRepository: weatherRepository, delegate: self)
        mapViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 0)
        let searchViewController = DashboardFlowFactory.makeSearchViewController(weatherRepository: weatherRepository, delegate: self)
        searchViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        return [mapViewController, searchViewController]
    }
    
    private func runDetailsFlow() {
        let coordinator = DetailsFlowCoordinator(router: router, weatherRepository: weatherRepository)
        coordinator.finishFlow = { [unowned self] coordinator in
            self.removeCoordinator(coordinator)
        }
        addCoordinator(coordinator)
        coordinator.start()
    }
}

// MARK: - MapPresenterDelegate
extension DashboardFlowCoordinator: MapPresenterDelegate {
    func weatherDetailsFindForLocation(weatherData: WeatherData) {
        // TODO implement show weather details screen
        runDetailsFlow()
    }
}

// MARK: - SearchPresenterDelegate
extension DashboardFlowCoordinator: SearchPresenterDelegate {
    func placeFind(woeid: Int) {
        // TODO open weather details screen
        runDetailsFlow()
    }
}
