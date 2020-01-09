//
//  MapPresenter.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 08/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import Foundation

class MapPresenter {
    private let weatherRepository: WeatherRepository
    
    init(weatherRepository: WeatherRepository) {
        self.weatherRepository = weatherRepository
    }
}
