//
//  Date+Extension.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 25/02/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import Foundation

extension Date {
    
    func dateToDay() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
