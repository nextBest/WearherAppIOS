//
//  MapPresenter.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 08/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import Foundation
import GoogleMaps

protocol MapViewDelegate: NSObject {
    func setCameraPosition(latitude: Double, longitude: Double)
    func setMarker(latitude: Double, longitude: Double)
}

class MapPresenter {
    weak fileprivate var view: MapViewDelegate?
    private let weatherRepository: WeatherRepository
    
    init(weatherRepository: WeatherRepository, view: MapViewDelegate) {
        self.weatherRepository = weatherRepository
        self.view = view
    }
    
    func locationFind(latitude: Double, longitude: Double) {
        view?.setCameraPosition(latitude: latitude, longitude: longitude)
    }
    
    func tapOnMap(latitude: Double, longitude: Double) {
        view?.setMarker(latitude: latitude, longitude: longitude)
        searchLocationByCoordinates(latitude: latitude, longitude: longitude)
    }
    
    private func searchLocationByCoordinates(latitude: Double, longitude: Double) {
        weatherRepository.searchLocationByCoordinates(latitude: latitude, longitude: longitude, success: { [weak self] weatherData in
            guard let srongSelf = self else { return }
            print(weatherData)
        }) { (error) in
            print(error)
        }
    }
}
