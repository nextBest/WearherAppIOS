//
//  Location.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 10/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import Foundation

struct Location: Codable {
    let distance: Int?
    let title: String
    let locationType: String
    let woeid: Int
    let lattLong: String

    enum CodingKeys: String, CodingKey {
        case distance, title, woeid
        case locationType = "location_type"
        case lattLong = "latt_long"
    }
}

typealias LocationList = [Location]
