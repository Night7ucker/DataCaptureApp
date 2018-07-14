//
//  MoneyCompetitionLayoutService.swift
//  DataCaptureApp
//
//  Created by Stanislau Sakharchuk on 7/14/18.
//  Copyright © 2018 Stanislau Sakharchuk. All rights reserved.
//

import UIKit

class MoneyCompetitionLayoutService: NSObject {
    
    // - Init
    fileprivate unowned let viewController: MoneyCompetitionViewController
    
    // - Manager / Service
    fileprivate let databaseManager = MoneyCompetitionDatabaseManager()
    
    // - Lifecycle
    
    init(viewController: MoneyCompetitionViewController) {
        self.viewController = viewController
        super.init()
    }
    
    func viewWillAppear(animated: Bool) {
        viewController.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
}

// MARK: -
// MARK: - Action

extension MoneyCompetitionLayoutService {
    
    func enterButtonAction() {
        let model = MoneyCompetitionPersonModel()
        model.name = viewController.nameTextField.text ?? ""
        model.phone = viewController.mobileNumberTextField.text ?? ""
        model.phone = viewController.emailAddressTextField.text ?? ""
        
        databaseManager.save(object: model)
        viewController.navigationController?.popViewController(animated: true)
    }
    
}

// MARK: -
// MARK: - Configure

fileprivate extension MoneyCompetitionLayoutService {
    
    func configure() {
        
    }
    
}
