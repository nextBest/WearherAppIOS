//
//  DetailsFlowFactory.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 27/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import Foundation

class DetailsFlowFactory {
    
    static func makeWeatherDetailsViewController(weatherRepository: WeatherRepository, cityName: String, woeid: Int? = nil, weatherData: WeatherData? = nil) -> WeatherDetailsViewController {
        let weatherDetailsViewController = WeatherDetailsViewController.controllerFromStoryboard(.details)
        let presenter = WeatherDetailsPresenter(weatherRepository: weatherRepository, view: weatherDetailsViewController, cityName: cityName, woeid: woeid, weatherData: weatherData)
        weatherDetailsViewController.presenter = presenter
        return weatherDetailsViewController
    }
}
