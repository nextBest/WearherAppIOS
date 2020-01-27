//
//  DetailsFlowCoordinator.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 27/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import Foundation

class DetailsFlowCoordinator: Coordinator {
    private let router: Router
    private let weatherRepository: WeatherRepository
    
    init(router: Router, weatherRepository: WeatherRepository) {
        self.router = router
        self.weatherRepository = weatherRepository
    }
    
    override func start() {
        showWeatherDetailsVC()
    }
    
    private func showWeatherDetailsVC() {
        let weatherDetailsViewController = DetailsFlowFactory.makeWeatherDetailsViewController(weatherRepository: weatherRepository)
        router.push(weatherDetailsViewController, animated: true) { [weak self] in
            self?.finishFlow?(self)
        }
    }
}
