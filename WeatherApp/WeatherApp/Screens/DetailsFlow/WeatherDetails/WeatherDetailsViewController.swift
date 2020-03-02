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
    private var tableViewCells: [UITableViewCell] = []
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
        tableView.register(WeatherDetailsTableViewCell.self)
        tableView.register(WeatherForecastTableViewCell.self)
        tableView.register(WeatherTimeTableViewCell.self)
    }
}

// MARK: - WeatherDetailsViewDelegate
extension WeatherDetailsViewController: WeatherDetailsViewDelegate {
    
    func setBackgroundImage(timeOfDay: TimeOfDay) {
        background.image = timeOfDay.backgroundImage
    }
    
    func showData(weatherData: WeatherData) {
        setupView(hideTableView: false)
        self.weatherData = weatherData
        tableViewCells.append(WeatherHeaderTableViewCell())
        tableViewCells.append(WeatherDetailsTableViewCell())
        tableViewCells.append(WeatherForecastTableViewCell())
        tableViewCells.append(WeatherTimeTableViewCell())
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
        let cellType = CellType.init(fromRawValue: indexPath.row)
        switch cellType {
        case .header:
            let weatherHeaderCell: WeatherHeaderTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            if let weather = weatherData {
                weatherHeaderCell.configure(weather: weather.consolidatedWeather[0])
            }
            return weatherHeaderCell
        case .details:
            let weatherDetailsCell: WeatherDetailsTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            if let weather = weatherData {
                weatherDetailsCell.configure(weather: weather.consolidatedWeather[0])
            }
            return weatherDetailsCell
        case .forecast:
            let weatherForecastCell: WeatherForecastTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            if let weather = weatherData {
                weatherForecastCell.configure(weatherList: weather.consolidatedWeather)
            }
            return weatherForecastCell
        case .time:
            let weatherTimeCell: WeatherTimeTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            if let weatherData = weatherData {
                weatherTimeCell.configure(weatherData: weatherData)
            }
            return weatherTimeCell
        }
    }
}

extension WeatherDetailsViewController {
    enum CellType: Int, CaseIterable {
        case header
        case details
        case forecast
        case time
        
        init(fromRawValue: Int) {
            guard let cellType = CellType(rawValue: fromRawValue) else { fatalError("No cell")}
            self = cellType
        }
        
    }
}
