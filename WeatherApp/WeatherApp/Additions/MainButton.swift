//
//  MainButton.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 23/02/2021.
//  Copyright © 2021 Mateusz Skałkowski. All rights reserved.
//

import UIKit

class MainButton: UIButton {
    
    // MARK: Initialization
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        customize()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customize()
    }
    
    // MARK: Private functions
    private func customize() {
        setTitleColor(UIColor.blue, for: .normal)
        backgroundColor = .white
        layer.cornerRadius = 12
        layer.shadowOffset = CGSize(width: 3, height: 3)
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 4
        layer.masksToBounds = false
    }
}
