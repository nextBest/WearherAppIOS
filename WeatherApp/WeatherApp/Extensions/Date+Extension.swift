//
//  Date+Extension.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 25/02/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import Foundation
import UIKit

extension Date {
    
    func dateToDay() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
    
    func getTimeOfDay(timezone: String) -> TimeOfDay {
        var calendar = Calendar.current
        calendar.timeZone =  TimeZone(identifier: timezone)!
        let dateComponents = calendar.dateComponents([.hour], from: self)
        guard let hour = dateComponents.hour else { return .day }
        switch hour {
        case 6..<20:
            return .day
        default:
            return .night
        }
    }
}

enum TimeOfDay {
    case day
    case night
    
    var backgroundImage: UIImage {
        switch self {
        case .day:
            return UIImage.bgDay
        case .night:
            return UIImage.bgNight
        }
    }
}
