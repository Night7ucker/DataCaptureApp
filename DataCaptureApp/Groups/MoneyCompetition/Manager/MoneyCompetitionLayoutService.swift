//
//  MoneyCompetitionLayoutService.swift
//  DataCaptureApp
//
//  Created by Evgeny Mahnach on 7/14/18.
//  Copyright © 2018 Evgeny Mahnach. All rights reserved.
//

import UIKit

class MoneyCompetitionLayoutService: NSObject {
    
    // - Init
    fileprivate unowned let viewController: MoneyCompetitionViewController
    
    // - Manager / Service
    fileprivate let databaseManager = MoneyCompetitionDatabaseManager()
    
    // - Flag
    fileprivate var isKeyboardShowing = false
    
    // - Lifecycle
    
    init(viewController: MoneyCompetitionViewController) {
        self.viewController = viewController
        super.init()
        
        configure()
    }
    
    func viewWillAppear(animated: Bool) {
        //        viewController.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
}

// MARK: -
// MARK: - Action

extension MoneyCompetitionLayoutService {
    
    func enterButtonAction() {
        if isValid() {
            let model = MoneyCompetitionPersonModel()
            model.customerID = randomString(length: 8)
            model.name = (viewController.firstNameTextField.text ?? "")
                + " " + (viewController.lastNameTextField.text ?? "")
            model.phone = viewController.mobileNumberTextField.text ?? ""
            model.emailAddress = viewController.emailAddressTextField.text ?? ""
            model.postCode = viewController.postCodeTextField.text ?? ""
            
            model.instagramID = viewController.instagramTextField.text ?? ""
            model.facebookID = viewController.facebookTextField.text ?? ""
            model.twitterID = viewController.twitterTextField.text ?? ""
            
            model.isNeededFormPopulation = viewController.checkmarkButton.isChecked
            
            databaseManager.save(object: model)
            viewController.navigationController?.popViewController(animated: true)
        } else {
            presentAlert()
        }
        
    }
    
    func homeButtonAction() {
        viewController.navigationController?.popViewController(animated: true)
    }
    
}

// MARK: -
// MARK: - Navigation

fileprivate extension MoneyCompetitionLayoutService {
    
    func presentAlert() {
        let alert = UIAlertController(title: "Validaiton needed", message: "All fields are required (except social networks info).", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        viewController.present(alert, animated: true, completion: nil)
    }
    
}

// MARK: -
// MARK: - Text Field Delegate

extension MoneyCompetitionLayoutService: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (textField == viewController.facebookTextField ||
            textField == viewController.instagramTextField ||
            textField == viewController.twitterTextField) &&
            !isKeyboardShowing {
            UIView.animate(withDuration: 0.3) { [weak self] in
                self?.viewController.view.frame.origin.y -= 150
            }
            isKeyboardShowing = true
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (textField == viewController.facebookTextField ||
            textField == viewController.instagramTextField ||
            textField == viewController.twitterTextField) &&
            isKeyboardShowing {
            UIView.animate(withDuration: 0.3) { [weak self] in
                self?.viewController.view.frame.origin.y += 150
            }
            isKeyboardShowing = false
        }
    }
    
}

// MARK: -
// MARK: - Configure

fileprivate extension MoneyCompetitionLayoutService {
    
    func configure() {
        setCornerRadius()
        setTextFieldsDelegates()
    }
    
    func setTextFieldsDelegates() {
        viewController.twitterTextField.delegate = self
        viewController.facebookTextField.delegate = self
        viewController.instagramTextField.delegate = self
    }
    
    func setCornerRadius() {
        viewController.sendNowButton.layer.cornerRadius = 12
        
        viewController.firstNameTextField.layer.cornerRadius = 12
        viewController.lastNameTextField.layer.cornerRadius = 12
        viewController.emailAddressTextField.layer.cornerRadius = 12
        viewController.mobileNumberTextField.layer.cornerRadius = 12
        
        viewController.instagramTextField.layer.cornerRadius = 12
        viewController.facebookTextField.layer.cornerRadius = 12
        viewController.twitterTextField.layer.cornerRadius = 12
        viewController.postCodeTextField.layer.cornerRadius = 12
    }
    
    func isValid() -> Bool {
        if !(viewController.firstNameTextField.text?.isEmpty ?? false) &&
            !(viewController.lastNameTextField.text?.isEmpty ?? false) &&
            !(viewController.emailAddressTextField.text?.isEmpty ?? false) &&
            !(viewController.mobileNumberTextField.text?.isEmpty ?? false) &&
            !(viewController.postCodeTextField.text?.isEmpty ?? false) {
            return true
        }
        return false
    }
    
}
