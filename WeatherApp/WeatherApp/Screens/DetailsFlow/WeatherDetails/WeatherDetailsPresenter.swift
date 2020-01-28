//
//  WeatherDetailsPresenter.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 27/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import Foundation

protocol WeatherDetailsViewDelegate: AnyObject {
    func setTitle(title: String)
    func showConnectionErrorview()
    func showError()
    func showLoading()
    func showData(weatherData: WeatherData)
}

class WeatherDetailsPresenter {
    private let weatherRepository: WeatherRepository
    private unowned let view: WeatherDetailsViewDelegate
    private let cityName: String
    private let woeid: Int?
    private var weatherData: WeatherData?
    
    init(weatherRepository: WeatherRepository, view: WeatherDetailsViewDelegate, cityName: String, woeid: Int? = nil, weatherData: WeatherData? = nil) {
        self.weatherRepository = weatherRepository
        self.view = view
        self.cityName = cityName
        self.woeid = woeid
        self.weatherData = weatherData
    }
    
    func viewLoaded() {
        view.setTitle(title: cityName)
        
        if let weather = weatherData {
            showWeatherData(weatherData: weather)
        } else {
            loadWeatherData()
        }
    }
    
    private func loadWeatherData() {
        guard let strongWoeid = woeid else { return }
        view.showLoading()
        weatherRepository.getWeatherInfo(woeid: strongWoeid, success: { [weak self] (weatherData) in
            self?.weatherData = weatherData
            self?.showWeatherData(weatherData: weatherData)
        }) { [weak self] (error) in
            switch error {
            case .connectionError:
                self?.view.showConnectionErrorview()
            default:
                self?.view.showError()
            }
        }
    }
    
    private func showWeatherData(weatherData: WeatherData) {
        view.showData(weatherData: weatherData)
    }
}
