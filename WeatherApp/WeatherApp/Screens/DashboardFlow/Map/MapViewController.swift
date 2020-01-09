//
//  DashboardViewController.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 03/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation

class MapViewController: UIViewController {
    
    var presenter: MapPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestLocation()
    }
    
    override func loadView() {
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
    }
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print("jest lokalizacja")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        error.localizedDescription
        print("Location error")
    }
}
