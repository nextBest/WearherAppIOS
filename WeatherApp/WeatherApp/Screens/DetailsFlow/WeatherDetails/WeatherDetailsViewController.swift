//
//  WeatherDetailsViewController.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 27/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import UIKit

class WeatherDetailsViewController: UIViewController {
    var presenter: WeatherDetailsPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - WeatherDetailsViewDelegate
extension WeatherDetailsViewController: WeatherDetailsViewDelegate {
    
}
