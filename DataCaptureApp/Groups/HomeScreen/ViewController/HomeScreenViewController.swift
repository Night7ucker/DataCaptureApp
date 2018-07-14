//
//  HomeScreenViewController.swift
//  DataCaptureApp
//
//  Created by Stanislau Sakharchuk on 7/14/18.
//  Copyright © 2018 Stanislau Sakharchuk. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
    // - Manager / Service
    fileprivate var layoutService: HomeScreenLayoutService!
    
    // - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        layoutService.viewWillAppear(animated: animated)
    }
    
    // - Action
    
    @IBAction func travelMoneyCompetitionButtonAction(_ sender: UIButton) {
        layoutService.travelMoneyCompetitionButtonAction()
    }
    
    @IBAction func adminLoginButtonAction(_ sender: UIButton) {
        layoutService.adminLoginButtonAction()
    }
    
    @IBAction func mortgagePromotionButtonAction(_ sender: UIButton) {
        layoutService.mortgagePromotionButtonAction()
    }
    
}

// MARK: -
// MARK: - Configure

fileprivate extension HomeScreenViewController {
    
    func configure() {
        setupLayoutService()
    }
    
    func setupLayoutService() {
        layoutService = HomeScreenLayoutService(viewController: self)
    }
    
}
