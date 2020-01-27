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
    
    init(weatherRepository: WeatherRepository, view: WeatherDetailsViewDelegate) {
        self.weatherRepository = weatherRepository
        self.view = view
    }
}
