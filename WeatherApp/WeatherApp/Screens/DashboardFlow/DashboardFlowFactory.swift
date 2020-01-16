//
//  DashboardFlowFactory.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 03/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import Foundation

enum DashboardFlowFactory {
    static func makeMapViewController(weatherRepository: WeatherRepository, delegate: MapPresenterDelegate) -> MapViewController {
        let mapViewController = MapViewController.controllerFromStoryboard(.dashboard)
        let mapPresenter = MapPresenter(weatherRepository: weatherRepository, view: mapViewController, delegate: delegate)
        mapViewController.presenter = mapPresenter
        return mapViewController
    }
    
    static func makeSearchViewController(weatherRepository: WeatherRepository, delegate: SearchPresenterDelegate) -> SearchViewController {
        let searchViewController = SearchViewController.controllerFromStoryboard(.dashboard)
        let searchPresenter = SearchPresenter(weatherRepository: weatherRepository, view: searchViewController, delegate: delegate)
        searchViewController.presenter = searchPresenter
        return searchViewController
    }
}
