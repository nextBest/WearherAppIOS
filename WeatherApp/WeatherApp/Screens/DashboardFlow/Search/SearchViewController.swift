//
//  SearchViewController.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 07/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var noResultsView: UIView!
    @IBOutlet weak var connectionErrorView: UIView!
    @IBOutlet weak var beginningView: UIView!
    @IBOutlet weak var tableView: UITableView!
    var presenter: SearchPresenter!
    private var locationList: LocationList = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewLoaded()
        setupTableView()
    }
    
    // MARK: Setup
    private func setupTableView() {
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CityViewCell.self)
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.topItem?.title = Localizable.Search.title.text
        let searchController = UISearchController()
        searchController.searchBar.delegate = self
        searchController.dimsBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        navigationController?.navigationBar.topItem?.searchController = searchController
    }
    
    private func setupView(hideBeginningView: Bool = true, hideConnectionErrorView: Bool = true, hideNoResultsView: Bool = true,
                           hideTableView: Bool = true) {
        beginningView.isHidden = hideBeginningView
        connectionErrorView.isHidden = hideConnectionErrorView
        noResultsView.isHidden = hideNoResultsView
        tableView.isHidden = hideTableView
    }
    
}

// MARK: - SearchViewDelegate
extension SearchViewController: SearchViewDelegate {
    func showBeginningView() {
        setupView(hideBeginningView: false)
    }
    
    func showConnectionErrorview() {
        setupView(hideConnectionErrorView: false)
    }
    
    func showNoResultsView() {
        setupView(hideNoResultsView: false)
    }
    
    func showCityList(locationList: LocationList) {
        self.locationList = locationList
        tableView.reloadData()
        setupView(hideTableView: false)
    }
}

// MARK: - UITableViewDataSource
extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CityViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.delegate = self
        cell.configure(location: locationList[indexPath.item])
        return cell
    }
    
}

// MARK: - UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        guard let searchText = searchBar.text else {
            return
        }
        presenter.searchCity(by: searchText)
    }
}

// MARK: - UITableViewDelegate
extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.citySelected(woeid: locationList[indexPath.item].woeid)
    }
}

// MARK: - CityViewCellDelegate
extension SearchViewController: CityViewCellDelegate {
    func showPlaceOnMap(location: Location) {
        
    }
}
