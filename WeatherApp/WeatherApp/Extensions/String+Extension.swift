//
//  String+Extension.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 23/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import Foundation
import MapKit

extension String {
    func stringToCLLocationCoordinate2D() -> CLLocationCoordinate2D? {
        let latLongArray = self.split(separator: ",")
        
        let latitude =  latLongArray[safe: 0]
        let longitude = latLongArray[safe: 1]
        
        guard let lat = (latitude as NSString?)?.doubleValue, let lon = (longitude as NSString?)?.doubleValue else {
            return nil
        }
        return CLLocationCoordinate2DMake(lat, lon)
    }
    
    func widthWithConstrainedHeight(height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [.font: font], context: nil)
        return boundingBox.width
    }
}
