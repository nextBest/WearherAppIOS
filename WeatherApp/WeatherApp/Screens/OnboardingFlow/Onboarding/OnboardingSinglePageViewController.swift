//
//  OnboardingSinglePageViewController.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 21/02/2021.
//  Copyright © 2021 Mateusz Skałkowski. All rights reserved.
//

import UIKit

protocol OnboardingSinglePageViewControllerDelegate: AnyObject {
    func nextPage()
    func letsGo()
}

class OnboardingSinglePageViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet private(set) weak var actionButton: MainButton!
    @IBOutlet private(set) weak var titleLabel: UILabel!
    @IBOutlet private(set) weak var subtitleLabel: UILabel!
    @IBOutlet private(set) weak var onboardingImage: UIImageView!
    
    // MARK: Public properties
    var index: Int = 0
    weak var delegate: OnboardingSinglePageViewControllerDelegate?
    
    // MARK: Private properties
    private let endEndex = 2
    
    // MARK: Lifecycle functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setActionButtonTitle()
    }
    
    // MARK: Private functions
    private func setupViews() {
        switch index {
        case 0:
            setDataToView(title: Localizable.Onboarding.checkCurrentWeatherTitle.text, description: Localizable.Onboarding.checkCurrentWeatherDescription.text, image: UIImage.onboardingWeather)
        case 1:
            setDataToView(title: Localizable.Onboarding.easilyFindYourLocationTitle.text, description: Localizable.Onboarding.easilyFindYourLocationDescription.text, image: UIImage.onboardingLocation)
        case 2:
            setDataToView(title: Localizable.Onboarding.checkWeatherOnAnyPlaceOnEarthTitle.text,
                          description: Localizable.Onboarding.checkWeatherOnAnyPlaceOnEarthDescription.text,
                          image: UIImage.onboardingWorld)
        default:
            break
        }
    }
    
    private func setDataToView(title: String, description: String, image: UIImage) {
        titleLabel.text = title
        subtitleLabel.text = description
        onboardingImage.image = image
    }
    
    private func setActionButtonTitle() {
        if index == endEndex {
            actionButton.setTitle(Localizable.Onboarding.letsGo.text, for: .normal)
        } else {
            actionButton.setTitle(Localizable.Onboarding.next.text, for: .normal)
        }
    }
    
    // MARK: IBAction
    @IBAction func actionButtonClicked(_ sender: UIButton) {
        if index == endEndex {
            delegate?.letsGo()
        } else {
            delegate?.nextPage()
        }
    }
    
}
