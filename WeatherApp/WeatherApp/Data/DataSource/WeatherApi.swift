//
//  WeatherApi.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 08/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import Foundation
import Alamofire

protocol WeatherApi {
    func searchLocationByText(locationTextParams: LocationTextParams, success: @escaping (LocationList) -> Void, fail: @escaping (NetworkError) -> Void)
    func searchLocationByCoordinates(locationParams: LocationParams, success: @escaping (LocationList) -> Void, fail: @escaping (NetworkError) -> Void)
    func getWeather(woeid: String, success: @escaping (WeatherData) -> Void, fail: @escaping (NetworkError) -> Void)
    func getWeatherForSpecificDay()
}

class WeatherApiImpl: WeatherApi {
    private let requestManager: RequestManager
    
    init(requestManager: RequestManager) {
        self.requestManager = requestManager
    }
    
    func getWeather(woeid: String, success: @escaping (WeatherData) -> Void, fail: @escaping (NetworkError) -> Void) {
        requestManager.makeRequest(router: .location(woeid: woeid), resultType: WeatherData.self, success: success, fail: fail)
    }
    
    func getWeatherForSpecificDay() {
        
    }
    
    func searchLocationByText(locationTextParams: LocationTextParams, success: @escaping (LocationList) -> Void, fail: @escaping (NetworkError) -> Void) {
        requestManager.makeRequest(router: .locationSearch(parameters: locationTextParams), resultType: LocationList.self, success: success, fail: fail)
    }
    
    func searchLocationByCoordinates(locationParams: LocationParams, success: @escaping (LocationList) -> Void, fail: @escaping (NetworkError) -> Void) {
        requestManager.makeRequest(router: .locationSearchLatLong(parameters: locationParams), resultType: LocationList.self, success: success, fail: fail)
    }
}
