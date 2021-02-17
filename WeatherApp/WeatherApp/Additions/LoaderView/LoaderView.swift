//
//  LoaderView.swift
//  WeatherApp
//
//  Created by Mateusz Skałkowski on 15/07/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import UIKit

@IBDesignable
class LoaderView: CustomXibView {
    
    // MARK: IBOutlets
    @IBOutlet private weak var activityIndicatorView: UIActivityIndicatorView!
    
    // MARK: Internal methods
    func startAnimating() {
        activityIndicatorView.startAnimating()
    }
    
    func stopAnimating() {
        activityIndicatorView.stopAnimating()
    }
    
}
