//
//  SearchPresenter.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 16/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import Foundation

protocol SearchViewDelegate: AnyObject {
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
}
