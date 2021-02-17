//
//  WeatherDetailsTableViewCell.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 29/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import UIKit

class WeatherDetailsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var visibilityLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var predictabilityLabel: UILabel!
    
    func configure(weather: Weather) {
        weatherImage.sd_setImage(with: Configuration.imageUrl(weatherStateAbbr: weather.weatherStateAbbr), completed: nil)
        humidityLabel.text = weather.humidity.toString() + " %"
        visibilityLabel.text = weather.visibility.toString() + " miles"
        pressureLabel.text = weather.airPressure.toString() + " mBar"
        predictabilityLabel.text = weather.predictability.toString() + " %"
    }
}
