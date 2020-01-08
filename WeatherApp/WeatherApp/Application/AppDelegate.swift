//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Mateusz Skałkowski on 21/12/2019.
//  Copyright © 2019 Mateusz Skałkowski. All rights reserved.
//

import UIKit
import AlamofireNetworkActivityLogger
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var appCoordinator: AppCoordinator!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupNetworkLogger()
        setupGoogleMaps()
        startCoordinator()
        return true
    }
    
    // MARK: setup
    
    private func setupNetworkLogger() {
        NetworkActivityLogger.shared.level = .info
        NetworkActivityLogger.shared.startLogging()
    }
    
    private func startCoordinator() {
        window = UIWindow(frame: UIScreen.main.bounds)
        appCoordinator = AppCoordinator()
        appCoordinator.start()
    }
    
    private func setupGoogleMaps() {
        GMSServices.provideAPIKey("")
    }
}
