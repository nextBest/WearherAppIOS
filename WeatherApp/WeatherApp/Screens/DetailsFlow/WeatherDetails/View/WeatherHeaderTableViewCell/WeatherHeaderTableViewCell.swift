//
//  WeatherHeaderTableViewCell.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 28/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import UIKit
import SDWebImage

class WeatherHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var weatherStateLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    func configure(weather: Weather) {
        weatherImage.sd_setImage(with: Configuration.imageUrl(weatherStateAbbr: weather.weatherStateAbbr), completed: nil)
        weatherStateLabel.text = weather.weatherStateName
        temperatureLabel.text = weather.theTemp.temperature()
    }
    
}
