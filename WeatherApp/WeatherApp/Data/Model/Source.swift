//
//  Source.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 10/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import Foundation

struct Source: Codable {
    let title: String
    let slug: String
    let url: String
    let crawlRate: Int
    
    enum CodingKeys: String, CodingKey {
        case title, slug, url
        case crawlRate = "crawl_rate"
    }
}
