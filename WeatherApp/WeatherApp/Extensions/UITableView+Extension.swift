//
//  UITableView+Extension.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 16/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import UIKit

extension UITableView {
    
    func register(_ cell: UITableViewCell.Type) {
        self.register(UINib(nibName: cell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: cell.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell")
        }
        return cell
    }
}
