//
//  SearchViewController.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 07/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    var presenter: SearchPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

// MARK: - SearchViewDelegate
extension SearchViewController: SearchViewDelegate {
    
}
