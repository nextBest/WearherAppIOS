//
//  WeatherApi.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 08/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import Foundation

protocol WeatherApi {
    func searchLocationByText()
    func searchLocationByLocalization()
    func getWeather()
    func getWeatherForSpecificDay()
}

class WeatherApiImpl: WeatherApi {
    func getWeather() {
        
    }
    
    func getWeatherForSpecificDay() {
        
    }
    
    func searchLocationByText() {
        
    }
    
    func searchLocationByLocalization() {
        
    }
}
