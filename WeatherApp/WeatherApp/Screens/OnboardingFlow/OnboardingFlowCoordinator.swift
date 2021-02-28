//
//  OnboardingFlowCoordinator.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 17/02/2021.
//  Copyright © 2021 Mateusz Skałkowski. All rights reserved.
//

import Foundation

class OnboardingFlowCoordinator: Coordinator {
    
    // MARK: Private properties
    private let router: Router
    private let applicationRepository: ApplicationRepository
    
    // MARK: Initialization
    init(router: Router, applicationRepository: ApplicationRepository) {
        self.router = router
        self.applicationRepository = applicationRepository
    }
    
    // MARK: Ovveride functions
    override func start() {
        showOnboardingVC()
    }
    
    // MARK: Private functions
    private func showOnboardingVC() {
        let onboardingViewController = OnboardingFlowFactory.makeOnboardingViewController(delegate: self, applicationRepository: applicationRepository)
        router.push(onboardingViewController, animated: true) { [weak self] in
            self?.finishFlow?(self)
        }
    }
}

// MARK: - OnboardingPresenterDelegate
extension OnboardingFlowCoordinator: OnboardingPresenterDelegate {
    func userDidFinishOnboarding() {
        self.finishFlow?(self)
    }
}
