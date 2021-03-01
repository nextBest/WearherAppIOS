//
//  AppStorage.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 21/02/2021.
//  Copyright © 2021 Mateusz Skałkowski. All rights reserved.
//

import Foundation

protocol AppStorage {
    var wasOnboardingPresented: Bool {get set}
}

struct AppStorageImpl: AppStorage {
    
    @UserDefault(key: "wasOnboardingPresented", defaultValue: false)
    var wasOnboardingPresented: Bool
}
