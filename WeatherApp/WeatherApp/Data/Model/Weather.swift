//
//  Weather.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 13/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import Foundation

struct Weather: Codable {
    let id: Int
    let weatherStateName: String
    let weatherStateAbbr: String
    let windDirectionCompass: String
    let created: Date
    let applicableDate: Date
    let minTemp: Double
    let maxTemp: Double
    let theTemp: Double
    let windSpeed: Double
    let windDirection: Double
    let airPressure: Double
    let humidity: Int
    let visibility: Double
    let predictability: Int
    
    enum CodingKeys: String, CodingKey {
        case id, created, humidity, visibility, predictability
        case weatherStateName = "weather_state_name"
        case weatherStateAbbr = "weather_state_abbr"
        case windDirectionCompass = "wind_direction_compass"
        case applicableDate = "applicable_date"
        case minTemp = "min_temp"
        case maxTemp = "max_temp"
        case theTemp = "the_temp"
        case windSpeed = "wind_speed"
        case windDirection = "wind_direction"
        case airPressure = "air_pressure"
    }
}
