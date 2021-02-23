//
//  OnboardingPresenter.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 17/02/2021.
//  Copyright © 2021 Mateusz Skałkowski. All rights reserved.
//

import Foundation

protocol OnboardingViewDelegate: AnyObject {}

class OnboardingPresenter {
    private unowned let view: OnboardingViewDelegate
    
    init(view: OnboardingViewDelegate) {
        self.view = view
    }
    
}
