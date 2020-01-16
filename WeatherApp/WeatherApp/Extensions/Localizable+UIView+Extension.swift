//
//  Localizable+UIView+Extension.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 14/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import UIKit

extension UIView {
    
    @IBInspectable var localizedText: String {
        get {
            return self.localizedText
        }
        
        set(text) {
            let lText = NSLocalizedString(text, comment: "")
            switch self {
            case let label as UILabel:
                label.text = lText
            case let textField as UITextField:
                textField.text = lText
            case let button as UIButton:
                button.setTitle(lText, for: .normal)
            default:
                break
            }
        }
    }
    
    @objc var localizedTexts: [String] {
        get {
            return self.localizedTexts
        }
        
        set(texts) {
            switch self {
            case let segmentedControl as UISegmentedControl:
                for (index, text) in texts.enumerated() {
                    let lText = NSLocalizedString(text, comment: "")
                    segmentedControl.setTitle(lText, forSegmentAt: index)
                }
            default:
                break
            }
        }
    }
    
    @IBInspectable var localizedPlaceholderText: String {
        get {
            return self.localizedPlaceholderText
        }
        
        set(text) {
            let lText = NSLocalizedString(text, comment: "")
            switch self {
            case let textField as UITextField:
                textField.placeholder = lText
            default:
                break
            }
        }
    }
}
