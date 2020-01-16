//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 10/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let consolidatedWeather: [Weather]
    let time: String
    let sunRise: String
    let sunSet: String
    let timezoneName: String
    let parent: Location
    let sources: [Source]
    let title: String
    let locationType: String
    let woeid: Int
    let lattLong: String
    let timezone: String
    
    enum CodingKeys: String, CodingKey {
        case consolidatedWeather = "consolidated_weather"
        case time, parent, sources, title, woeid, timezone
        case sunRise = "sun_rise"
        case sunSet = "sun_set"
        case timezoneName = "timezone_name"
        case locationType = "location_type"
        case lattLong = "latt_long"
    }
}
