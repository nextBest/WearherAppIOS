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
    private let cityName: String
    private let woeid: Int?
    private let weatherData: WeatherData?
    
    init(router: Router, weatherRepository: WeatherRepository, cityName: String, woeid: Int? = nil, weatherData: WeatherData? = nil) {
        self.router = router
        self.weatherRepository = weatherRepository
        self.cityName = cityName
        self.woeid = woeid
        self.weatherData = weatherData
    }
    
    override func start() {
        showWeatherDetailsVC()
    }
    
    private func showWeatherDetailsVC() {
        let weatherDetailsViewController = DetailsFlowFactory.makeWeatherDetailsViewController(weatherRepository: weatherRepository, cityName: cityName, woeid: woeid, weatherData: weatherData)
        router.push(weatherDetailsViewController, animated: true) { [weak self] in
            self?.finishFlow?(self)
        }
    }
}
