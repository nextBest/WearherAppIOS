//
//  OnboardingViewController.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 17/02/2021.
//  Copyright © 2021 Mateusz Skałkowski. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    // MARK: IBOutlet
    @IBOutlet private weak var onboardingView: UIView!
    
    // MARK: Public properties
    var presenter: OnboardingPresenter!
    
    // MARK: Private properties
    private var currentViewControllerIndex = 0
    private var screenCount = 3
    private var onboardingPageViewController: OnboardingPageViewController?
    
    // MARK: Lifecycle function
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageView()
    }
    
    // MARK: Private functions
    private func setupPageView() {
        setupPageControl()
        onboardingPageViewController = OnboardingPageViewController.controllerFromStoryboard(.onboarding)
        setupPageViewController()
    }
    
    private func setupPageControl() {
        let pageControl: UIPageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = UIColor.blue.withAlphaComponent(0.3)
        pageControl.currentPageIndicatorTintColor = .blue
    }
    
    private func setupPageViewController() {
        guard let onboardingPageViewController = onboardingPageViewController else { return }
        addChild(onboardingPageViewController)
        onboardingPageViewController.didMove(toParent: self)
        onboardingPageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        onboardingPageViewController.view.backgroundColor = .clear
        onboardingView.addSubview(onboardingPageViewController.view)
        onboardingPageViewController.view.topAnchor.constraint(equalTo: onboardingView.topAnchor, constant: 0).isActive = true
        onboardingPageViewController.view.bottomAnchor.constraint(equalTo: onboardingView.bottomAnchor, constant: 0).isActive = true
        onboardingPageViewController.view.leadingAnchor.constraint(equalTo: onboardingView.leadingAnchor, constant: 0).isActive = true
        onboardingPageViewController.view.trailingAnchor.constraint(equalTo: onboardingView.trailingAnchor, constant: 0).isActive = true
        onboardingPageViewController.dataSource = self
        onboardingPageViewController.setViewControllers([onboardingSinglePageViewControllerAt(index: 0)], direction: .forward, animated: false, completion: nil)
        for view in  onboardingPageViewController.view.subviews {
            if let subView = view as? UIScrollView {
                subView.isScrollEnabled = false
            }
        }
    }
    
    private func onboardingSinglePageViewControllerAt(index: Int) -> OnboardingSinglePageViewController {
        let onboardingSinglePageViewController = OnboardingSinglePageViewController.controllerFromStoryboard(.onboarding)
        onboardingSinglePageViewController.index = index
        onboardingSinglePageViewController.delegate = self
        return onboardingSinglePageViewController
    }
    
    // MARK: IBAction
    @IBAction func skipButtonClicked(_ sender: UIButton) {
        presenter.finish()
    }
    
}

// MARK: - OnboardingViewDelegate
extension OnboardingViewController: OnboardingViewDelegate {}

// MARK: - UIPageViewControllerDataSource
extension OnboardingViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let onboardingSinglePageViewController = viewController as? OnboardingSinglePageViewController else { return nil }
        currentViewControllerIndex = onboardingSinglePageViewController.index
        if currentViewControllerIndex == 0 {
            return nil
        }
        currentViewControllerIndex -= 1
        return onboardingSinglePageViewControllerAt(index: currentViewControllerIndex)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let onboardingSinglePageViewController = viewController as? OnboardingSinglePageViewController else { return nil }
        currentViewControllerIndex = onboardingSinglePageViewController.index
        if currentViewControllerIndex == screenCount - 1 {
            return nil
        }
        currentViewControllerIndex += 1
        return onboardingSinglePageViewControllerAt(index: currentViewControllerIndex)
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return screenCount
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentViewControllerIndex
    }
    
}

// MARK: - OnboardingSinglePageViewControllerDelegate
extension OnboardingViewController: OnboardingSinglePageViewControllerDelegate {
    func nextPage() {
        guard let onboardingSinglePageViewController = onboardingPageViewController?.viewControllers?.first as? OnboardingSinglePageViewController else { return }
        currentViewControllerIndex = onboardingSinglePageViewController.index
        if currentViewControllerIndex == screenCount - 1 {
            return
        }
        currentViewControllerIndex += 1
        onboardingPageViewController?.setViewControllers([onboardingSinglePageViewControllerAt(index: currentViewControllerIndex)], direction: .forward, animated: true, completion: nil)
    }
    
    func letsGo() {
        presenter.finish()
    }
    
}
