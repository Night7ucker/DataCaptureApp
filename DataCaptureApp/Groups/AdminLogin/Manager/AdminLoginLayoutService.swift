//
//  AdminLoginLayoutService.swift
//  DataCaptureApp
//
//  Created by Evgeny Mahnach on 7/14/18.
//  Copyright © 2018 Evgeny Mahnach. All rights reserved.
//

import UIKit

class AdminLoginLayoutService: NSObject {
    
    // - Init
    fileprivate unowned let viewController: AdminLoginViewController
    
    // - Lifecycle
    
    init(viewController: AdminLoginViewController) {
        self.viewController = viewController
        super.init()
        
        configure()
    }
    
}

// MARK: -
// MARK: - Action

extension AdminLoginLayoutService {
    
    func homeButtonAction() {
//        viewController.dismiss(animated: true, completion: nil)
        viewController.navigationController?.popViewController(animated: true)
    }
    
    func loginButtonAction() {
        isValid() ? pushAdminPanelViewController() : presentValidationAlert()
    }
    
}

// MARK: -
// MARK: - Navigation

fileprivate extension AdminLoginLayoutService {
    
    func pushAdminPanelViewController() {
        let adminPanelViewController = UIStoryboard(storyboard: .adminPanel).instantiateInitialViewController() as! AdminPanelViewController
        
        viewController.navigationController?.pushViewController(adminPanelViewController, animated: true)
    }
    
    func presentValidationAlert() {
        let alertViewController = UIAlertController(title: nil, message: "Wrong Login or Password", preferredStyle: .alert)
        
        alertViewController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        viewController.present(alertViewController, animated: true, completion: nil)
    }
    
}

// MARK: -
// MARK: - Configure

fileprivate extension AdminLoginLayoutService {
    
    func configure() {
//        setMainViewBackgroundColor()
        setCornerRadiuses()
        underlineResetPasswordButtonTitle()
    }
    
    func isValid() -> Bool {
        if viewController.emailTextField.text?.lowercased() == "notemachine" &&
            viewController.passwordTextField.text?.lowercased() == "elvicta" {
            return true
        }
        return false
    }
    
    func underlineResetPasswordButtonTitle() {
        let attrs = [
            NSAttributedStringKey.underlineColor: UIColor.white,
            NSAttributedStringKey.foregroundColor: UIColor.white,
            NSAttributedStringKey.underlineStyle : 1
            ] as [NSAttributedStringKey : Any]
        
        let attributedString = NSMutableAttributedString(string:"")
        
        let buttonTitleStr = NSMutableAttributedString(string:"reset password", attributes: attrs)
        attributedString.append(buttonTitleStr)
        viewController.resetPasswordButton.setAttributedTitle(attributedString, for: .normal)
    }
    
    func setCornerRadiuses() {
        viewController.loginButton.layer.cornerRadius = 12
        
        viewController.emailTextField.layer.cornerRadius = 12
        viewController.passwordTextField.layer.cornerRadius = 12
    }
    
}
