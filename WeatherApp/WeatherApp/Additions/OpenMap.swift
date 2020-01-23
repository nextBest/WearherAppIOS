//
//  OpenMap.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 22/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import Foundation
import MapKit

class OpenMap {
    static func forPlace(latLong: String, placeName: String) {
        guard let coordinates = latLong.stringToCLLocationCoordinate2D() else {
            return
        }
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = placeName
        mapItem.openInMaps()
    }
}
