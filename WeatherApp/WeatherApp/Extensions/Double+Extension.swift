//
//  Double+Extension.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 30/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import Foundation

extension Double {
    func toString()-> String {
        return String(format: "%.0f", self)
    }
}
