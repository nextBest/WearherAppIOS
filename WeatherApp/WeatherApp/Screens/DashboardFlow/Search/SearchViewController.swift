//
//  SearchViewController.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 07/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var presenter: SearchPresenter!
    private var locationList: LocationList = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter.viewLoaded()
    }
    
    // MARK: Setup
    private func setupTableView() {
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.register(CityViewCell.self)
    }
    
}

// MARK: - SearchViewDelegate
extension SearchViewController: SearchViewDelegate {
    func showCityList(locationList: LocationList) {
        self.locationList = locationList
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CityViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(location: locationList[indexPath.item])
        return cell
    }
    
}
