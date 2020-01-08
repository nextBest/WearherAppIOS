//
//  WeatherApi.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 08/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import Foundation

protocol WeatherApi {
    func searchLocationByText(text: String)
    func searchLocationByLocalization()
    func getWeather()
    func getWeatherForSpecificDay()
}

class WeatherApiImpl: WeatherApi {
     private let requestManager: RequestManager
       
       init(requestManager: RequestManager) {
           self.requestManager = requestManager
       }
    
    func getWeather() {
        
    }
    
    func getWeatherForSpecificDay() {
        
    }
    
    func searchLocationByText(text: String) {
        
    }
    
    func searchLocationByLocalization() {
        
    }
}
