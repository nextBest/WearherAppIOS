//
//  WeatherDetailsPresenter.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 27/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import Foundation

protocol WeatherDetailsViewDelegate: AnyObject {
    
}

class WeatherDetailsPresenter {
    private let weatherRepository: WeatherRepository
    private unowned let view: WeatherDetailsViewDelegate
    private let cityName: String
    private let woeid: Int?
    private let weatherData: WeatherData?
    
    init(weatherRepository: WeatherRepository, view: WeatherDetailsViewDelegate, cityName: String, woeid: Int? = nil, weatherData: WeatherData? = nil) {
        self.weatherRepository = weatherRepository
        self.view = view
        self.cityName = cityName
        self.woeid = woeid
        self.weatherData = weatherData
    }
}
