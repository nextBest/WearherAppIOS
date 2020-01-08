//
//  ApiRouter.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 07/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import Foundation
import Alamofire

enum ApiRouter: URLRequestConvertible {
    case locationSearch
    case locationSearchLatLong
    case location
    case locationDay
    
    static let baseUrlString = "https://www.metaweather.com/api/"
    
    var method: HTTPMethod {
        switch self {
        case .locationSearch, .location, .locationDay, .locationSearchLatLong:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .locationSearch, .locationSearchLatLong:
            return "location/search/"
        case .location:
            return "location/(woeid)/"
        case.locationDay:
            return "location/(woeid)/(date)/"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try ApiRouter.baseUrlString.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        return urlRequest
    }
}
