//
//  SearchPresenter.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 16/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import Foundation

protocol SearchViewDelegate: AnyObject {
    func showCityList(locationList: [CityCell])
    func showBeginningView()
    func showConnectionErrorview()
    func showNoResultsView()
    func showLoading()
}

protocol SearchPresenterDelegate: AnyObject {
    func placeFind(woeid: Int, cityName: String)
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
        view.showLoading()
        weatherRepository.searchCity(query: cityName, success: { [weak self] (locationList) in
            if locationList.isEmpty {
                self?.view.showNoResultsView()
            } else {
                let sortedLocationList = locationList.sorted { (location1, location2) -> Bool in
                    return location1.title < location2.title
                }
                var cityViewCellList: [CityCell] = []
                for location in sortedLocationList {
                    cityViewCellList.append(CityCell(location: location))
                }
                self?.view.showCityList(locationList: cityViewCellList)
            }
        }) { [weak self] (_) in
            self?.view.showConnectionErrorview()
        }
    }
    
    func citySelected(location: Location) {
        delegate.placeFind(woeid: location.woeid, cityName: location.title)
    }
}
