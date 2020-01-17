//
//  CityViewCell.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 16/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import UIKit

class CityViewCell: UITableViewCell {
    @IBOutlet weak var cityName: UILabel!
    
    func configure(location: Location) {
        cityName.text = location.title
    }
}
