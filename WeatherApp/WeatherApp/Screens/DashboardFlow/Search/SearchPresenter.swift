//
//  SearchPresenter.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 16/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import Foundation

protocol SearchViewDelegate: AnyObject {
    func showCityList(locationList: LocationList)
    func showBeginningView()
    func showConnectionErrorview()
    func showNoResultsView()
}

protocol SearchPresenterDelegate: AnyObject {
    func placeFind(woeid: Int)
}

class SearchPresenter {
    private unowned let view: SearchViewDelegate
    private unowned let delegate: SearchPresenterDelegate
    private let weatherRepository: WeatherRepository
    
    init(weatherRepository: WeatherRepository, view: SearchViewDelegate, delegate: SearchPresenterDelegate) {
        self.weatherRepository = weatherRepository
        self.view = view
        self.delegate = delegate
    }
    
    func viewLoaded() {
        view.showBeginningView()
    }
    
    func searchCity(by cityName: String) {
        weatherRepository.searchCity(query: cityName, success: { [weak self] (locationList) in
            if locationList.isEmpty {
                self?.view.showNoResultsView()
            } else {
                self?.view.showCityList(locationList: locationList)
            }
        }) { [weak self] (_) in
            self?.view.showConnectionErrorview()
        }
    }
}
