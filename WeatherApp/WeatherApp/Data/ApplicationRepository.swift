//
//  ApplicationRepository.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 20/02/2021.
//  Copyright © 2021 Mateusz Skałkowski. All rights reserved.
//

import Foundation

protocol ApplicationRepository {
    func canPresentOnboarding() -> Bool
    func onboardingWasPresentedToUser()
}

class ApplicationRepositoryImpl: ApplicationRepository {
    
    private var appStorage: AppStorage
    
    init(appStorage: AppStorage) {
        self.appStorage = appStorage
    }
    
    func canPresentOnboarding() -> Bool {
        return !appStorage.wasOnboardingPresented
    }
    
    func onboardingWasPresentedToUser() {
        appStorage.wasOnboardingPresented = true
    }
}
