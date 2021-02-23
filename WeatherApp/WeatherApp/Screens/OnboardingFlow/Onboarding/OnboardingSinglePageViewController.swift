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
//        switch index {
//        case 0:
//            backgroundImage.image = .onboardingOneBackground
//            imageView.image = .onboardingMission
//            titleLabel.text = Localizable.Onboarding.missionAndVision.text
//            subtitleLabel.text = Localizable.Onboarding.helpingPeople.text
//            setupMissionDescriptionLabel()
//        case 1:
//            backgroundImage.image = .onboardingTwoBackground
//            imageView.image = .onboardingQuestions
//            titleLabel.text = Localizable.Onboarding.invest.text
//            subtitleLabel.isHidden = true
//            descriptionLabel.text = Localizable.Onboarding.investDescription.text
//        case 2:
//            backgroundImage.image = .onboardingThreeBackground
//            imageView.image = .onboardingTips
//            titleLabel.text = Localizable.Onboarding.tips.text
//            subtitleLabel.isHidden = true
//            descriptionLabel.text = Localizable.Onboarding.tipsDescription.text
//        default:
//            break
//        }
    }
    
    private func setActionButtonTitle() {
        if index == endEndex {
           // actionButton.setTitle(Localizable.Onboarding.letsGo.text, for: .normal)
        } else {
          //  actionButton.setTitle(Localizable.Onboarding.next.text, for: .normal)
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
