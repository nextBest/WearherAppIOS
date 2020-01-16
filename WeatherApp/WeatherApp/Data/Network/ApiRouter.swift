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
    case locationSearch(parameters: LocationTextParams)
    case locationSearchLatLong(parameters: LocationParams)
    case location(woeid: String)
    case locationDay(woeid: String, date: String)
    
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
        case .location(let woeid):
            return "location/\(woeid)/"
        case.locationDay(let woeid, let date):
            return "location/\(woeid)/\(date)/"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try ApiRouter.baseUrlString.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        switch self {
        case .locationSearchLatLong(let params):
            return try URLEncodedFormParameterEncoder.default.encode(params, into: urlRequest)
        case .locationSearch(let params):
            return try URLEncodedFormParameterEncoder.default.encode(params, into: urlRequest)
        default:
            return urlRequest
        }
        
    }
}
