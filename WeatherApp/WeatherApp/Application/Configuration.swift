//
//  Configuration.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 17/02/2021.
//  Copyright © 2021 Mateusz Skałkowski. All rights reserved.
//

import Foundation

struct Configuration {
    static let baseUrlString = "https://www.metaweather.com/api/"
    
    static func imageUrl(weatherStateAbbr: String) -> URL? {
        return URL(string: "https://www.metaweather.com/static/img/weather/png/\(weatherStateAbbr).png")
    }
}
