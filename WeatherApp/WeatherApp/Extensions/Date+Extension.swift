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
    
    func getTimeOfDay() -> TimeOfDay {
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.hour], from: self)
        guard let hour = dateComponents.hour else { return .day }
        switch hour {
        case 6..<20:
            return .day
        default:
            return .night
        }
    }
    
    enum TimeOfDay {
        case day
        case night
    }
}
