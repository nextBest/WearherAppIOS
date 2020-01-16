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
    private let requestManager = RequestManager()
    private let weatherRepository: WeatherRepository
    
    override init() {
        self.router = Router(rootController: AppCoordinator.makeRootViewControllerWithKeyAndVisible())
        self.weatherRepository = WeatherRepositoryImpl(weatherApi: WeatherApiImpl(requestManager: requestManager))
    }
    
    override func start() {
        runDashboardFlow()
    }
    
    private func runTutorialFlow() {
        // TODO run tutorial flow
    }
    
    private func runDashboardFlow() {
        let coordinator = DashboardFlowCoordinator(router: router, weatherRepository: weatherRepository)
        coordinator.finishFlow = { [unowned self] coordinator in
            self.removeCoordinator(coordinator)
        }
        addCoordinator(coordinator)
        coordinator.start()
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
