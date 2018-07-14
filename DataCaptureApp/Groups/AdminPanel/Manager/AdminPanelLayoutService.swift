//
//  AdminPanelLayoutService.swift
//  DataCaptureApp
//
//  Created by Stanislau Sakharchuk on 7/14/18.
//  Copyright © 2018 Stanislau Sakharchuk. All rights reserved.
//

import UIKit

class AdminPanelLayoutService: NSObject {
    
    // - Init
    fileprivate unowned let viewController: AdminPanelViewController
    
    // - Lifecycle
    
    init(viewController: AdminPanelViewController) {
        self.viewController = viewController
        super.init()
        
        configure()
    }
    
}

// MARK: -
// MARK: - Action

extension AdminPanelLayoutService {
    
    func logOutButtonAction() {
        viewController.navigationController?.popViewController(animated: true)
    }
    
}

// MARK: -
// MARK: - Configure

fileprivate extension AdminPanelLayoutService {
    
    func configure() {
        
    }
    
}
