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
    func expandCell(indexPath: IndexPath)
}

class CityViewCell: UITableViewCell {
    
    weak var delegate: CityViewCellDelegate?
    private var cityCell: CityCell?
    private var indexPath: IndexPath?
    
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var locationType: UILabel!
    @IBOutlet weak var showMore: UIButton!
    @IBOutlet weak var detailsView: UIView!
    
    func configure(cityCell: CityCell, indexPath: IndexPath) {
        self.cityCell = cityCell
        self.indexPath = indexPath
        cityName.text = cityCell.location.title
        locationType.text = cityCell.location.locationType
        showMore.setTitle(cityCell.cellExpanded ? Localizable.Search.showLess.text : Localizable.Search.showMore.text, for: .normal)
        detailsView.isHidden = !cityCell.cellExpanded
    }
    
    @IBAction func showMoreButtonClicked(_ sender: Any) {
        guard let index = indexPath else {
            return
        }
        delegate?.expandCell(indexPath: index)
    }
    
    @IBAction func showPlaceOnMap(_ sender: Any) {
        guard let city = cityCell?.location else {
            return
        }
        delegate?.showPlaceOnMap(location: city)
    }
}
