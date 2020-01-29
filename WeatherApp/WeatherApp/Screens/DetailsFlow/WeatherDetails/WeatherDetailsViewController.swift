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
    private var tableViewCells: [Any] = []
    private var weatherData: WeatherData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewLoaded()
        setupTableView()
    }
    
    // MARK: Setup
    private func setupView(hideErrorView: Bool = true, hideConnectionErrorView: Bool = true, hideTableView: Bool = true, hideLoader: Bool = true) {
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
    
    private func setupTableView() {
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.register(WeatherHeaderTableViewCell.self)
    }
}

// MARK: - WeatherDetailsViewDelegate
extension WeatherDetailsViewController: WeatherDetailsViewDelegate {
    func showData(weatherData: WeatherData) {
        setupView(hideTableView: false)
        self.weatherData = weatherData
        tableViewCells.append(WeatherHeaderTableViewCell())
        tableView.reloadData()
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

// MARK: - UITableViewDataSource
extension WeatherDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherHeaderTableViewCell", for: indexPath)
        guard let weather = weatherData else { return cell}
        switch cell {
        case let weatherHeaderCell as WeatherHeaderTableViewCell:
            weatherHeaderCell.configure(weather: weather.consolidatedWeather[0])
        default:
            return cell
        }
        return cell
    }
}
