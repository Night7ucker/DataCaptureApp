//
//  MortgagePromotionLayoutService.swift
//  DataCaptureApp
//
//  Created by Evgeny Mahnach on 7/14/18.
//  Copyright © 2018 Evgeny Mahnach. All rights reserved.
//

import UIKit
import DropDown

class MortgagePromotionLayoutService: NSObject {
    
    // - Init
    fileprivate unowned let viewController: MortgagePromotionViewController
    
    // - UI
    
    let dropDown = DropDown()
    let secondDropDown = DropDown()
    
    // - Manager / Service
    fileprivate let databaseManager = MortgagePromotionDatabaseManager()
    
    // - Lifecycle
    
    init(viewController: MortgagePromotionViewController) {
        self.viewController = viewController
        super.init()
        
        configure()
    }
    
}

// MARK: -
// MARK: - Action

extension MortgagePromotionLayoutService {
    
    func homeButtonAction() {
        viewController.navigationController?.popViewController(animated: true)
    }
    
    func sendNowButtonAction() {
        if isValid() {
            let model = MortgagePromotionPersonModel()
            
            model.customerID = randomString(length: 8)
            
            model.name = (viewController.firstNameTextField.text ?? "") + " " + (viewController.lastNameTextField.text ?? "")
            model.emailAddress = viewController.emailTextField.text ?? ""
            model.phone = viewController.contactTelephoneTextField.text ?? ""
            model.postCode = viewController.postCodeTextField.text ?? ""
            
            model.bestDayToCall = viewController.dayToCallTextField.text ?? ""
            model.bestTimeToCall = viewController.timeToCallTextField.text ?? ""
            
            model.buyerType = viewController.getCurrentBuyerType()
            
            model.isNeededFormPopulation = viewController.checkmarkButton.isChecked
            
            databaseManager.save(object: model)
            viewController.navigationController?.popViewController(animated: true)
        } else {
            presentAlert()
        }
    }
    
}

// MARK: -
// MARK: - Navigation

fileprivate extension MortgagePromotionLayoutService {
    
    func presentAlert() {
        let alert = UIAlertController(title: "Validaiton needed", message: "All fields are required.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        viewController.present(alert, animated: true, completion: nil)
    }
    
}

// MARK: -
// MARK: - Configure

fileprivate extension MortgagePromotionLayoutService {
    
    func configure() {
        setCornerRadius()
        addDropdowns()
    }
    
    func setCornerRadius() {
        viewController.sendNowButton.layer.cornerRadius = 12
        
        viewController.firstNameTextField.layer.cornerRadius = 12
        viewController.lastNameTextField.layer.cornerRadius = 12
        viewController.emailTextField.layer.cornerRadius = 12
        viewController.contactTelephoneTextField.layer.cornerRadius = 12
        viewController.dayToCallTextField.layer.cornerRadius = 12
        viewController.timeToCallTextField.layer.cornerRadius = 12
        viewController.postCodeTextField.layer.cornerRadius = 12
    }
    
    func addDropdowns() {
        viewController.dayToCallTextField.delegate = self
        viewController.timeToCallTextField.delegate = self
        
        viewController.dayToCallTextField.inputView = UIView()
        viewController.timeToCallTextField.inputView = UIView()
        
        // The view to which the drop down will appear on
        dropDown.anchorView = viewController.dayToCallTextField// UIView or UIBarButtonItem
        secondDropDown.anchorView = viewController.timeToCallTextField
        
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in
            self?.viewController.dayToCallTextField.text = item
        }
        
        secondDropDown.selectionAction = { [weak self] (index: Int, item: String) in
            self?.viewController.timeToCallTextField.text = item
        }
        
        dropDown.dataSource = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
        secondDropDown.dataSource = ["Morning", "Afternoon", "Evening"]
    }
    
    func isValid() -> Bool {
        let isRadioButtonChecked = viewController.radioButtons.filter { $0.isChecked }.count > 0
        if !(viewController.firstNameTextField.text?.isEmpty ?? false) &&
            !(viewController.lastNameTextField.text?.isEmpty ?? false) &&
        !(viewController.emailTextField.text?.isEmpty ?? false) &&
        !(viewController.contactTelephoneTextField.text?.isEmpty ?? false) &&
        !(viewController.dayToCallTextField.text?.isEmpty ?? false) &&
            !(viewController.timeToCallTextField.text?.isEmpty ?? false) &&
            !(viewController.postCodeTextField.text?.isEmpty ?? false) &&
             isRadioButtonChecked {
            return true
        }
        return false
    }
    
}

extension MortgagePromotionLayoutService: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == viewController.dayToCallTextField {
            dropDown.show()
        } else {
            secondDropDown.show()
        }
    }
    
}
