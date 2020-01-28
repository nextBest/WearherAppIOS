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
    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var connectionErrorView: UIView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    var presenter: WeatherDetailsPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewLoaded()
    }
    
    // MARK: Setup
    
    private func setupView(hideErrorView: Bool = true, hideConnectionErrorView: Bool = true,  hideTableView: Bool = true, hideLoader: Bool = true) {
        errorView.isHidden = hideErrorView
        connectionErrorView.isHidden = hideConnectionErrorView
        tableView.isHidden = hideTableView
        loader.isHidden = hideLoader
        if hideLoader {
            loader.stopAnimating()
        } else {
            loader.startAnimating()
        }
    }
}

// MARK: - WeatherDetailsViewDelegate
extension WeatherDetailsViewController: WeatherDetailsViewDelegate {
    func showData(weatherData: WeatherData) {
        setupView(hideTableView: false)
    }
    
    func showConnectionErrorview() {
        setupView(hideConnectionErrorView: false)
    }
    
    func showError() {
        setupView(hideErrorView: false)
    }
    
    func showLoading() {
        setupView(hideLoader: false)
    }
    
    func setTitle(title: String) {
        self.title = title
    }
    
}
