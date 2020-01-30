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
        weatherImage.sd_setImage(with: URL(string: "https://www.metaweather.com/static/img/weather/png/\(weather.weatherStateAbbr).png"), completed: nil)
        humidityLabel.text = weather.humidity.toString()
        visibilityLabel.text = weather.visibility.toString()
        pressureLabel.text = weather.airPressure.toString()
        predictabilityLabel.text = weather.predictability.toString()
    }
}
