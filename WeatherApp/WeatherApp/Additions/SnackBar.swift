//
//  SnackBar.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 13/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import Foundation
import MaterialComponents.MaterialSnackbar

class SnackBar {
    static func showErrorMessage(message: String) {
        let snackBarMessage = MDCSnackbarMessage()
        snackBarMessage.text = message
        MDCSnackbarManager.show(snackBarMessage)
    }
}
