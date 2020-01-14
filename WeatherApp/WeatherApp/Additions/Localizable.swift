//
//  Localizable.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 14/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import Foundation

protocol Localized {}

extension Localized where Self: RawRepresentable, Self.RawValue == String {
    
    var text: String {
        let selfClassName = String(describing: type(of: self))
        return NSLocalizedString("\(selfClassName).\(self.rawValue)", value: "No localized string found", comment: "")
    }
    
    func formattedText(inputs: CVarArg...) -> String {
        return withVaList(inputs) { (params) -> String in
            let selfClassName = String(describing: type(of: self))
            let localizedString =  NSLocalizedString("\(selfClassName).\(self.rawValue)", value: "No localized string found", comment: "")
            return NSString(format: localizedString, arguments: params) as String
        }
    }
}

enum Localizable {
    enum NetworkError: String, Localized {
        case connectionError
        case error
    }
}
