//
//  OnboardingViewController.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 17/02/2021.
//  Copyright © 2021 Mateusz Skałkowski. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    var presenter: OnboardingPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

// MARK: - OnboardingViewDelegate
extension OnboardingViewController: OnboardingViewDelegate {}
