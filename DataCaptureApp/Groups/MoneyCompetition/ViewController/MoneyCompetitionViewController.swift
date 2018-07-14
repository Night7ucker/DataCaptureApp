//
//  MoneyCompetitionViewController.swift
//  DataCaptureApp
//
//  Created by Stanislau Sakharchuk on 7/14/18.
//  Copyright © 2018 Stanislau Sakharchuk. All rights reserved.
//

import UIKit

class MoneyCompetitionViewController: UIViewController {
    
    // - UI
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var emailAddressTextField: UITextField!
    
    // - Manager / Service
    fileprivate var layoutService: MoneyCompetitionLayoutService!
    
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
    
    @IBAction func enterButtonAction(_ sender: UIButton) {
        layoutService.enterButtonAction()
    }
    
}

fileprivate extension MoneyCompetitionViewController {
    
    func configure() {
        setupLayoutService()
    }
    
    func setupLayoutService() {
        layoutService = MoneyCompetitionLayoutService(viewController: self)
    }
    
}
