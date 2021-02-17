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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupActivityIndicatorView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupActivityIndicatorView()
    }
    
    private func setupActivityIndicatorView() {
        if #available(iOS 13.0, *) {
            activityIndicatorView.style = .large
        } else {
            activityIndicatorView.style = .whiteLarge
        }
    }
    
    // MARK: Internal methods
    func startAnimating() {
        activityIndicatorView.startAnimating()
    }
    
    func stopAnimating() {
        activityIndicatorView.stopAnimating()
    }
    
}
