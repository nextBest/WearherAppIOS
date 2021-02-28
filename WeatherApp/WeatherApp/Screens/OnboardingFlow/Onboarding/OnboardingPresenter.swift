//
//  OnboardingPresenter.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 17/02/2021.
//  Copyright © 2021 Mateusz Skałkowski. All rights reserved.
//

import Foundation

protocol OnboardingViewDelegate: AnyObject {}

protocol OnboardingPresenterDelegate: AnyObject {
    func userDidFinishOnboarding()
}

class OnboardingPresenter {
    // MARK: Private properties
    private weak var view: OnboardingViewDelegate?
    private weak var delegate: OnboardingPresenterDelegate?
    
    // MARK: Initialization
    init(view: OnboardingViewDelegate, delegate: OnboardingPresenterDelegate) {
        self.view = view
        self.delegate = delegate
    }
    
    // MARK: Public functions
    func finish() {
        delegate?.userDidFinishOnboarding()
    }
    
}
