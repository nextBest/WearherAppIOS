//
//  UIViewController+Extension.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 03/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import UIKit

extension UIViewController {
    
    private static let loaderViewTag = 999
    
    class func controllerInStoryboard<T: UIViewController>(_ storyboard: UIStoryboard, identifier: String) -> T {
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
    
    class func controllerFromStoryboard(_ storyboard: Storyboard) -> Self {
        return controllerInStoryboard(UIStoryboard(name: storyboard.rawValue, bundle: nil), identifier: String(describing: self))
    }
    
    func showLoader() {
        if view.viewWithTag(UIViewController.loaderViewTag) != nil {
            return
        }
        let loaderView = LoaderView()
        loaderView.translatesAutoresizingMaskIntoConstraints = false
        loaderView.tag = UIViewController.loaderViewTag
        loaderView.backgroundColor = .clear
        self.view.addSubview(loaderView)
        loaderView.startAnimating()
        loaderView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        loaderView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        loaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        loaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }
    
    func hideLoader() {
        if let loaderView = view.viewWithTag(UIViewController.loaderViewTag) {
            loaderView.removeFromSuperview()
        }
    }
}
