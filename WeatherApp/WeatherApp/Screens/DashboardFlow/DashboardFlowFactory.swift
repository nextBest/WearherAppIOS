//
//  DashboardFlowFactory.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 03/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import Foundation

enum DashboardFlowFactory {
    static func makeDashboardViewController() -> DashboardViewController {
        let dashboardViewController = DashboardViewController.controllerFromStoryboard(.dashboard)
        return dashboardViewController
    }
}
