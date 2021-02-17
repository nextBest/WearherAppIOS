//
//  UIView+Extension.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 29/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import UIKit

extension UIView {
    
    @IBInspectable var cornerRaduis: Double {
        get {
            return Double(self.layer.cornerRadius)
        }
        
        set {
            self.layer.cornerRadius = CGFloat(newValue)
        }
    }
    
    func loadNib() -> UIView? {
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
}
