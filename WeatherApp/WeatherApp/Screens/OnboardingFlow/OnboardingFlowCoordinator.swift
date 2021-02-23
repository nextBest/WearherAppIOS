//
//  OnboardingFlowCoordinator.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 17/02/2021.
//  Copyright © 2021 Mateusz Skałkowski. All rights reserved.
//

import Foundation

class OnboardingFlowCoordinator: Coordinator {
    
    private let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    override func start() {
        showOnboardingVC()
    }
    
    private func showOnboardingVC() {
        let onboardingViewController = OnboardingFlowFactory.makeOnboardingViewController()
        router.push(onboardingViewController, animated: true) { [weak self] in
            self?.finishFlow?(self)
        }
    }
}
