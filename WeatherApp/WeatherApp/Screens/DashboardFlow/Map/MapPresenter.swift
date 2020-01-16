//
//  MapPresenter.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 08/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import Foundation
import GoogleMaps

protocol MapViewDelegate: AnyObject {
    func setCameraPosition(latitude: Double, longitude: Double)
    func setMarker(latitude: Double, longitude: Double)
    func showErrorSnackBar(message: String)
}

protocol MapPresenterDelegate: AnyObject {
    func weatherDetailsFindForLocation(weatherData: WeatherData)
}

class MapPresenter {
    private unowned let view: MapViewDelegate
    private unowned let delegate: MapPresenterDelegate
    private let weatherRepository: WeatherRepository
    
    init(weatherRepository: WeatherRepository, view: MapViewDelegate, delegate: MapPresenterDelegate) {
        self.weatherRepository = weatherRepository
        self.view = view
        self.delegate = delegate
    }
    
    func locationFind(latitude: Double, longitude: Double) {
        view.setCameraPosition(latitude: latitude, longitude: longitude)
    }
    
    func tapOnMap(latitude: Double, longitude: Double) {
        view.setMarker(latitude: latitude, longitude: longitude)
        searchLocationByCoordinates(latitude: latitude, longitude: longitude)
    }
    
    private func searchLocationByCoordinates(latitude: Double, longitude: Double) {
        weatherRepository.searchLocationByCoordinates(latitude: latitude, longitude: longitude, success: { [weak self] weatherData in
            guard let strongSelf = self else { return }
            strongSelf.delegate.openWeatherDetailsScreen(weatherData: weatherData)
        }) { [weak self] error in
            guard let strongSelf = self else { return }
            strongSelf.view.showErrorSnackBar(message: error.message)
        }
    }
}
