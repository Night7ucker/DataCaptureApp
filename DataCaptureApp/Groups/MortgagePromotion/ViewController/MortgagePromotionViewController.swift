//
//  MortgagePromotionViewController.swift
//  DataCaptureApp
//
//  Created by Evgeny Mahnach on 7/14/18.
//  Copyright © 2018 Evgeny Mahnach. All rights reserved.
//

import UIKit

class MortgagePromotionViewController: UIViewController {
    
    // - UI
    @IBOutlet weak var sendNowButton: UIButton!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var contactTelephoneTextField: UITextField!
    @IBOutlet weak var postCodeTextField: TextField!
    
    @IBOutlet weak var dayToCallTextField: UITextField!
    @IBOutlet weak var timeToCallTextField: UITextField!
    
    @IBOutlet var radioButtons: [RadioButton]!
    @IBOutlet weak var checkmarkButton: RadioButton!
    
    // - Manager / Service
    fileprivate var layoutService: MortgagePromotionLayoutService!
    fileprivate var dataSource: MortgagePromotionDataSource!
    
    // - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    @IBAction func sendNowButtonAction(_ sender: UIButton) {
        layoutService.sendNowButtonAction()
    }
    
    @IBAction func radiouButtonAction(_ sender: RadioButton) {
        for button in radioButtons {
            if sender == button {
                sender.isChecked = true
            } else {
                button.isChecked = false
            }
            button.isChecked ? button.setImage(#imageLiteral(resourceName: "radio_button_checked"), for: .normal) : button.setImage(#imageLiteral(resourceName: "radio_button_unchecked"), for: .normal)
        }
    }
    
    @IBAction func checkmarkButtonAction(_ sender: RadioButton) {
        sender.isChecked = !sender.isChecked
        sender.isChecked ? sender.setImage(#imageLiteral(resourceName: "checkmark_checked"), for: .normal) : sender.setImage(#imageLiteral(resourceName: "checkmark_unchecked"), for: .normal)
    }
    
    @IBAction func homeButtonAction(_ sender: UIButton) {
        layoutService.homeButtonAction()
    }
    
    // - API
    
    func getCurrentBuyerType() -> String {
        return Constant.buyersTypes[radioButtons.index(of: radioButtons.filter { $0.isChecked }.first! )!]
    }
    
}

// MARK: -
// MARK: - Configure

fileprivate extension MortgagePromotionViewController {
    
    func configure() {
        setupLayoutService()
        hideKeyboardWhenTappedAround()
    }
    
    func setupLayoutService() {
        layoutService = MortgagePromotionLayoutService(viewController: self)
    }
    
    enum Constant {
        static let buyersTypes = [
            "First Time Buyer",
            "Moving Home",
            "Remortgage",
            "Buy To Let"
        ]
    }
    
}
