//
//  AdminLoginLayoutService.swift
//  DataCaptureApp
//
//  Created by Stanislau Sakharchuk on 7/14/18.
//  Copyright © 2018 Stanislau Sakharchuk. All rights reserved.
//

import UIKit

class AdminLoginLayoutService: NSObject {
    
    // - Init
    fileprivate unowned let viewController: AdminLoginViewController
    
    // - Lifecycle
    
    init(viewController: AdminLoginViewController) {
        self.viewController = viewController
        super.init()
    }
    
    func viewWillAppear(animated: Bool) {
        viewController.mainView.animateAppearing()
    }
    
    func viewWillDisappear(animted: Bool) {
        viewController.mainView.animateDisappearing(with: 1)
    }
    
    // - Tap
    
    func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first?.view != viewController.mainView {
            viewController.dismiss(animated: true, completion: nil)
        }
    }
    
}

// MARK: -
// MARK: - Action

extension AdminLoginLayoutService {
    
    func enterButtonAction() {
        viewController.mainView.animateDisappearing(with: 1)
        viewController.completion()
        viewController.dismiss(animated: true, completion: nil)
    }
    
}

// MARK: -
// MARK: - Configure

fileprivate extension AdminLoginLayoutService {
    
    func configure() {
        
    }
    
}
