//
//  CityViewCell.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 16/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import UIKit

protocol CityViewCellDelegate: AnyObject {
    func showPlaceOnMap(location: Location)
}

class CityViewCell: UITableViewCell {
    
    weak var delegate: CityViewCellDelegate?
    private var location: Location?
    
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var locationType: UILabel!
    @IBOutlet weak var showMore: UIButton!
    @IBOutlet weak var detailsView: UIView!
    
    func configure(location: Location) {
        self.location = location
        cityName.text = location.title
    }
    
    @IBAction func showMoreButtonClicked(_ sender: Any) {
        
    }
    
    @IBAction func showPlaceOnMap(_ sender: Any) {
        guard let city = location else {
            return
        }
        delegate?.showPlaceOnMap(location: city)
    }
}
