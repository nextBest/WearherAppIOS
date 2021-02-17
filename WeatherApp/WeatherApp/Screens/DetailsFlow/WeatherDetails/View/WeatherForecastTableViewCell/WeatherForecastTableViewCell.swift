//
//  WeatherForecastTableViewCell.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 31/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import UIKit

class WeatherForecastTableViewCell: UITableViewCell {
    
    @IBOutlet weak var forecastDayOne: ForecastView!
    @IBOutlet weak var forecastDayTwo: ForecastView!
    @IBOutlet weak var forecastDayThree: ForecastView!
    @IBOutlet weak var forecastDayFour: ForecastView!
    @IBOutlet weak var forecastDayFive: ForecastView!
    
    func configure(weatherList: [Weather]) {
        for index in 1...weatherList.count - 1 {
            switch index {
            case 1:
                forecastDayOne.setup(weather: weatherList[index])
            case 2:
                forecastDayTwo.setup(weather: weatherList[index])
            case 3:
                forecastDayThree.setup(weather: weatherList[index])
            case 4:
                forecastDayFour.setup(weather: weatherList[index])
            case 5:
                forecastDayFive.setup(weather: weatherList[index])
            default: break
            }
        }
    }
    
}
