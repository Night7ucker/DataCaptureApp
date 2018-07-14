//
//  HomeScreenLayoutService.swift
//  DataCaptureApp
//
//  Created by Stanislau Sakharchuk on 7/14/18.
//  Copyright © 2018 Stanislau Sakharchuk. All rights reserved.
//

import UIKit

class HomeScreenLayoutService: NSObject {
    
    // - Init
    fileprivate unowned let viewController: HomeScreenViewController
    
    // - Lifecycle
    
    init(viewController: HomeScreenViewController) {
        self.viewController = viewController
        super.init()
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
        presentAdminLoginViewController()
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
        
    }
    
}
