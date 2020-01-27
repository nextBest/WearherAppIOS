//
//  Array+Extension.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 23/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import Foundation

extension Array {
    subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
