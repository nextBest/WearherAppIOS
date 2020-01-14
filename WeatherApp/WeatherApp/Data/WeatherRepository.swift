//
//  WeatherRepository.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 08/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import Foundation
import Alamofire

protocol WeatherRepository {
    func searchLocationByCoordinates(latitude: Double, longitude: Double, success: @escaping (WeatherData) -> Void, fail: @escaping (NetworkError) -> Void)
    func getWeatherInfo(woeid: Int, success: @escaping (WeatherData) -> Void, fail: @escaping (NetworkError) -> Void)
}

class WeatherRepositoryImpl: WeatherRepository {
    
    private let weatherApi: WeatherApi
    
    init(weatherApi: WeatherApi) {
        self.weatherApi = weatherApi
    }
    
    func searchLocationByCoordinates(latitude: Double, longitude: Double, success: @escaping (WeatherData) -> Void, fail: @escaping (NetworkError) -> Void) {
        weatherApi.searchLocationByCoordinates(locationParams: LocationParams(lattlong: String(latitude) + "," + String(longitude)), success: { locationList in
            guard let nearestLocation = self.nearestLocation(locationList: locationList) else {
                fail(.noDataError)
                return
            }
            self.getWeatherInfo(woeid: nearestLocation.woeid, success: success, fail: fail)
        }, fail: fail)
    }
    
    func getWeatherInfo(woeid: Int, success: @escaping (WeatherData) -> Void, fail: @escaping (NetworkError) -> Void) {
        weatherApi.getWeather(woeid: String(woeid), success: success, fail: fail)
    }
    
    func nearestLocation(locationList: LocationList) -> Location? {
        return locationList.min { (location1, location2) -> Bool in
            return location1.distance ?? 0 < location2.distance ?? 0
        }
    }
    
}
