//
//  DashboardFlowFactory.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 03/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import Foundation

enum DashboardFlowFactory {
    static func makeMapViewController(weatherRepository: WeatherRepository) -> MapViewController {
        let mapViewController = MapViewController.controllerFromStoryboard(.dashboard)
        let mapPresenter = MapPresenter(weatherRepository: weatherRepository, view: mapViewController)
        mapViewController.presenter = mapPresenter
        return mapViewController
    }
    
    static func makeSearchViewController() -> SearchViewController {
        let searchViewController = SearchViewController.controllerFromStoryboard(.dashboard)
        return searchViewController
    }
}
