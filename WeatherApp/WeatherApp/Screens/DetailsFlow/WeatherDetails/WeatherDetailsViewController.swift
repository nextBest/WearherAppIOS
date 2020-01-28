//
//  WeatherDetailsViewController.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 27/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import UIKit

class WeatherDetailsViewController: UIViewController {
    
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: WeatherDetailsPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewLoaded()
    }
}

// MARK: - WeatherDetailsViewDelegate
extension WeatherDetailsViewController: WeatherDetailsViewDelegate {
    func setTitle(title: String) {
        self.title = title
    }
    
}
