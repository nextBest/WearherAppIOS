//
//  WeatherTimeTableViewCell.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 25/02/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import UIKit

class WeatherTimeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var sunView: SunView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    func configure(weatherData: WeatherData) {
        let date = weatherData.time.getFormattedDate(timezone: weatherData.timezone)
        let dateText = Localizable.WeatherDetails.date.formattedText(inputs: date)
        dateLabel.attributedText = dateText.boldText(in: NSRange(location: dateText.count - date.count, length: date.count))
        
        let time = weatherData.time.toHour(timezone: weatherData.timezone)
        let timeText = Localizable.WeatherDetails.timeHour.formattedText(inputs: time)
        timeLabel.attributedText = timeText.boldText(in: NSRange(location: timeText.count - time.count, length: time.count))
        
        sunView.setupData(sunrise: weatherData.sunRise, sunset: weatherData.sunSet, timezone: weatherData.timezone)
    }
}
