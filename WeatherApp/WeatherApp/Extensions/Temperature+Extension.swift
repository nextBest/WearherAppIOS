//
//  Temperature+Extension.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 29/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import Foundation

extension Double {
    func temperature()-> String {
        return self.toString() + "°C";
    }
}
