//
//  OnboardingFlowFactory.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 17/02/2021.
//  Copyright © 2021 Mateusz Skałkowski. All rights reserved.
//

import Foundation

class OnboardingFlowFactory {
    
    static func makeOnboardingViewController(delegate: OnboardingPresenterDelegate) -> OnboardingViewController {
        let onboardingViewController = OnboardingViewController.controllerFromStoryboard(.onboarding)
        let onboardingPresenter = OnboardingPresenter(view: onboardingViewController, delegate: delegate)
        onboardingViewController.presenter = onboardingPresenter
        return onboardingViewController
    }
}
