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
    private let locationManager = CLLocationManager()
    private let mapView = GMSMapView(frame: CGRect.zero)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocationManager()
    }
    
    override func loadView() {
        mapView.delegate = self
        view = mapView
        
    }
    
    // MARK: Setup
    
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.topItem?.title = Localizable.Map.title.text
        navigationController?.navigationBar.topItem?.searchController = nil
    }
}

// MARK: - MapViewDelegate
extension MapViewController: MapViewDelegate {
    func showErrorSnackBar(message: String) {
        SnackBar.showErrorMessage(message: message)
    }
    
    func setMarker(latitude: Double, longitude: Double) {
        mapView.clear()
        let marker = GMSMarker(position: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
        marker.map = mapView
    }
    
    func setCameraPosition(latitude: Double, longitude: Double) {
        let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 6.0)
        mapView.camera = camera
    }
}

// MARK: - CLLocationManagerDelegate
extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            presenter.locationFind(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // Do nothing
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse:
            locationManager.requestLocation()
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .denied:
            if !CLLocationManager.locationServicesEnabled() {
                locationManager.requestWhenInUseAuthorization()
            }
        default: break
        }
    }
    
}

// MARK: - GMSMapViewDelegate
extension MapViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        presenter.tapOnMap(latitude: coordinate.latitude, longitude: coordinate.longitude)
    }
}
