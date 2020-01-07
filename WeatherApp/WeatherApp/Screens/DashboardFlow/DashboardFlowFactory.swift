//
//  DashboardFlowFactory.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 03/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import Foundation

enum DashboardFlowFactory {
    static func makeMapViewController() -> MapViewController {
        let mapViewController = MapViewController.controllerFromStoryboard(.dashboard)
        return mapViewController
    }
    
    static func makeSearchViewController() -> SearchViewController {
        let searchViewController = SearchViewController.controllerFromStoryboard(.dashboard)
        return searchViewController
    }
}
