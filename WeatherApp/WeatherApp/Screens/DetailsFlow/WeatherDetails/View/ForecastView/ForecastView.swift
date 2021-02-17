//
//  ForecastView.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 03/02/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import UIKit

@IBDesignable
class ForecastView: CustomXibView {
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var tempDayLabel: UILabel!
    @IBOutlet weak var tempNightLabel: UILabel!
    
    func setup(weather: Weather) {
        dayLabel.text = weather.applicableDate.dateToDay()
        weatherImage.sd_setImage(with: Configuration.imageUrl(weatherStateAbbr: weather.weatherStateAbbr), completed: nil)
        tempDayLabel.text = weather.maxTemp.temperature()
        tempNightLabel.text = weather.minTemp.temperature()
    }
}
