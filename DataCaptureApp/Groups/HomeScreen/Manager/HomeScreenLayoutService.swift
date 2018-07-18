//
//  HomeScreenLayoutService.swift
//  DataCaptureApp
//
//  Created by Evgeny Mahnach on 7/14/18.
//  Copyright © 2018 Evgeny Mahnach. All rights reserved.
//

import UIKit

class HomeScreenLayoutService: NSObject {
    
    // - Init
    fileprivate unowned let viewController: HomeScreenViewController
    
    // - Lifecycle
    
    init(viewController: HomeScreenViewController) {
        self.viewController = viewController
        super.init()
        
        configure()
    }
    
    func viewWillAppear(animated: Bool) {
        viewController.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
}

// MARK: -
// MARK: - Action

extension HomeScreenLayoutService {
    
    func travelMoneyCompetitionButtonAction() {
        pushMoneyCompetitionViewController()
    }
    
    func adminLoginButtonAction() {
//        presentAdminLoginViewController()
        pushAdminLoginViewController()
    }
    
    func mortgagePromotionButtonAction() {
        pushMortgagePromotionViewController()
    }
    
}

// MARK: -
// MARK: - Navigation

extension HomeScreenLayoutService {
    
    func pushMoneyCompetitionViewController() {
        let moneyCompetitionViewController = UIStoryboard(storyboard: .moneyCompetition).instantiateInitialViewController() as! MoneyCompetitionViewController
        
        viewController.navigationController?.pushViewController(moneyCompetitionViewController, animated: true)
    }
    
    func presentAdminLoginViewController() {
        let adminLoginViewController = UIStoryboard(storyboard: .adminLogin).instantiateInitialViewController() as! AdminLoginViewController
        
        adminLoginViewController.completion = { [weak self] in
            self?.pushAdminPanelViewController()
        }
        
        adminLoginViewController.modalTransitionStyle = .crossDissolve
        adminLoginViewController.modalPresentationStyle = .overCurrentContext
        
        viewController.present(adminLoginViewController, animated: true, completion: nil)
    }
    
    func pushAdminLoginViewController() {
        let adminPanelViewController = UIStoryboard(storyboard: .adminLogin).instantiateInitialViewController() as! AdminLoginViewController
        
        viewController.navigationController?.pushViewController(adminPanelViewController, animated: true)
    }
    
    func pushAdminPanelViewController() {
        let adminPanelViewController = UIStoryboard(storyboard: .adminPanel).instantiateInitialViewController() as! AdminPanelViewController
        
        viewController.navigationController?.pushViewController(adminPanelViewController, animated: true)
    }
    
    func pushMortgagePromotionViewController() {
        let mortgagePromotionViewController = UIStoryboard(storyboard: .mortgage).instantiateInitialViewController() as! MortgagePromotionViewController
        
        viewController.navigationController?.pushViewController(mortgagePromotionViewController, animated: true)
    }
    
}

// MARK: -
// MARK: - Configure

fileprivate extension HomeScreenLayoutService {
    
    func configure() {
        setCornerRadiuses()
    }
    
    func setCornerRadiuses() {
        viewController.leftGetStartedButton.layer.cornerRadius = 12
        viewController.rightGetStartedButton.layer.cornerRadius = 12
        
        viewController.blueMainView.layer.cornerRadius = 25
        viewController.redMainView.layer.cornerRadius = 25
    }
    
}
