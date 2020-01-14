//
//  NetworkError.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 13/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case connectionError
    case parseError
    case defaultError
    
    var message: String {
        switch self {
        case .connectionError:
            return Localizable.NetworkError.connectionError.text
        default:
            return Localizable.NetworkError.error.text
        }
    }
}
